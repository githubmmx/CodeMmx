package com.comterzone.shop.memo.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comterzone.shop.memo.model.dao.MemoDao;
@Service
public class MemoServiceImpl implements MemoService{
	@Autowired
	private MemoDao dao;
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Map<String, String>>  selectMemo() {
		return dao.selectMemo(session);
	}

	@Override
	public int insertMemo(Map<String, String> map) {
		return dao.insertMemo(session, map);
	}

	
	
	
	
}
