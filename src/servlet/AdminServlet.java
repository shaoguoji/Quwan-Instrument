package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Admin_Dao;
import dao.Adminjudge;
import encryption.EncryptionForPassword;
import entity.Admin;

public class AdminServlet extends HttpServlet{
	
	Admin_Dao admindao =new Admin_Dao();
	Admin admin = null;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		out.println("hello");
		response.sendRedirect("account.jsp");
	}

	@Override
	//根据管理员账号密码跳转响应界面
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			/*try {
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
			
				}
				else{
					
					//request.getRequestDispatcher("../admin_accountagain.jsp").forward(request, response); 
					//request.setAttribute("username", request.getParameter("username"));
					response.sendRedirect("../admin_accountagain.jsp");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		*/
		int data = 0;
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=utf-8");
		String newpassword = null;
		try {
			newpassword = EncryptionForPassword.EncoderByMd5(request.getParameter("admin_password"));
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		admin = admindao.getItemsByAdminUsername(request.getParameter("admin_name"));
		if(admin==null){
				data=1;
		}
		else if(admin.getAdminPassword().equals(newpassword)){
				data=0;
				if(admin.getAdminDep().equals("super")){
					request.getSession().setAttribute("admin_username", admin.getAdminUsername());
					request.getSession().setAttribute("isLogin", true);
					request.getSession().setAttribute("admin", admin);
					
					data =3;
				}
				if(admin.getAdminDep().equals("buy")){
					request.getSession().setAttribute("admin_username", admin.getAdminUsername());
					request.getSession().setAttribute("isLogin", true);
					request.getSession().setAttribute("admin", admin);
					data =4;
				}
				if(admin.getAdminDep().equals("sale")){
					request.getSession().setAttribute("admin_username", admin.getAdminUsername());
					request.getSession().setAttribute("isLogin", true);
					request.getSession().setAttribute("admin", admin);
					data =5;
				}
				if(admin.getAdminDep().equals("product")){
					request.getSession().setAttribute("admin_username", admin.getAdminUsername());
					request.getSession().setAttribute("isLogin", true);
					request.getSession().setAttribute("admin", admin);
					data =6;
				}
				if(admin.getAdminDep().equals("data")){
					request.getSession().setAttribute("admin_username", admin.getAdminUsername());
					request.getSession().setAttribute("isLogin", true);
					request.getSession().setAttribute("admin", admin);
					data =7;
				}
				if(admin.getAdminDep().equals("system")){
					request.getSession().setAttribute("admin_username", admin.getAdminUsername());
					request.getSession().setAttribute("isLogin", true);
					request.getSession().setAttribute("admin", admin);
					data =8;
				}
			
		}
		else
			data=2;
		out.print(data);
	}

	
}
