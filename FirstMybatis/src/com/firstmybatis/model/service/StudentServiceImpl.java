package com.firstmybatis.model.service;
import static com.firstmybatis.common.SqlSessionTemplate.getSession;

import java.util.List;
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
		session.close();
		return count;
	}

	@Override
	public Map<String, String> selectStudent(int no) {
		SqlSession session = getSession();
		Map<String, String> s = dao.selectStudent(session, no);
		session.close();
		return s;
	}

	@Override
	public int deleteStudent(int no) {
		SqlSession session = getSession();
		int result = dao.deleteStudent(session, no);
		if(result > 0) {
			session.commit();
		}else {
			session.rollback();
		}
		session.close();
		return result;
	}

	@Override
	public List<Student> selectList() {
		// TODO Auto-generated method stub
		SqlSession session = getSession();
		List<Student> list = dao.selectList(session);
		session.close();
		return list;
	}

	@Override
	public List<Map<String, String>> selectMap() {
		// TODO Auto-generated method stub
		SqlSession session = getSession();
		List<Map<String,String>> list = dao.selectMap(session);
		session.close();
		return list;
	}

}
