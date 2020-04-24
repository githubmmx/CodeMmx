package com.firstmybatis.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.firstmybatis.model.vo.Student;

public class StudentDaoImpl implements StudentDao {

	@Override
	public int insertStudent(SqlSession session, Student s) {
		// TODO Auto-generated method stub
		return session.insert("student.insertStudent", s);
	}

	@Override
	public int insertStudentMap(SqlSession session, Map<String, Student> map) {
		return session.insert("student.insertStudentMap",map);
	}

	@Override
	public int selectCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("student.selectCount");
	}

	@Override
	public Map<String, String> selectStudent(SqlSession session, int no) {
		// TODO Auto-generated method stub
		return session.selectOne("student.selectStudent2", no);
	}

}
