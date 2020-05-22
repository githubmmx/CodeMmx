package com.comterzone.shop.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.comterzone.shop.product.model.vo.Category;

@Repository
public class ProductDaoImpl implements ProductDao{

	@Override
	public List<Category> selectCategoryList(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("product.selectCategoryList");
	}

}
