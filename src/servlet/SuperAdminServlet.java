package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Constants;

import dao.SuperAdminDao;
import encryption.EncryptionForPassword;
import entity.Admin;
import entity.DealShopping;

public class SuperAdminServlet extends HttpServlet {

	private SuperAdminDao superadmindao = new SuperAdminDao();// 超级管理员逻辑类的对象
	/**
	 * Constructor of the object.
	 */
	public SuperAdminServlet() {
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
		doPost(request,response);
		
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
		/*if (request.getParameter("action") != null) {
			this.action = request.getParameter("action");
			if (action.equals("delede")) // 删除管理员
			{
				if (deleteAdmin(request, response)) {
					request.getRequestDispatcher("/success.jsp").forward(
							request, response);
				} else {
					request.getRequestDispatcher("/failure.jsp").forward(
							request, response);
				}
			}
			if (action.equals("show"))  //获取所有管理员
			{
				request.getRequestDispatcher("#").forward(request,
						response);	
			}
			if(action.equals("add"))	//增加管理员
			{
				
				if (addAdmin(request, response)) {
					request.getRequestDispatcher("/success.jsp").forward(
							request, response);
				} else {
					request.getRequestDispatcher("/failure.jsp").forward(
								request, response);
				}
				
			}
			if(action.equals("change"))		//编辑管理员
			{
				if (ChangeAdmin(request, response)) {
					request.getRequestDispatcher("/success.jsp").forward(
							request, response);
				} else {
					request.getRequestDispatcher("/failure.jsp").forward(
								request, response);
				}
					
			}
		}
		*/
		if(request.getParameter("admin_username")!=null){
			SuperAdminDao superAdminDao= new SuperAdminDao();
			List<Admin> admin = superAdminDao.findAllAdmin();
			for(Admin a:admin){
				if(request.getParameter("admin_username").equals(a.getAdminUsername())){
					request.setAttribute("admin", a);
					break;
				}
			}
			request.getRequestDispatcher("/superManage.jsp").forward(request, response);
		}else if(request.getParameter("admin_id")!=null){
			if(deleteAdmin(request,response)){
				request.getRequestDispatcher("/superManage.jsp").forward(request, response);
			}
		}else if(request.getParameter("add")!=null){
			SuperAdminDao superAdminDao= new SuperAdminDao();
			List<Admin> admin = superAdminDao.findAllAdmin();
			int data=-1;
			for(Admin a:admin){
				if(request.getParameter("adminUsername").equals(a.getAdminUsername())){
						data=0;
						break;
				}
			}
			if(data!=0){
			  if(addAdmin(request,response)){
				  data=1;
			  }else{
				  data=2;
			  }
			}
			  out.print(data);
		}else if(request.getParameter("change")!=null){
			int data = changeAdminDepOrLevel(request,response);
			out.print(data);
		}else{
			int data = changeAdminPassword(request, response);
			out.print(data);
		}
	}
	
	//删除管理员
	private boolean deleteAdmin(HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("admin_id");
		System.out.println(id);
		if (superadmindao.deleteAdminById(Integer.parseInt(id))) {
			return true;
		} else {
			return false;
		}
	}
	//增加管理员
	private boolean addAdmin(HttpServletRequest request,
			HttpServletResponse response) {
			
			Admin admin =new Admin();
			
			
			if (request.getParameter("adminUsername") != null)
				admin.setAdminUsername(request.getParameter("adminUsername"));
			else
				return false;
			if (request.getParameter("adminPassword") != null){
				try {
					String password = EncryptionForPassword.EncoderByMd5(request.getParameter("adminPassword"));
					admin.setAdminPassword(password);
				} catch (NoSuchAlgorithmException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (UnsupportedEncodingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else
				return false;
			if (request.getParameter("adminDep") != null)
				admin.setAdminDep(request.getParameter("adminDep"));
			else
				return false;
			if (request.getParameter("adminLevel") != null)
				admin.setAdminLevel(Integer.parseInt(request.getParameter("adminLevel")));
			else
				return false;
			superadmindao.saveAdmin(admin, Constants.ADD_ADMIN);
			return true;
	}
	//编辑管理员
	private int changeAdminDepOrLevel(HttpServletRequest request,
			HttpServletResponse response) {
		
			int data = superadmindao.changeAdminDepOrLevel(request.getParameter("adminDep"), Integer.parseInt(request.getParameter("adminLevel")),request.getParameter("adminId"));
			return data;
	}
	//修改密码
	public int changeAdminPassword(HttpServletRequest request,
			HttpServletResponse response){
			try {
				String password = EncryptionForPassword.EncoderByMd5(request.getParameter("adminPassword"));
				int data = superadmindao.changeAdminPassword(password,request.getParameter("adminId"));
				return data;
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return 0;
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return 0;
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
