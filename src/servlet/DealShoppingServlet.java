package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

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
		if (request.getParameter("action") != null) {
			this.action = request.getParameter("action");
			if (action.equals("add")) // 如果是添加订单
			{
				if (addDeal(request, response)) {
					response.sendRedirect("../deal.jsp");
				} else {
					response.sendRedirect("../deal.jsp");
				}
			}
			if (action.equals("query")) // 如果查询所有订单
			{
				request.getSession().removeAttribute("dealbynum");
				request.getSession().removeAttribute("dealbytype");
				response.sendRedirect("../deal.jsp");
				
			}
			if (action.equals("querybynum")) // 如果订单号是查询订单
			{
				if (queryDealbynum(request, response)) {
					response.sendRedirect("../deal.jsp");
					System.out.println("订单号查询订单");
				} else {
					response.sendRedirect("../deal.jsp");
				}
			}
			
			if (action.equals("querybytype")) // 如果类型是查询订单
			{
				if (queryDealByType(request, response)) {
					response.sendRedirect("../deal.jsp");;
				} else {
					response.sendRedirect("../deal.jsp");
				}
			}
			if (action.equals("show"))// 如果是显示订单
			{
				response.sendRedirect("../deal.jsp");
			}
			if (action.equals("delete")) // 如果是删除订单
			{
				if (deleteDeal(request, response)) {
					response.sendRedirect("../deal.jsp");
				} else {
					response.sendRedirect("../deal.jsp");
				}
			}
			if (action.equals("sure")) // 如果是确认收货
			{
				if (SureRecieve(request, response)) {
					response.sendRedirect("../deal.jsp");
				} else {
					response.sendRedirect("../deal.jsp");
				}
			}

		}

	}

	// 添加订单
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
		 * deal.setDeal_price_(pd.getProduct_id()* pd.getProduct_sale_count());
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

	// 通过订单号查询订单
	private boolean queryDealbynum(HttpServletRequest request,
			HttpServletResponse response) {
		String userName = null;
		String num = null;
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
		if (request.getSession().getAttribute("user") != null)
			userName = ((Users)request.getSession().getAttribute("user")).getUserName();
		else
			return false;
		if (request.getParameter("deal_shopnumber") != null)
			num = request.getParameter("deal_shopnumber");
		else 
			return false;
		ArrayList<ArrayList<DealShopping>> deal = dealDao.getDealsByUsernameAndShopnum(userName, num);
		request.getSession().setAttribute("dealbynum", deal);
		return true;

	}
	// 通过订单类型查询订单
		private boolean queryDealByType(HttpServletRequest request,
				HttpServletResponse response) {
			String userName = null;
			String deal_type = null;
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
			if (request.getSession().getAttribute("user")!= null)
				userName = ((Users)request.getSession().getAttribute("user")).getUserName();
			else
				return false;
			if (request.getParameter("deal_type") != null)
				deal_type = request.getParameter("deal_type");
			else 
				return false;
			ArrayList<ArrayList<DealShopping>> deal = dealDao.getDealsByUsernameAndType(userName, deal_type);
			request.getSession().setAttribute("dealbytype", deal);
			return true;

		}
		

	// 确认收货的的方法
	private boolean SureRecieve(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println(request.getParameter("deal_id"));
		if (dealDao.SureRecieveProduct(Integer.parseInt(request
				.getParameter("deal_id")))) {
			return true;
		} else {
			return false;
		}

	}

	// 删除订单
	private boolean deleteDeal(HttpServletRequest request,
			HttpServletResponse response) {
		String id = request.getParameter("deal_id");
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
