package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.misc.BASE64Encoder;

import dao.UsersDao;

import encryption.EncryptionForPassword;
import entity.Users;

public class UserRegServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserRegServlet() {
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

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		Users user =null;
		UsersDao usersDao =new UsersDao();
		user = usersDao.getItemsByUsersAccount(request.getParameter("fistname"));
		if(user!=null){
			//弹出对话框，此用户名已存在
			out.print("此用户名已存在");
			
		}else if(!(request.getParameter("password").equals(request.getParameter("repassword")))){
			//弹出对话框,两次密码不一致
			out.print("两次密码不一致");
		}else{
			String password=null;
			try {
				password = EncryptionForPassword.EncoderByMd5(request.getParameter("password"));
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			user = new Users();
			user.setUserAccount(request.getParameter("firstname"));
			user.setUserName(request.getParameter("lastname"));
			user.setUserEmail(request.getParameter("email"));
			user.setUserPhone(request.getParameter("phone"));
			user.setUserPassword(password);
			user.setUserPoint(0);
			user.setUserVip(false);
			usersDao.addUser(user);
			//提示注册成功，弹出按扭，点击按扭返回登陆界面。
			
			
		}
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
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
