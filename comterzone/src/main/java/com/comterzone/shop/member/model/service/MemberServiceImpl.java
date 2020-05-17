package com.comterzone.shop.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comterzone.shop.member.model.dao.MemberDao;
import com.comterzone.shop.member.model.vo.Member;

@Service("real")
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;
	
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public int insertMember(Member m) {
		return dao.insertMember(session,m);
	}

	@Override
	public Member selectMember(String userId) {
		return dao.selectMember(session, userId);
	}
	
	

}
