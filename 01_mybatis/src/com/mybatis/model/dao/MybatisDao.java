package com.mybatis.model.dao;

import java.sql.PreparedStatement;

import org.apache.ibatis.session.SqlSession;

public class MybatisDao {
	public int insertBasic(SqlSession session) {
		int result = session.insert("student.insertBasic");
		return result;
	}
}
