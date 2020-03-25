package com.six.web.kakaoPay;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.six.web.lesson.CategoryVO;
import com.six.web.lesson.LessonService;
import com.six.web.notification.NotificationService;
import com.six.web.notification.NotificationVO;
import com.six.web.pay.PayListService;
import com.six.web.pay.PayListVO;
import com.six.web.user.UserService;
import com.six.web.user.UserVO;

@Controller
public class KakaoPayController {
	
	//@Setter(onMethod_ = @Autowired)
	@Autowired
    private KakaoPay kakaopay;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PayListService payListService; 
	
	@Autowired
	private LessonService lessonService;
	@Autowired
	private NotificationService notificationService;
    
    
    @GetMapping("/kakaoPay.do")
    public void kakaoPayGet() {
        System.out.println("kakaoPay get !!!!!");
    }
    
    @PostMapping("/kakaoPay.do")
    public String kakaoPay(HttpServletRequest request) {
    	System.out.println("kakaoPay post @@@@");
    	String payPoint_s = request.getParameter("payPoint");
        System.out.println("flag1 : "+payPoint_s);
        int payPoint = Integer.parseInt(payPoint_s);
        
        UserVO userVO = (UserVO) request.getSession().getAttribute("vo");
        String partner_user_id = userVO.getId();
        
        
        return "redirect:" + kakaopay.kakaoPayReady(payPoint_s, partner_user_id);
 
    }
    
    @GetMapping("/kakaoPaySuccess.do")
    public ModelAndView kakaoPaySuccess(@RequestParam("pg_token") String pg_token, String payPoint, ModelAndView mav, HttpServletRequest request) {
    	System.out.println("kakaoPaySuccess get @@@@@@@");
    	System.out.println("kakaoPaySuccess pg_token : " + pg_token);
    	UserVO userVO = (UserVO) request.getSession().getAttribute("vo");
    	String partner_user_id = userVO.getId();
    	KakaoPayApprovalVO kakaoPayAppro = kakaopay.kakaoPayInfo(pg_token, payPoint, partner_user_id);
    	int point = kakaoPayAppro.getAmount().getTotal();
    	userVO.setPoint(userVO.getPoint() + point);
    	userService.updatePoint(userVO);
    	
    	PayListVO payListVO = new PayListVO();
        payListVO.setId(userVO.getId());
        payListVO.setPrice(point);
        payListVO.setType("kakaoPay");
        payListService.insertPayList(payListVO);
    	
    	System.out.println("flag5");
        mav.addObject("info", kakaoPayAppro);
        System.out.println("flag6");
        mav.setViewName("/lnuser/kakaoPaySuccess");
        System.out.println("flag7");
        return mav;
        
    }
    
    @RequestMapping("/kakaoPay.go")
    public ModelAndView goKakaoPay(ModelAndView mav) {
    	System.out.println("go kakaoPay");
    	mav.setViewName("/lnuser/kakaoPay");
    	return mav;
    }
    
    @RequestMapping("/kakaoPayFail.go")
    public ModelAndView goKakaoPayFail(ModelAndView mav){
    	System.out.println("go kakaoPayFail");
    	mav.setViewName("/lnuser/kakaoPayFail");
    	return mav;
    }
    
    @RequestMapping(value="/point.go")
	public ModelAndView  goPoint(ModelAndView mav, HttpServletRequest request) {
		System.out.println("go point");
		UserVO userVO = (UserVO)request.getSession().getAttribute("vo");
		List<PayListVO> payList = payListService.getMyPayList(userVO);
		List<CategoryVO> categoryList = lessonService.getCategoryList();
		mav.addObject("categoryList",categoryList);
		mav.addObject("payList", payList);
		mav.setViewName("/lnuser/point");
		
		//알람 받기
				if(userVO != null) {
					List<NotificationVO> notificationList = notificationService.getNotificationList(userVO);
					System.out.println(notificationList);
					System.out.println(">>"+notificationList.size());
					mav.addObject("notificationList", notificationList);
				}
		
		return mav;
	}
}
