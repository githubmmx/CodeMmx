package com.mybatis.model.service;
import static com.mybatis.common.SqlSessionTemplate.getSession;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.model.dao.MybatisDao;

public class MybatisService {
	private MybatisDao dao = new MybatisDao();

	public int insertBasic() {
		//mybatis에서는 connection -> Session
		SqlSession session=getSession();
		int result=dao.insertBasic(session);
		//트렌젝션처리
		if(result>0) session.commit();
		else session.rollback();
		session.close();
		return result;
	}

	public int insertName(String name) {
		// TODO Auto-generated method stub
		SqlSession session=getSession();
		int result=dao.insertBasic(session,name);
		//트렌젝션처리
		if(result>0) session.commit();
		else session.rollback();
		session.close();
		return result;
	}

}
