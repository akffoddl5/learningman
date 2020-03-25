package com.six.web.websocket;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.six.web.admin.AdminVO;
import com.six.web.user.UserVO;

public class WebSocket extends TextWebSocketHandler implements InitializingBean {
	public static Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();      // 세션 싹다 있는거
	public static Set<WebSocketSession> adminSession = new HashSet<WebSocketSession>();    // admin session 싹다
	public static Map<WebSocketSession , List<String>> sessionInfoList = new HashMap<>(); // 해당세션 정보 0 : id / 1 : type
	public static Map<WebSocketSession, Set<WebSocketSession>> roomList = new HashMap<>(); // 해당세션에 대한 세션들
    public WebSocket(){
        super();
    }
    // 사용자가 나갈경우 불러오는 메소드 웹소켓세션객체에서 리무브한다
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        super.afterConnectionClosed(session, status);
        sessionSet.remove(session);
        adminSession.remove(session);
        sessionInfoList.remove(session);
        roomList.remove(session);
        System.out.println("connection close");
    }
// 사용자가 웹소켓에 연결되면 불러온다 add 한다
    @Override
    public void afterConnectionEstablished(WebSocketSession session)
            throws Exception {
    	System.out.println("연결 add");
        super.afterConnectionEstablished(session);
        System.out.println("=========연결 세션 정보 ==========");
        
        System.out.println(session.getId());
        System.out.println(session.getHandshakeHeaders());
        System.out.println(session.getUri());
        System.out.println(session.toString());
        Map<String,Object> mp = session.getAttributes();
        String type = (String)mp.get("type");
        
        
        System.out.println("타입은 --------->" + type);
        if(type == null) return;
        List<String> list = new ArrayList<>();
        
        if(type.equals("admin")) {
        	AdminVO adminVO = (AdminVO)mp.get("vo");
        	list.add(adminVO.getId());
        	list.add("admin");
        	list.add(session.getId());
        	adminSession.add(session);
        	System.out.println("admin size is :" + adminSession.size());
        }else {
        	UserVO userVO = (UserVO)mp.get("vo");
        	list.add(userVO.getId());
        	list.add("user");
        	list.add(session.getId());
        	roomList.put(session, adminSession);
        	System.out.println("유저라 방팜. 현재 room size : "+roomList.size());
        }
        System.out.println("=============================");
        sessionInfoList.put(session, list);
        sessionSet.add(session);
    }
// 사용자가 채팅할 내용을 적고 보내기를 눌르면 불러온다
    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
    	System.out.println("받고 보내고 :" + message.getPayload().toString());
    	
        super.handleMessage(session, message);
        String message_s = message.getPayload().toString();
        String[] messages = message_s.split("!learnChatKey!");
        System.out.println(Arrays.toString(messages));
        String type;
        String destinationSessionId="";
        String myId = "";
        if(messages.length >= 2) {
        	message_s = messages[1];
        	myId=messages[0];
        }
        if(messages.length ==3) {
        	destinationSessionId = messages[2];
        }
        if(sessionInfoList.get(session).get(1).equals("user")) {
        	System.out.println("user가 쓴거임");
        	type="user";
        }else {
        	System.out.println("admin이 쓴거임");
        	type="admin";
        }
        sendMessage(message_s, type ,session,destinationSessionId,myId);
    }
//에러
    @Override
    public void handleTransportError(WebSocketSession session,
            Throwable exception) throws Exception {
    	System.out.println("chat error");
    }
 
    @Override
    public boolean supportsPartialMessages() {
    	System.out.println("무언가 1");
        return super.supportsPartialMessages();
    }
// 함수를 따로 정의하였다 메세지를 보내는 함수이다 웹소켓에 저장한 사용자들에게 모두다 보낸다
    public void sendMessage (String message , String type, WebSocketSession session, String sessionId, String myId){
    	System.out.println("send : " + message);
    	String json = "{\"type\":\"chat\",\"chat\":\""+message+"\",\"name\":\" " + myId + "\" ,\"date\":\""+new Date()+"\"}" ;
    	System.out.println("send2 : " + json );
    	
    	if(type.equals("admin")) {
    		System.out.println("flag1" + sessionId +"  ; "  +message + ";");
    		System.out.println("============이거랑 관련 100 퍼 ============");
    		System.out.println("sessionInfo size : " + sessionInfoList.size());
    		
    		System.out.println("======================================");
    		for(WebSocketSession wSession : sessionInfoList.keySet()) {
    			if(sessionInfoList.get(wSession).get(0).equals(sessionId)) {
    				try{
    					for(WebSocketSession roomPeopleSession : roomList.get(wSession))
    					{
    						System.out.println("kkk");
    						wSession.sendMessage(new TextMessage(json));  // user 가 보내게? 이게 맞는지 모름 아직 맞겠찌 당연히
    					}
                        // 그니까 어드민에서는 메시지를  보낼 대상 id + !learningmanChatKey! + message내용으로 보내야댐.
                    }catch (Exception ignored){
//                        this.logger.error("fail to send message!", ignored);
                    }
    			}
    		}
    		if (session.isOpen()){
                try{
                    session.sendMessage(new TextMessage(json));
                }catch (Exception ignored){
//                    this.logger.error("fail to send message!", ignored);
                }
    		}
    		
    		
    	}else {
    		System.out.println("flag2");
    		for(WebSocketSession wSession : roomList.get(session)) {
    			if (wSession.isOpen()){
                  try{
                      wSession.sendMessage(new TextMessage(json));
                  }catch (Exception ignored){
//                      this.logger.error("fail to send message!", ignored);
                  }
              }
    		}
    		if (session.isOpen()){
                try{
                    session.sendMessage(new TextMessage(json));
                }catch (Exception ignored){
//                    this.logger.error("fail to send message!", ignored);
                }
    		}
    	}
    	
//        for (WebSocketSession session2: this.sessionSet){
//            if (session2.isOpen()){
//                try{
//                    session2.sendMessage(new TextMessage(json));
//                }catch (Exception ignored){
////                    this.logger.error("fail to send message!", ignored);
//                }
//            }
//        }
    }
// thread로 현새기각을 클라이언트에게 주기적으로 
    @Override
    public void afterPropertiesSet() throws Exception {
        Thread thread = new Thread(){
            int i=0;
            @Override
            public void run() {
                while (true){
                    try {
                        String json = String.format("{\"type\":\"time\",\"time\":\"%s\"}", System.currentTimeMillis());
                        //sendMessage(json);
                        Thread.sleep(7000);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                        break;
                    }
                }
            }
        };
 
        thread.start();
    }
	
}
