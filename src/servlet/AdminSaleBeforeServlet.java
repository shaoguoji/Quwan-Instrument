package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SaleBeforeDao;
import dao.VipAdminDao;

public class AdminSaleBeforeServlet extends HttpServlet {

	private String action; // 表示超级管理员动作
	private SaleBeforeDao  salebeforedao= new SaleBeforeDao();// 售前服务逻辑类的对象
	/**
	 * Constructor of the object.
	 */
	public AdminSaleBeforeServlet() {
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
		if (request.getParameter("action") != null) {
			this.action = request.getParameter("action");
			if(action.equals("show")) //获取所有售前服务申请
			{
				request.getRequestDispatcher("#").forward(request,
						response);
			}
			if(action.equals("delete")) //删除售前服务申请
			{
				if (SaleBeforeDelete(request, response)) {
					request.getRequestDispatcher("#").forward(request,
							response);
				} else {
					request.getRequestDispatcher("#").forward(request,
							response);
			}	
			}
		}
	}
	
	//删除售前申请
	private boolean SaleBeforeDelete(HttpServletRequest request,
		HttpServletResponse response) {
		String id = request.getParameter("salebefore_id");
		if (salebeforedao.deleteSaleBefore(Integer.parseInt(id))) {
			return true;
		} else {
			return false;
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
