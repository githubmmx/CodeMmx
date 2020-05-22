package com.comterzone.shop.product.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comterzone.shop.product.model.dao.ProductDao;
import com.comterzone.shop.product.model.vo.Category;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	Logger logger;
	@Autowired
	private ProductDao dao;
	@Autowired
	private SqlSessionTemplate session;
	
	
	@Override
	public List<Category> selectCategoryList() {
		// TODO Auto-generated method stub
		
		return dao.selectCategoryList(session);
	}

}
