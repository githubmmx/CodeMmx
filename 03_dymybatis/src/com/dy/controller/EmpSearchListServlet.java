package com.dy.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dy.model.service.EmpService;
import com.dy.model.service.EmpServiceImpl;

/**
 * Servlet implementation class EmpSearchListServlet
 */
@WebServlet("/searchList")
public class EmpSearchListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private EmpService service=new EmpServiceImpl();   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmpSearchListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Map<String,String>> list=service.selectList();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/empList.jsp").forward(request,response);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
