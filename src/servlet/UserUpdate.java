package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsersDao;
import entity.Users;

public class UserUpdate extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserUpdate() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request, response);
		
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		UsersDao usersDao = new UsersDao();
		Properties pros =new Properties();
		if(request.getParameter("user_address")!=null){
			pros.setProperty("user_address", request.getParameter("user_address"));
		}else if(request.getParameter("user_phone")!=null){
			pros.setProperty("user_phone", request.getParameter("user_phone"));
		}else{
			pros.setProperty("user_email", request.getParameter("user_email"));
		}
		Properties pro =new Properties();
		pro.setProperty("user_account", request.getParameter("user_account"));
		usersDao.updateUser(pro, pros);
		Users user =null;
		user = usersDao.getItemsByUsersAccount(request.getParameter("user_account"));
		request.getSession().setAttribute("user", user);
		int data=0;
		out.print(data);
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
