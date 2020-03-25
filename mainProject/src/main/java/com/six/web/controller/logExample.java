package com.six.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class logExample {
	private static final Logger logger = LoggerFactory.getLogger(logExample.class);
	
	@RequestMapping("/log.do")
	@ResponseBody
	public String logExam() {
		
		        //logger.trace("trace");
		       // logger.debug("debug");
		        logger.info("info");
		       // logger.warn("warn");
		       // logger.error("error");
		        
		        return "제발좀 되라";
	}
}