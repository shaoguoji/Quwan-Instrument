package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserSaleLaterDao;
import entity.SaleLater;

@SuppressWarnings("serial")
public class UserSaleLaterServlet extends HttpServlet {

	private UserSaleLaterDao dao = new UserSaleLaterDao();// 售后服务业务逻辑类的对象

	/**
	 * Constructor of the object.
	 */
	public UserSaleLaterServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		if (addBackServer(request, response)) {
			request.getRequestDispatcher("/deal.jsp")
					.forward(request, response);
		} else {
			request.setAttribute("fail", "申请服务");
			request.getRequestDispatcher("/failure.jsp").forward(
					request, response);
		}
	}

	// 添加服务的方法
	private boolean addBackServer(HttpServletRequest request,
			HttpServletResponse response) {
		SaleLater sal = new SaleLater();
		if (request.getSession().getAttribute("product_id") != null)
			sal.setProduct_id(Integer.parseInt(request.getSession()
					.getAttribute("product_id").toString()));
		else 
			return false;
		sal.setSalelater_is_handle(false);
		if (request.getSession().getAttribute("deal_id") != null)
			sal.setDeal(Integer.parseInt(request.getSession()
					.getAttribute("deal_id").toString()));
		else 
			return false;
		if (request.getSession().getAttribute("user_id") != null)
			sal.setUser_id(Integer.parseInt(request.getSession()
					.getAttribute("user_id").toString()));
		else 
			return false;
		if (request.getSession().getAttribute("salelater") != null)
			sal.setServive_later(request.getSession().getAttribute("salelater")
					.toString());
		else 
			return false;
		if (dao.BackServer(
				sal,
				Integer.parseInt(request.getParameter("salelater_type")))) {
			System.out.println("申请服务成功");
			return true;
		} else {
			System.out.println("申请服务失败");
			return false;
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}
}
