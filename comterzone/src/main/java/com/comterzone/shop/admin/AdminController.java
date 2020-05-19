package com.comterzone.shop.admin;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
	
	@RequestMapping(value = "/admin/admin")
	public String admin(Locale locale, Model model) {
		return "admin/admin";
	}
	
	@RequestMapping("/admin/addProduct")
	public String addProduct() {
		return "/admin/addProduct";
	}
	
	@RequestMapping("/admin/SmartEditor2Skin.html")
	public String smartEditorRedirect() {
		return "redirect:/admin/SmartEditor2Skin.html";
	}
	
	
	
	
	
}
