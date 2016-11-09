package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.DealshoppingDao;
import dao.ProductDao;
import util.Constants;
import entity.DealShopping;
import entity.Product;

public class AdminProductChargeServlet extends HttpServlet {

	private String action; // 表示订单的动作 ,add,show,delete
	private ProductDao dao = new ProductDao();// 商品业务逻辑类的对象

	/**
	 * Constructor of the object.
	 */
	public AdminProductChargeServlet() {
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
			if (action.equals("add")) // 如果是添加商品
			{
				if (addProduct(request, response)) {
					request.getRequestDispatcher("/success.jsp").forward(
							request, response);
				} else {
					request.getRequestDispatcher("/failure.jsp").forward(
							request, response);
				}
			}
			if (action.equals("show"))// 如果是显示商品
			{
				request.getRequestDispatcher("/adminproduct.jsp").forward(request,
						response);
			}
			if (action.equals("delete")) // 如果是删除商品
			{
				if (deleteDeal(request, response)) {
					request.getRequestDispatcher("/adminproduct.jsp").forward(request,
							response);
				} else {
					request.getRequestDispatcher("/adminproduct.jsp").forward(request,
							response);
				}
			}
			if (action.equals("update")) // 如果是编辑商品
			{
				if (updateProduct(request, response)) {
					request.getRequestDispatcher("/deal.jsp").forward(request,
							response);
				} else {
					request.getRequestDispatcher("/deal.jsp").forward(request,
							response);
				}
			}
		}

	}

	// 添加商品的方法
	private boolean addProduct(HttpServletRequest request,
			HttpServletResponse response) {

		Product product = new Product();
		if (request.getParameter("product_image") != null)
			product.setProduct_image(request.getParameter("product_image"));
		else
			return false;
		if (request.getParameter("product_color") != null)
			product.setProduct_color(request.getParameter("product_color"));
		else
			return false;
		if (request.getParameter("product_level") != null)
			product.setProduct_level(request.getParameter("product_level"));
		else
			return false;
		if (request.getParameter("product_price") != null)
			product.setProduct_price(Integer.parseInt(request
					.getParameter("product_price")));
		else
			return false;
		if (request.getParameter("product_name") != null)
			product.setProduct_name(request.getParameter("product_name"));
		else
			return false;
		product.setProduct_show_date(new java.sql.Date(new Date().getTime()));
		if (request.getParameter("product_infomation") != null)
			product.setProduct_infomation(request
					.getParameter("product_infomation"));
		else
			return false;
		if (request.getParameter("product_introdution") != null)
			product.setProduct_introdution(request
					.getParameter("product_introdution"));
		else
			return false;
		if (request.getParameter("product_size") != null)
			product.setProduct_size(request.getParameter("product_size"));
		else
			return false;
		if (request.getParameter("product_type") != null)
			product.setProduct_type(request.getParameter("product_type"));
		else
			return false;
		product.setProduct_is_sale(false);
		if (request.getParameter("product_sale_count") != null)
			product.setProduct_sale_count(Integer.parseInt(request
					.getParameter("product_sale_count")));
		else
			return false;
		dao.saveProduct(product, Constants.ADD_PRODUCT);
		return true;
	}
	// 编辑商品的方法
		private boolean updateProduct(HttpServletRequest request,
				HttpServletResponse response) {

			Product product = new Product();
			if (request.getParameter("product_image") != null)
				product.setProduct_image(request.getParameter("product_image"));
			else
				return false;
			if (request.getParameter("product_color") != null)
				product.setProduct_color(request.getParameter("product_color"));
			else
				return false;
			if (request.getParameter("product_level") != null)
				product.setProduct_level(request.getParameter("product_level"));
			else
				return false;
			if (request.getParameter("product_price") != null)
				product.setProduct_price(Integer.parseInt(request
						.getParameter("product_price")));
			else
				return false;
			if (request.getParameter("product_name") != null)
				product.setProduct_name(request.getParameter("product_name"));
			else
				return false;
			product.setProduct_show_date(new java.sql.Date(new Date().getTime()));
			if (request.getParameter("product_infomation") != null)
				product.setProduct_infomation(request
						.getParameter("product_infomation"));
			else
				return false;
			if (request.getParameter("product_introdution") != null)
				product.setProduct_introdution(request
						.getParameter("product_introdution"));
			else
				return false;
			if (request.getParameter("product_size") != null)
				product.setProduct_size(request.getParameter("product_size"));
			else
				return false;
			if (request.getParameter("product_type") != null)
				product.setProduct_type(request.getParameter("product_type"));
			else
				return false;
			product.setProduct_is_sale(false);
			if (request.getParameter("product_sale_count") != null)
				product.setProduct_sale_count(Integer.parseInt(request
						.getParameter("product_sale_count")));
			else
				return false;
			dao.saveProduct(product, Constants.CHANGE_PRODUCT);
			return true;
		}

	// 删除商品的方法
	private boolean deleteDeal(HttpServletRequest request,
			HttpServletResponse response) {
		if(request.getParameterValues("id")!=null){
		String[] strs = request.getParameterValues("id");
		int[] ids = new int[20];
		int i =0;
		for(String str:strs){
			ids[i++] = Integer.parseInt(str);
		}
		if (dao.deleteProductById(ids)) {
			return true;
		} else {
			return false;
		}
		}
		return false;
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
