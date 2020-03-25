package com.six.web.kakaoPay;

import java.net.URI;
import java.net.URISyntaxException;

import javax.servlet.http.HttpServletRequest;

import com.six.web.kakaoPay.KakaoPayApprovalVO;
import com.six.web.kakaoPay.KakaoPayReadyVO;
import com.six.web.user.UserVO;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

@Service

public class KakaoPay {
	
	 private static final String HOST = "https://kapi.kakao.com";
	    
	 private KakaoPayReadyVO kakaoPayReadyVO;
	 
	 public String kakaoPayReady(String payPoint, String partner_user_id) {
		
        RestTemplate restTemplate = new RestTemplate();

        
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "f215a579051762f5eaebe6aa6f925045");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        System.out.println("headers : " + headers);
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", partner_user_id);
        params.add("item_name", "Learningman Point");
        params.add("quantity", "1");
        params.add("total_amount", payPoint);
        params.add("tax_free_amount", "100");
        params.add("approval_url", "http://ec2-15-165-204-212.ap-northeast-2.compute.amazonaws.com/learningman/kakaoPaySuccess.do");
        params.add("cancel_url", "http://ec2-15-165-204-212.ap-northeast-2.compute.amazonaws.com/learningman/kakaoPayFail.go");
        params.add("fail_url", "http://ec2-15-165-204-212.ap-northeast-2.compute.amazonaws.com/learningman/kakaoPayFail.go");
        
        System.out.println("params : " + params);
 
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            
            System.out.println("flag2");
            return kakaoPayReadyVO.getNext_redirect_pc_url();
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return "/pay";
        
    }
	 
	 public KakaoPayApprovalVO kakaoPayInfo(String pg_token, String payPoint, String partner_user_id) {
		 
	        RestTemplate restTemplate = new RestTemplate();
	 
	        
	        // 서버로 요청할 Header
	        HttpHeaders headers = new HttpHeaders();
	        headers.add("Authorization", "KakaoAK " + "f215a579051762f5eaebe6aa6f925045");
	        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
	        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
	 
	        // 서버로 요청할 Body
	        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
	        params.add("cid", "TC0ONETIME");
	        params.add("tid", kakaoPayReadyVO.getTid());
	        params.add("partner_order_id", "1001");
	        params.add("partner_user_id", partner_user_id);
	        params.add("pg_token", pg_token);
	        params.add("total_amount", payPoint);
	        
	        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
	        
	        try {
	        	System.out.println("flag3");
	            KakaoPayApprovalVO kakaoPayApprovalVO =  restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
	            System.out.println("flag4");
	          
	            return kakaoPayApprovalVO;
	        
	        } catch (RestClientException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (URISyntaxException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	        
	        return null;
	    }
}
