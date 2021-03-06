package com.firstmybatis.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.firstmybatis.model.vo.Student;

public interface StudentDao {
	int insertStudent(SqlSession session, Student s);

	int insertStudentMap(SqlSession session, Map<String, Student> map);

	int selectCount(SqlSession session);

	Map<String, String> selectStudent(SqlSession session, int no);

	int deleteStudent(SqlSession session, int no);

	List<Student> selectList(SqlSession session);

	List<Map<String, String>> selectMap(SqlSession session);
}
