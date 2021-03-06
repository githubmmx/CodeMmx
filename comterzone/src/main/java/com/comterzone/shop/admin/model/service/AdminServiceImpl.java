package com.comterzone.shop.admin.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comterzone.shop.product.model.dao.ProductDao;
import com.comterzone.shop.product.model.vo.Category;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private Logger logger;
	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private ProductDao dao;
	
	@Override
	public List<Category> selectCategoryList() {
		// TODO Auto-generated method stub
		return dao.selectCategoryList(session);
	}

}
