package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

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
		if (request.getParameter("action") != null) {
			this.action = request.getParameter("action");
			if (action.equals("add")) // 如果是添加商品
			{
				if (addProduct(request, response)) {
					response.sendRedirect("../productmanager.jsp");
				} else {
					request.setAttribute("fail", "商品管理");
					request.getRequestDispatcher("/failure.jsp").forward(
							request, response);
				}
			}
			if (action.equals("show"))// 如果是显示商品
			{
				request.getRequestDispatcher("/productmanager.jsp").forward(
						request, response);
			}
			if (action.equals("delete")) // 如果是删除商品
			{
				if (deleteDeal(request, response)) {
					response.sendRedirect("../productmanager.jsp");
				} else {
					request.setAttribute("fail", "商品管理");
					request.getRequestDispatcher("/failure.jsp").forward(
							request, response);
				}
			}
			if (action.equals("update")) // 如果是编辑商品
			{
				if (updateProduct(request, response)) {
					response.sendRedirect("../adminproduct.jsp");
				} else {
					request.setAttribute("fail", "商品管理");
					request.getRequestDispatcher("/failure.jsp").forward(
							request, response);
				}
			}
			if (action.equals("search")) // 如果是添加商品
			{
				if (searchProduct(request, response)) {
					response.sendRedirect("../productmanager.jsp");
				} else {
					request.setAttribute("fail", "商品管理");
					request.getRequestDispatcher("/failure.jsp").forward(
							request, response);
				}
			}
			if (action.equals("upproduct")) // 如果是上架商品
			{
				if (upProduct(request, response)) {
					response.sendRedirect("../productmanager.jsp");
				} else {
					request.setAttribute("fail", "商品管理");
					request.getRequestDispatcher("/failure.jsp").forward(
							request, response);
				}
			}
		}

	}

	// 添加商品的方法
	private boolean addProduct(HttpServletRequest request,
			HttpServletResponse response) {
		Product product = new Product();
		if (request.getParameter("product_image") != null&&request.getParameter("product_image") !="") {
			product.setProduct_image(request.getParameter("product_image"));
		} else {
			return false;
		}
		if (request.getParameter("product_color") != null&&request.getParameter("product_image") !="") {
			product.setProduct_color(request.getParameter("product_color"));
		} else {
			return false;
		}
		if (request.getParameter("product_level") != null&&request.getParameter("product_image") !="") {
			product.setProduct_level(request.getParameter("product_level"));
		} else {
			return false;
		}
		if (request.getParameter("product_price") != null&&request.getParameter("product_image") !="") {
			try {
				product.setProduct_price(Integer.parseInt(request
						.getParameter("product_price")));
			} catch (NumberFormatException e) {
				// TODO: handle exception
				System.out.println("");
			}
		} else {
			return false;
		}
		if (request.getParameter("product_name") != null&&request.getParameter("product_image") !="") {
			product.setProduct_name(request.getParameter("product_name"));
		} else {
			return false;
		}
		product.setProduct_show_date(new java.sql.Date(new Date().getTime()));
		if (request.getParameter("product_information") != null&&request.getParameter("product_image") !="") {
			product.setProduct_infomation(request
					.getParameter("product_information"));
		} else {
			return false;
		}
		if (request.getParameter("product_introduction") != null&&request.getParameter("product_image") !="") {
			product.setProduct_introdution(request
					.getParameter("product_introduction"));
		} else {
			return false;
		}
		if (request.getParameter("product_size") != null&&request.getParameter("product_image") !="") {
			product.setProduct_size(request.getParameter("product_size"));
		} else {
			return false;
		}
		if (request.getParameter("product_type") != null&&request.getParameter("product_image") !="") {
			product.setProduct_type(request.getParameter("product_type"));
		} else {
			return false;
		}
		product.setProduct_is_sale(false);
		if (request.getParameter("product_sale_count") != null&&request.getParameter("product_image") !="") {
			try {
				product.setProduct_sale_count(Integer.parseInt(request
						.getParameter("product_sale_count")));
			} catch (NumberFormatException e) {
				// TODO: handle exception
				System.out.println("");
			}

		} else
			return false;
		dao.saveProduct(product, Constants.ADD_ADMIN);
		return true;
	}

	// 查询商品的方法
	private boolean searchProduct(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		Properties pro = new Properties();
		if (request.getParameter("pro") != null)
			pro.setProperty(
					"product_name",
					new String(request.getParameter("pro").getBytes(
							"ISO-8859-1"), "utf-8"));
		else
			return false;
		request.getSession()
				.setAttribute("searchproduct", dao.findProduct(pro));
		return true;
	}

	// 编辑商品的方法
	private boolean updateProduct(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println(request.getParameterValues("checkbox"));
		if (request.getParameterValues("checkbox") != null) {
			String[] strs = request.getParameterValues("checkbox");
			int[] ids = new int[20];
			int i = 0;
			for (String str : strs) {
				ids[i++] = Integer.parseInt(str);
			}
			Product product = dao.findProductById(String.valueOf(ids[0]));
			request.getSession().setAttribute("update", product);
			//dao.saveProduct(product, Constants.CHANGE_PRODUCT);
			return true;
		}
		return false;
		
	}
	// 上架商品的方法
		private boolean upProduct(HttpServletRequest request,
				HttpServletResponse response) {
			System.out.println(request.getParameterValues("checkbox"));
			if (request.getParameterValues("checkbox") != null) {
				String[] strs = request.getParameterValues("checkbox");
				int[] ids = new int[20];
				int i = 0;
				for (String str : strs) {
					ids[i++] = Integer.parseInt(str);
				}
				if(dao.upProductById(ids))
					return true;
				else
					return false;
			}
			return false;
			
		}

	// 删除商品的方法
	private boolean deleteDeal(HttpServletRequest request,
			HttpServletResponse response) {

		if (request.getParameterValues("checkbox") != null) {
			String[] strs = request.getParameterValues("checkbox");
			int[] ids = new int[20];
			int i = 0;
			for (String str : strs) {
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
