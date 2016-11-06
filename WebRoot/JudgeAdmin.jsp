<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% 
	request.setCharacterEncoding("utf-8");
	String a ="wangcheng";
	if (request.getParameter("username").equals(a)){
	
		response.sendRedirect("SuperAdmin.jsp");
		//request.getRequestDispatcher("search.jsp").forward(request, response);
	}
	else if (request.getParameter("username")!=a)
			
		response.sendRedirect("product.jsp");



%>