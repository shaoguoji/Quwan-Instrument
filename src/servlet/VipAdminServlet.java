package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsersDao;
import dao.VipAdminDao;
import entity.Users;

public class VipAdminServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public VipAdminServlet() {
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
		Users user = (Users)request.getSession().getAttribute("user");
		UsersDao usersDao =new UsersDao();
		int data;
		if(user.getUserPoint()>=600){
			 VipAdminDao vipAdminDao = new VipAdminDao();
			 int update = vipAdminDao.change_vip_status(user.getUserAccount());
			 if(update>0){
				 data =1;
				 user = usersDao.getItemsByUsersAccount(user.getUserAccount());
				 request.getSession().setAttribute("user", user);
			 }else{
				 data=2;
			 }
		}else{
				data=3;
		}
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
