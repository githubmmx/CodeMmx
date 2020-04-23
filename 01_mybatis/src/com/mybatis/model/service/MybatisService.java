package com.mybatis.model.service;
import static com.mybatis.common.SqlSessionTemplate.getSession;

import org.apache.ibatis.session.SqlSession;

import com.mybatis.model.dao.MybatisDao;

public class MybatisService {
	private MybatisDao dao = new MybatisDao();

	public int insertBasic() {
		//myBatis에서는 connection -> Session
		SqlSession session = getSession();
		
		return 0;
	}

}
