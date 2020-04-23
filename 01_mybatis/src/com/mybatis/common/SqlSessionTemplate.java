package com.mybatis.common;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionTemplate {

		public static SqlSession getSession() {
			// 1. 설정파일불러오기(mybatis-config.xml)
			// 2. SqlSessionFactoryBuilder 객체 생성
			// 3. factoryBuilder에서 bulid메소드를 이용해서 *설정파일대입
			//    SqlSessionFactory생성
			// 4. SqlSessionFactory객체에서 openSession메소드를 이용하여
			//    SqlSession을 생성함
			String resource="mybatis-config.xml";
			SqlSession session=null;
			try {
				InputStream is = Resources.getResourceAsStream(resource);
				SqlSessionFactoryBuilder ssb = new SqlSessionFactoryBuilder();
				SqlSessionFactory factory = ssb.build(is);
				session = factory.openSession(false); // 트랜잭션 설정
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return session;
		}
}
