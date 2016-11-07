package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.DealShoppingDao;
import entity.DealShopping;
import entity.Product;
import entity.Users;

public class DealShoppingServlet extends HttpServlet {

	private String action; // 表示订单的动作 ,add,show,delete
	private DealShoppingDao dealDao = new DealShoppingDao();// 商品业务逻辑类的对象

	/**
	 * Constructor of the object.
	 */
	public DealShoppingServlet() {
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
		PrintWriter out = response.getWriter();
		if (request.getParameter("action") != null) {
			this.action = request.getParameter("action");
			if (action.equals("add")) // 如果是添加订单
			{
				if (addDeal(request, response)) {
					request.getRequestDispatcher("/success.jsp").forward(
							request, response);
				} else {
					request.getRequestDispatcher("/failure.jsp").forward(
							request, response);
				}
			}
			if (action.equals("show"))// 如果是显示订单
			{
				request.getRequestDispatcher("/deal.jsp").forward(request,
						response);
			}
			if (action.equals("delete")) // 如果是删除订单
			{
				if (deleteDeal(request, response)) {
					request.getRequestDispatcher("/deal.jsp").forward(request,
							response);
				} else {
					request.getRequestDispatcher("/deal.jsp").forward(request,
							response);
				}
			}
		}

	}

	// 添加订单的方法
	private boolean addDeal(HttpServletRequest request,
			HttpServletResponse response) {
		/*
		 * ArrayList<DealShopping> list = new ArrayList<DealShopping>();
		 * Iterator<Product> it = items.iterator(); while (it.hasNext()) {
		 * Product pd = it.next(); for (DealShopping deal : list) { Users user =
		 * (Users) request.getSession().getAttribute("user");
		 * deal.setUser_id(user.getUserId());
		 * deal.setProduct_id(pd.getProduct_id());
		 * deal.setProduct_count(pd.getProduct_sale_count());
		 * deal.setDeal_price_(pd.getProduct_id() pd.getProduct_sale_count());
		 * list.add(deal); } }
		 */

		ArrayList<DealShopping> list = (ArrayList<DealShopping>) request
				.getAttribute("list");
		if (list != null && list.size() > 0) {
			if (dealDao.AddDeal(list)) {
				return true;
			} else {
				return false;
			}
		}
		return false;
	}

	// 删除订单
	private boolean deleteDeal(HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("id");
		if (dealDao.DeleteDeal(Integer.parseInt(id))) {
			return true;
		} else {
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
