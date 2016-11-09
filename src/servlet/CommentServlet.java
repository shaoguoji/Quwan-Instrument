package servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.DealShoppingDao;
import entity.Comment;


@SuppressWarnings("serial")
public class CommentServlet extends HttpServlet {

	private DealShoppingDao dealDao = new DealShoppingDao();// 商品业务逻辑类的对象

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
					request.setAttribute("fail", "添加评论");
					request.getRequestDispatcher("/failure.jsp").forward(
							request, response);
				}
	}

	// 添加评论的方法
	private boolean addComment(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		String userName = null;
		String productName = null;
		Comment comment = new Comment();
		comment.setComment_date(new Date());
		request.setCharacterEncoding("utf-8");
		System.out.println(request.getParameter("comment_content"));
		System.out.println(request.getParameter("comment_degree"));
		System.out.println(request.getParameter("deal_id"));
		System.out.println(request.getParameter("product_name"));
		System.out.println(request.getSession().getAttribute("user_name").toString());
		if (request.getParameter("comment_content") != null) {
			comment.setComment_content(request.getParameter("comment_content"));
		}
		if (request.getParameter("comment_degree") != null) {
			comment.setComment_degree(request.getParameter("comment_degree"));
		}
		if (request.getSession().getAttribute("user_name") != null) {
			userName = request.getSession().getAttribute("user_name").toString();
		}
		if (request.getParameter("product_name") != null) {
			productName = request.getParameter("product_name");
		}
		if (dealDao.DealComment(userName, productName, comment)) {
			System.out.println("添加评论成功");
			dealDao.CommentProduct(Integer.parseInt(request.getParameter("deal_id")));
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
