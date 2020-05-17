package com.comterzone.shop.demo.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comterzone.shop.demo.model.dao.DemoDao;
import com.comterzone.shop.demo.model.vo.Demo;

@Service
public class DemoServiceImpl implements DemoService {
	
	@Autowired
	private DemoDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int insertDemo(Demo d) {
		return dao.insertDemo(session,d);
	}

	@Override
	public List<Demo> selectDemo() {
		return dao.selectDemo(session);
	}
	
	

}
