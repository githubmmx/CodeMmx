package com.firstmybatis.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.firstmybatis.model.service.StudentService;
import com.firstmybatis.model.service.StudentServiceImpl;

/**
 * Servlet implementation class SelectCountServlet
 */
@WebServlet("/selectCount")
public class SelectCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private StudentService service = new StudentServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectCountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int count = service.selectCount();
		System.out.println(count);
		request.setAttribute("count", count);
		request.getRequestDispatcher("/WEB-INF/views/studentView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
