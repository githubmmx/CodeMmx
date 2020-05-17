package com.comterzone.shop.codetest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CodeTestController {
	
	@RequestMapping("/test/test")
	public String test() {
		return "/test/testView";
	}
	
	@RequestMapping("/test/result")
	public String result(@RequestParam String term) {
		
		
		return "";
	}
}
