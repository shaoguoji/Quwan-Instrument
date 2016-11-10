package servlet;

import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.DealshoppingDao;
import dao.ProductDao;
import entity.Comment;
import entity.Product;


@SuppressWarnings("serial")
public class CommentServlet extends HttpServlet {

	private DealshoppingDao dealDao = new DealshoppingDao();// 商品业务逻辑类的对象

	/**
	 * Constructor of the object.
	 */
	public CommentServlet() {
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
				if (addComment(request, response)) {
					response.sendRedirect("../deal.jsp");
				} else {
					request.getRequestDispatcher("/failure.jsp").forward(
							request, response);
				}
	}

	// 添加评论的方法
	private boolean addComment(HttpServletRequest request,
			HttpServletResponse response) {
		String userName = null;
		String productName = null;
		ProductDao dao = new ProductDao();
		Comment comment = new Comment();
		System.out.println(request.getSession().getAttribute("user_name"));
		System.out.println(request.getSession().getAttribute("product_name").toString());
		comment.setComment_date(new Date());
		if (request.getParameter("comment_content") != null) {
			comment.setComment_content(request.getParameter("comment_content"));
		}
		if (request.getParameter("comment_degree") != null) {
			comment.setComment_degree(request.getParameter("comment_degree"));
		}
		if (request.getSession().getAttribute("user_name") != null) {
			userName = request.getSession().getAttribute("user_name").toString();
		}
		if (request.getSession().getAttribute("product_name") != null) {
			
			Product p = dao.findProductById(request.getSession().getAttribute("product_name").toString());
			productName = p.getProduct_name();
			
		}
		if (dealDao.DealComment(userName, productName, comment)) {
			System.out.println("添加评论成功");
			return true;
		} else {
			System.out.println("添加评论失败");
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
