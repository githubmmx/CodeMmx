package com.firstmybatis.model.service;
import static com.firstmybatis.common.SqlSessionTemplate.getSession;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.firstmybatis.model.dao.StudentDao;
import com.firstmybatis.model.dao.StudentDaoImpl;
import com.firstmybatis.model.vo.Student;

public class StudentServiceImpl implements StudentService {
	private StudentDao dao = new StudentDaoImpl();
	
	@Override
	public int insertStudent(Student s) {
		SqlSession session = getSession();
		int result = dao.insertStudent(session,s);
		if(result>0) {
			session.commit();
		}else {
			session.rollback();
		}
		session.close();
		return result;
	}

	@Override
	public int insertStudentMap(Map<String, Student> map) {
		SqlSession session = getSession();
		int result = dao.insertStudentMap(session, map);
		if(result > 0) {
			session.commit();
		}else {
			session.rollback();
		}
		session.close();
		return result;
	}

	@Override
	public int selectCount() {
		SqlSession session = getSession();
		int count = dao.selectCount(session);
		return count;
	}

	@Override
	public Student selectStudent(int no) {
		SqlSession session = getSession();
		Student s = dao.selectStudent(session, no);
		session.close();
		return s;
	}

}
