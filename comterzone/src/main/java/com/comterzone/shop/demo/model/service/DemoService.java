package com.comterzone.shop.demo.model.service;

import java.util.List;

import com.comterzone.shop.demo.model.vo.Demo;

public interface DemoService {
	
	int insertDemo(Demo d); 
	
	List<Demo> selectDemo();
}
