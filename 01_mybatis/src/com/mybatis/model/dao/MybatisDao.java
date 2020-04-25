package com.mybatis.model.dao;
import static com.mybatis.common.SqlSessionTemplate.getSession;
import org.apache.ibatis.session.SqlSession;

public class MybatisDao {
	public int insertBasic(SqlSession session) {
//		int result=session.insert("student.insertBasic");
//		return result;
		return session.insert("student.insertBasic");
	}

	public int insertBasic(SqlSession session, String name) {
		
		return session.insert("student.insertName", name);
	}
}
