package com.comterzone.shop.member.model.service;

import com.comterzone.shop.member.model.vo.Member;

public interface MemberService {
	
	int insertMember(Member m);
	
	Member selectMember(String userId);
}
