package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			response.setContentType("text/html;charset=utf-8");
			if(request.getParameter("user_account")!=null){
				Users user =null;
				UsersDao usersDao =new UsersDao();
				user = usersDao.getItemsByUsersAccount(request.getParameter("user_account"));
				int isExist;
				if(user!=null){
					isExist = 1;
				}else{
					isExist=0;
				}
				response.getWriter().print(isExist);
			}else{
				int isEqual;
				if(request.getParameter("user_password").length()==0){
					isEqual=0;
				}else if(request.getParameter("user_repassword").equals(request.getParameter("user_password"))){
					isEqual=1;
				}else{
					isEqual=2;
				}
				response.getWriter().print(isEqual);
			}
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
		request.setCharacterEncoding("utf-8");
		Users user =null;
		UsersDao usersDao =new UsersDao();
		user = usersDao.getItemsByUsersAccount(request.getParameter("user_account"));
		
			String password=null;
			try {
				password = EncryptionForPassword.EncoderByMd5(request.getParameter("user_password"));
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			user = new Users();
			user.setUserAccount(request.getParameter("user_account"));
			user.setUserName(request.getParameter("user_name"));
			user.setUserEmail(request.getParameter("user_email"));
			user.setUserPhone(request.getParameter("user_phone"));
			user.setUserPassword(password);
			user.setUserPoint(0);
			user.setUserVip(false);
			usersDao.addUser(user);
			
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
