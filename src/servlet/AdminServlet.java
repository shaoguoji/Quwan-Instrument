package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Admin_Dao;
import dao.Adminjudge;
import entity.Admin;

public class AdminServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		out.println("hello");
		response.sendRedirect("account.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			try {
				if(Adminjudge.judge_accountpassword(request.getParameter("username"), request.getParameter("password"))){
		
					for (Admin dept : Admin_Dao.depts) {
						
						if(dept.getAdminUsername().equals(request.getParameter("username"))){
						
							if(dept.getAdminDep().equals("super")){
								response.sendRedirect("../account.jsp");
								break;
							}
							if(dept.getAdminDep().equals("buy")){
								response.sendRedirect("../SuperAdmin.jsp");
								break;
							}
							if(dept.getAdminDep().equals("sale")){
								response.sendRedirect("../SuperAdmin.jsp");
								break;
							}
							if(dept.getAdminDep().equals("data")){
								response.sendRedirect("../SuperAdmin.jsp");
								break;
							}
							if(dept.getAdminDep().equals("product")){
								response.sendRedirect("../SuperAdmin.jsp");
								break;
							}
							if(dept.getAdminDep().equals("system")){
								response.sendRedirect("../SuperAdmin.jsp");
								break;
							}
						}
					}	
					
					//response.sendRedirect("../index.jsp");
						
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		

		//request.getRequestDispatcher("../account.jsp").forward(request, response);
	}
	
}
