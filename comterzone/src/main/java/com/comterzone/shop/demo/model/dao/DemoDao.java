package com.comterzone.shop.demo.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.comterzone.shop.demo.model.vo.Demo;

public interface DemoDao {
	int insertDemo(SqlSessionTemplate session, Demo d);
	
	List<Demo> selectDemo(SqlSessionTemplate session);
}






