package com.dy.model.service;

import java.util.List;
import java.util.Map;

public interface EmpService {

	List<Map<String,String>> selectList();
	//List<Map<String,String>> selectKeyList(Map<String,String> param);
	List<Map<String,String>> selectKeyList(Map<String,Object> param);
	
	List<Map<String,String>> selectEmpList(int cPage, int numPerpage);
	
	int selectEmpCount();
	
	
}
