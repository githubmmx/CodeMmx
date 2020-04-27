package com.dy.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface EmpDao {

	List<Map<String,String>> selectList(SqlSession session);
	
	//List<Map<String,String>> selectKeyList(SqlSession session,Map<String,String> param);
	List<Map<String,String>> selectKeyList(SqlSession session,Map<String,Object> param);
	
	List<Map<String,String>> selectEmpList(SqlSession session, int cPage,int numPerpage);
	
	int selectEmpCount(SqlSession session);
	
}





