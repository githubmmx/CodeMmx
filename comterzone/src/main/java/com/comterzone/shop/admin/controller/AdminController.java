package com.comterzone.shop.admin.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.comterzone.shop.admin.model.service.AdminService;
import com.comterzone.shop.product.model.vo.Category;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping(value = "/admin/admin")
	public String admin(Locale locale, Model model) {
		return "admin/admin";
	}
	
	@RequestMapping("/admin/addProduct")
	public ModelAndView addProduct(ModelAndView mv) {
		
		List<Category> list = service.selectCategoryList();
		Map<String, List<Category>> map = new HashMap();
		for (Category category : list) {
			String level = ""+category.getLevel();
			if(!map.containsKey(level)) {
				map.put(level, new ArrayList<Category>());
			}
			map.get(level).add(category);
		}
		
		
		for (Entry<String, List<Category>> entry : map.entrySet()) {
			System.out.println(entry.getValue().size());
		}
		
		
		Set<Entry<String,List<Category >>> set = map.entrySet();
		List<Entry<String,List<Category>>> l = new ArrayList(set);
		Collections.sort(l,new Comparator<Entry<String,List<Category>>>() {
			@Override
			public int compare(Entry<String, List<Category>> o1, Entry<String, List<Category>> o2) {
				// TODO Auto-generated method stub
				return o1.getKey().compareTo(o2.getKey());
			}
		});
		
		System.out.println(l);
		
	
	
		mv.addObject("categorys", l);
		
		return mv;
	}
	

	
	
	
	
}
