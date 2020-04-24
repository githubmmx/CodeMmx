package com.firstmybatis.model.service;

import java.util.Map;

import com.firstmybatis.model.vo.Student;

public interface StudentService {


	int insertStudent(Student s);

	int insertStudentMap(Map<String, Student> map);

	int selectCount();

	Student selectStudent(int no);

}
