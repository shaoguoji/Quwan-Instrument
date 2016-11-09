package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DealshoppingDao;
import dao.SuperAdminDao;
import dao.VipAdminDao;

public class AdminVipServlet extends HttpServlet {

	private String action; // 表示超级管理员动作
	private VipAdminDao  vipadmindao= new VipAdminDao();// vip申请管理的对象
	/**
	 * Constructor of the object.
	 */
	public AdminVipServlet() {
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
		/*if (request.getParameter("action") != null) {
			this.action = request.getParameter("action");
			
			
			if(action.equals("show")) //获取所有vip申请
			{
				request.getRequestDispatcher("#").forward(request,
						response);
			}
			if(action.equals("agree")) //同意申请
			{
				if (vipAgree(request, response)) {
					request.getRequestDispatcher("/success.jsp").forward(
							request, response);
				} else {
					request.getRequestDispatcher("/failure.jsp").forward(
							request, response);
				}
			}
			if(action.equals("refuse")) //拒绝申请
			{
				if (vipRefuse(request, response)) {
					request.getRequestDispatcher("/success.jsp").forward(
							request, response);
				} else {
					request.getRequestDispatcher("/failure.jsp").forward(
							request, response);
				}
			}
			if(action.equals("delete")) //删除申请
			{
				if (vipDelete(request, response)) {
					request.getRequestDispatcher("/success.jsp").forward(
							request, response);
				} else {
					request.getRequestDispatcher("/failure.jsp").forward(
							request, response);
				}
			}
		}
	}


	//同意会员申请
	private boolean vipAgree(HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("user_id");
		if (vipadmindao.VipAgree(Integer.parseInt(id))) {
			return true;
		} else {
			return false;
		}
	}
	//拒绝会员申请
	private boolean vipRefuse(HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("user_id");
		if (vipadmindao.VipRefuse(Integer.parseInt(id))) {
			return true;
		} else {
			return false;
		}
	}
	//删除会员申请
	private boolean vipDelete(HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("user_id");
		if (vipadmindao.VipDelete(Integer.parseInt(id))) {
			return true;
		} else {
			return false;
		}*/
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
