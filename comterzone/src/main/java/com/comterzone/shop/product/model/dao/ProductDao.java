package com.comterzone.shop.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.comterzone.shop.product.model.vo.Category;

public interface ProductDao {

	List<Category> selectCategoryList(SqlSessionTemplate session);

}
