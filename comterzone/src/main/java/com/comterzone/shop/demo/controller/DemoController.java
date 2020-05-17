package com.comterzone.shop.demo.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.comterzone.shop.demo.model.service.DemoService;
import com.comterzone.shop.demo.model.vo.Demo;

@Controller
public class DemoController {
	
	@Autowired
	DemoService service;
	
	
	@RequestMapping("/demo/demo.do")
	public String demo() {
		//처리로직구현
		return "demo/demo";
	}
	//기본으로 매핑매소드가 가질수 있는 파라미터값
	/*
	 * 1. HttpServletReqeust
	 * 2. HttpServletResponse
	 * 3. HttpSession
	 * 4. java.util.Locale
	 * 5. InputStream/Reader
	 * 6. OutputStream/Writer
	 * 7. Map
	 * 8. Model
	 * 9. ModelAndView
	 * 10. Command(vo객체)
	 * 11. SessionStatus : session이랑 비슷한 객체
	 * 어노테이션으로 표현하는 값
	 * @PathVariable : 요청한 주소의 경로를 가져올때 사용 
	 * @RequestParam : 클라이언트가 보낸 파라미터값
	 * @ReqeustHeader : 요청한 내용의 header
	 * @CookieValue : 쿠키값
	 * @RequestBody : 보낸데이터를 json으로 받는 것
	 */
	
	
	@RequestMapping("/demo/basicParam.do")
	public String basicParam(HttpServletRequest req, 
			HttpServletResponse res) {
		//DB에 클라이언트가 보낸 데이터를 저장
		
		String name=req.getParameter("devName");
		int age=Integer.parseInt(req.getParameter("devAge"));
		String email=req.getParameter("devEmail");
		String gender=req.getParameter("devGender");
		String[] devLang=req.getParameterValues("devLang");
		System.out.println(name+age+email+gender);
		for(String l : devLang) {
			System.out.println(l);
		}
		Demo d=new Demo(0,name, age, email,gender,devLang);
		
		service.insertDemo(d);
		
		
		return "demo/demoView";
	}
	
	@RequestMapping("/demo/requestParam.do")
//	public String requestParam(@RequestParam(value="devName") String name,
//								@RequestParam(required = false,defaultValue="18") int devAge,
//								@RequestParam String devEmail,
//								@RequestParam String devGender,
//								@RequestParam String[] devLang) {
	public String requestParam(String devName,int devAge,String devEmail,
								String devGender,String[] devLang) {
		
		System.out.println(devName+devAge+devEmail+devGender);
		
		Demo d=new Demo(0,devName,devAge,devEmail,devGender,devLang);
		service.insertDemo(d);
		
		return "demo/demoView";
	}
	
	@RequestMapping("/demo/requestMap.do")
	public String requestMap(@RequestParam Map map,String[] devLang) {
		
		map.put("devLang", devLang);
		System.out.println(map);
		
		return "demo/demoView";
	}
	
	@RequestMapping("/demo/requestCommand.do")
	public String requestCommand(Demo d,/*HttpServletRequest res*/
								Model m) {
		
		System.out.println(d);
		int result=service.insertDemo(d);
		//res.setAttribute("demo", d);
		m.addAttribute("demo",d);
		
		return "demo/demoView";
	}
	
	
	@RequestMapping("/demo/selectDemo.do")
	public String demoList(Model m) {
		List<Demo>list=service.selectDemo();
		m.addAttribute("list",list);
		return "demo/demoList";
	}
	
	
	
}
