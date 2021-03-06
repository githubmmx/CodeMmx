package com.firstmybatis.model.service;

import java.util.List;
import java.util.Map;

import com.firstmybatis.model.vo.Student;

public interface StudentService {


	int insertStudent(Student s);

	int insertStudentMap(Map<String, Student> map);

	int selectCount();

	Map<String, String> selectStudent(int no);

	int deleteStudent(int no);

	List<Student> selectList();

	List<Map<String, String>> selectMap();

}
