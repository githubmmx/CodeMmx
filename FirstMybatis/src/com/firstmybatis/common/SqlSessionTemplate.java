package com.firstmybatis.common;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionTemplate {
	public static SqlSession getSession() {
		String resource = "mybatis-config.xml";
		SqlSession session = null;
		try {
			InputStream is = Resources.getResourceAsStream(resource);
			SqlSessionFactoryBuilder sfb = new SqlSessionFactoryBuilder();
			SqlSessionFactory sf =  sfb.build(is);
			session =  sf.openSession(false);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return session;
	}
}
