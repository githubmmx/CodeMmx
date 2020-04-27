package com.dy.model.service;

import static com.dy.common.SqlSessionTemplate.getSession;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dy.model.dao.EmpDao;
import com.dy.model.dao.EmpDaoImpl;
public class EmpServiceImpl implements EmpService {
	private EmpDao dao=new EmpDaoImpl();
	@Override
	public List<Map<String, String>> selectList() {
		SqlSession session=getSession();
		List<Map<String,String>> list=dao.selectList(session);
		session.close();
		return list;
	}
	@Override
	//public List<Map<String, String>> selectKeyList(Map<String, String> param) {
	public List<Map<String, String>> selectKeyList(Map<String, Object> param) {
		SqlSession session=getSession();
		List<Map<String,String>> list=dao.selectKeyList(session,param);
		session.close();
		return list;
	}
	@Override
	public List<Map<String, String>> selectEmpList(int cPage, int numPerpage) {
		SqlSession session= getSession();
		List<Map<String,String>> list=dao.selectEmpList(session,cPage,numPerpage);
		session.close();
		return list;
	}
	@Override
	public int selectEmpCount() {
		SqlSession session=getSession();
		int count=dao.selectEmpCount(session);
		session.close();
		return count;
	}
	
	
	
	
	
	
}
