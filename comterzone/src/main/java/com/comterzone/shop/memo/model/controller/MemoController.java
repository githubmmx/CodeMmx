package com.comterzone.shop.memo.model.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.comterzone.shop.memo.model.service.MemoService;

@Controller
public class MemoController {
	
	@Autowired
	private MemoService service;
	
	@RequestMapping("/memo/memo.do")
	public ModelAndView memo(ModelAndView mv) {
		List<Map<String, String>>  memos=service.selectMemo();
		//객체넣기
		mv.addObject("list",memos);
		//화면
		mv.setViewName("memo/memo");
		
		return mv;
	}
	
	@RequestMapping("/memo/insertMemo")
	public ModelAndView insertMemo(ModelAndView mv,@RequestParam Map<String,String> map) {
		
		int result=service.insertMemo(map);
		
		mv.setViewName("redirect:/memo/memo.do");
		
		return mv;
	}
	
}







