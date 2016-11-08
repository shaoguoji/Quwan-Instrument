package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsersDao;
import encryption.EncryptionForPassword;
import entity.Users;

public class UserPasswordChangeServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserPasswordChangeServlet() {
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
			Users user = (Users)request.getSession().getAttribute("user");
			if(request.getParameter("current_password")!=null){
				int same=0;
				try {
					String newpassword = EncryptionForPassword.EncoderByMd5(request.getParameter("current_password"));
					if(newpassword.equals(user.getUserPassword())){
							same=1;
					}else{
							same=0;
					}
				} catch (NoSuchAlgorithmException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				out.print(same);
			}else if(request.getParameter("enter_password")!=null){
					try {
						String user_password = EncryptionForPassword.EncoderByMd5(request.getParameter("enter_password"));
						Properties pros = new Properties();
						pros.setProperty("user_password", user_password);
						String user_account = (String)request.getSession().getAttribute("user_account");
						Properties pro = new Properties();
						pro.setProperty("user_account", user_account);
						UsersDao usersDao =new UsersDao();
						usersDao.updateUser(pro, pros);
						int addSuccess=0;
						out.print(addSuccess);
					} catch (NoSuchAlgorithmException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
			}
			
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
