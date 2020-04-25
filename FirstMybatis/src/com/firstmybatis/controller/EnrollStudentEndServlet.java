package com.firstmybatis.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.firstmybatis.model.service.StudentService;
import com.firstmybatis.model.service.StudentServiceImpl;
import com.firstmybatis.model.vo.Student;

/**
 * Servlet implementation class EnrollStudentEndServlet
 */
@WebServlet("/enrollStudentEnd.do")
public class EnrollStudentEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private StudentService service = new StudentServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollStudentEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("studentName");
		String tel = request.getParameter("studentTel");
		String email = request.getParameter("studentEmail");
		String addr = request.getParameter("studentAddr");
		
		Student s = new Student(1, name, tel, email, addr, null);
		int result = service.insertStudent(s);
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().append(result>0?"입력성공":"입력실패");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
