package com.comterzone.shop.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.comterzone.shop.member.model.vo.Member;

public interface MemberDao {
	int insertMember(SqlSessionTemplate session, Member m);
	
	Member selectMember(SqlSessionTemplate session,String userId);
	
}
