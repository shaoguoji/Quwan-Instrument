package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SaleBeforeDao;

import entity.SaleBefore;
import entity.Users;

public class salebeforeServlet extends HttpServlet {

	public salebeforeServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

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
		
		Users loginUser = null;

		if(request.getSession().getAttribute("user") != null)
		{
			loginUser = (Users)request.getSession().getAttribute("user");
		}
		
		int userId = loginUser.getUserId();
		int productId = Integer.parseInt(request.getParameter("id"));
		String service_brefore = request.getParameter("message");
		boolean salebefore_is_handle = false;
		
		SaleBefore sb = new SaleBefore();
		
		sb.setUser_id(userId);
		sb.setProduct_id(productId);
		sb.setService_before(new String(service_brefore.getBytes("ISO-8859-1"), "utf-8"));
		sb.setSalebefore_is_handle(salebefore_is_handle);
		
		SaleBeforeDao sbd = new SaleBeforeDao();
		
		sbd.addSaleBefore(sb);
		
		response.sendRedirect(request.getContextPath() + "/product.jsp?id=" + productId);
		
		
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
