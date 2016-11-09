<%@page import="entity.Deal"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>
<%@ page import="dao.DealshoppingDao"%>
<%@ page import="entity.DealShopping"%>
<%@ page import="dao.ProductDao"%>
<%@ page import="entity.Product"%>
<%@ page import="entity.Users"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<title>我的订单</title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">

<!-- Custom CSS -->
<link rel="stylesheet" href="css/style.css">


<!-- Custom Fonts -->
<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="fonts/font-slider.css" type="text/css">
<!-- jQuery and Modernizr-->
<script src="js/jquery-2.1.1.js"></script>

<!-- Core JavaScript Files -->
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	function deleteOrder(node) {

		var rowNode = node.parentNode.parentNode.parentNode;
		var nextNode = rowNode.nextSibling.nextSibling;
		rowNode.parentNode.removeChild(rowNode);
		nextNode.parentNode.removeChild(nextNode);

	}
	function selectAll(node) {
		var collItemNodes = document.getElementsByName("orderItems");
		for ( var x = 0; x < collItemNodes.length; x++) {
			collItemNodes[x].checked = node.checked;
		}
	}
</script>

<style type="text/css">
.well {
	height: 130px;
	background-color: white;
}

a:hover {
	color: red;
	text-decoration: underline;
}

.input-group {
	width: 50%;
}

.top {
	border: 1px solid #DCD8D8;
	background-color: #F7F5F6;
	height: 30px;
	line-height: 30px;
}

.fl {
	float: left;
}

.th_r {
	border-right: 1px solid #DCD8D8;
}

.addBorder {
	border: 1px solid #DCD8D8;
}
</style>
</head>
<body>
	<nav id="top">
		<div class="container">
			<div class="row">

				<div class="col-xs-6">

					<div class="col-xs-6">
						<ul class="top-link">
							<li><a href="index.jsp"><span
									class="glyphicon glyphicon-home"></span> 趣玩乐器网上商城</a>
							</li>
						</ul>
					</div>

				</div>

				<div class="col-xs-6">
					<ul class="top-link">
						<%
							if (session.getAttribute("isLogin") == null) {
						%>
						<li><a href="account.jsp"><span
								class="glyphicon glyphicon-user"></span> 登录</a>
						</li>
						<%
							} else {
						%>
						<li><a href="personal_centre.jsp"><span
								class="glyphicon glyphicon-user"></span> <%=session.getAttribute("user_account")%></a>
						</li>
						<li><a href="servlet/LogoutDealServlet"><span
								class="glyphicon glyphicon-off"></span> 注销</a>
						</li>
						<%
							}
						%>
						<li><a href="contact.jsp"><span
								class="glyphicon glyphicon-envelope"></span> 联系我们</a>
						</li>
					</ul>
				</div>

			</div>
		</div>
	</nav>
	<!--Header-->
	<header class="container">
		<div class="row">
			<div class="col-md-4">
				<div id="logo">
					<img src="images/logo.png" />
				</div>
			</div>
			<div class="col-md-4">
				<form class="form-search">
					<input type="text" class="input-medium search-query">
					<button type="submit" class="btn">
						<span class="glyphicon glyphicon-search"></span>
					</button>
				</form>
			</div>
			<div class="col-md-4">
				<div id="cart">
					<a class="btn btn-1" href="cart.jsp"><span
						class="glyphicon glyphicon-shopping-cart"></span>购物车</a>
				</div>
			</div>
		</div>
	</header>
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<div class="col-lg-12 col-md-12 col-xs-12">
						<div class="row">

						
								<a href="servlet/DealShoppingServlet?action=query" class="btn btn-1">所有订单</a>
								<a href="servlet/DealShoppingServlet?action=querybytype&deal_type=paied" class="btn btn-1">&nbsp待收货&nbsp</a>
								<a href="servlet/DealShoppingServlet?action=querybytype&deal_type=recievednotcomment" class="btn btn-1">&nbsp待评价&nbsp</a>
								


						</div>
						<form action="servlet/DealShoppingServlet" class="form-search"
							method="post">
							<div class="row">
								<div class="input-group">
									<input type="text" name="deal_shopnumber" class="form-control"
										placeholder="输入订单号进行搜索"></input>
									<div class="input-group-btn">
										<input type="hidden" name="action" value="querybynum">
										<button class="btn btn-default" type="submit">订单搜索</button>


									</div>
								</div>
							</div>
						</form>
						<div class="row"
							style="border:1px solid #DCD8D8;background-color: #F7F5F6;">
							<div class="col-md-3 th_r">
								<div>宝贝</div>
							</div>

							<div class="col-md-1 th_r">
								<div>单价</div>
							</div>
							<div class="col-md-1 th_r">
								<div>数量</div>
							</div>
							<div class="col-md-1 th_r">
								<div>实付额</div>
							</div>
							<div class="col-md-2 th_r">
								<div>交易状态</div>
							</div>
							<div class="col-md-2 th_r">
								<div>交易操作</div>
							</div>
							<div class="col-md-2 th_r">
								<div>商品操作</div>
							</div>
						</div>

						<!-- <div class="row">
							<div class="col-md-3" style="margin-top: 20px;">
								&nbsp;&nbsp;&nbsp;
								<button onclick="confirm()">批量确认收货</button>
							</div>

							<div class="col-md-9">
								<p class="text-right">
								<ul class="pager">
									<li><a href="#">前一页</a>
									</li>
									<li><a href="#">后一页</a>
									</li>
								</ul>
								</p>
							</div>
						</div> -->

						<!-- 循环的开始 -->
						<%
							boolean VIP = false;
							float price = 0;
							float sumPrice = 0;
							if (session.getAttribute("user") != null) {
								VIP = ((Users) session.getAttribute("user")).isUserVip();
								ArrayList<ArrayList<DealShopping>> lists = new ArrayList<ArrayList<DealShopping>>();
								DealshoppingDao dealDao = new DealshoppingDao();
								ProductDao pDao = new ProductDao();
								Product product = new Product();
								Users user = (Users) session.getAttribute("user");

								if (session.getAttribute("dealbynum") != null) {
									lists = (ArrayList<ArrayList<DealShopping>>) session
											.getAttribute("dealbynum");
								} else if (session.getAttribute("dealbytype") != null) {
									lists = (ArrayList<ArrayList<DealShopping>>) session
											.getAttribute("dealbytype");
								} else {
									lists = dealDao.getDealsByUsername(user.getUserName());
								}
								if (lists != null && lists.size() > 0) {
									for (ArrayList<DealShopping> list : lists) {
										if (list != null && list.size() > 0) {
											for (DealShopping deal : list) {
												if (deal.getDeal().getIs_delete() == 0) {
													product = pDao.findProductById(String
															.valueOf(deal.getProduct_id()));
													if (list.indexOf(deal) == 0) {
						%>
						<div class="row top" style="margin-bottom: 0px;">
							<div class="col-md-5">
								<div>
									时间：<span><%=deal.getDeal()
												.getDeal_create_date()%></span>&nbsp;&nbsp;&nbsp;订单号:<span><%=deal.getShopping_number()%></span>
								</div>
							</div>

							<div class="col-md-7">
								<p class="text-right">
									<a
										href="servlet/DealShoppingServlet?action=delete&deal_id=<%=deal.getDeal().getDeal_id()%>"><i
										class="glyphicon glyphicon-trash"></i> </a>
								</p>
							</div>
						</div>
						<%
							}
						%>
						<%
							if (list.indexOf(deal) == 0) {
														sumPrice = 0;
						%>
						<div class="row addBorder">
							<%
								}
							%>
							<div class="row">
								<div class="col-md-1">
									<div>
										<a href="product.html"><img
											src=<%=product.getProduct_image()%> /> </a>
									</div>
								</div>
								<div class="col-md-2">
									<div>
										<div class="name">
											<a href="product.html"><%=product.getProduct_name()%></a>
										</div>
										<div class="info">
											<div>
												尺寸:
												<%=product.getProduct_size()%></div>
											<div>
												颜色:
												<%=product.getProduct_color()%></div>
										</div>
									</div>
								</div>

								<div class="col-md-1">
									<%
										if (VIP) {
																	price = product.getProduct_price() * 0.95f;
																} else {
																	price = product.getProduct_price();

																}
									%>
									<div class="price">
										<div>
											￥<%=price%></div>

									</div>
								</div>
								<div class="col-md-1">
									<div style="text-align: center;"><%=deal.getProduct_count()%>件
									</div>
								</div>
								<div class="col-md-1">
									<div>
										￥<%=price * deal.getProduct_count()%>
										<%
											sumPrice = sumPrice
																			+ (price * deal.getProduct_count());
										%>
									</div>
								</div>
								<%
									if (list.indexOf(deal) == list.size() - 1) {
								%>
								<div class="col-md-2">
									<div>
										订单总价￥
										<%=sumPrice%></div>
								</div>
								<div class="col-md-2">
									<a
										href="salelater.jsp?deal_id=<%=deal.getDeal().getDeal_id()%>&product_id=<%=product.getProduct_id()%>">退款/退货/返修</a><br>
								</div>

								<%
									if (!(deal.getDeal().getDeal_state())
																		.equals("recievednotcomment")
																		&& !(deal.getDeal()
																				.getDeal_state())
																				.equals("recieved")) {
								%>
								<div class="col-md-2">
									<a
										href="servlet/DealShoppingServlet?action=sure&deal_id=<%=deal.getDeal()
													.getDeal_id()%>"
										class="btn btn-default">确认收货</a>
									<div style="height: 5px;"></div>
								</div>
								<%
									}
								%>
								<%
									if (!(deal.getDeal().getDeal_state())
																		.equals("paied")
																		&& !(deal.getDeal()
																				.getDeal_state())
																				.equals("recieved")) {
								%>
								<div class="col-md-2">
									<a
										href="addcomment.jsp?product_name=<%=product.getProduct_name()%>&deal_id=<%=deal.getDeal()
													.getDeal_id()%>"
										class="btn btn-default">评价晒单</a>
									<div style="height: 5px;"></div>
								</div>
								<%
									}
								%>
								<%
									if (!(deal.getDeal().getDeal_state())
																		.equals("recievednotcomment")
																		&& !(deal.getDeal()
																				.getDeal_state())
																				.equals("paied")) {
								%>
								<div class="col-md-2"></div>
								<%
									}
								%>


								<%
									}
								%>
							</div>
							<%
								if (list.indexOf(deal) == (list.size() - 1)) {
							%>
						</div>
						<%
							}
						%>

						<%
							}
											}
										}
									}
								}
							} else {
								response.sendRedirect("account.jsp");
							}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>

	<footer>
		<div class="container">
			<div class="wrap-footer">
				<div class="row">
					<div class="col-md-3 col-footer footer-1">
						<img src="images/logofooter.png" />
						<p>Lorem Ipsum is simply dummy text of the printing and
							typesetting industry.Lorem Ipsum is simply dummy text of the
							printing and typesetting industry.</p>
					</div>
					<div class="col-md-3 col-footer footer-2">
						<div class="heading">
							<h4>用户服务</h4>
						</div>
						<ul>
							<li><a href="#">关于我们</a>
							</li>
							<li><a href="#">物流信息</a>
							</li>
							<li><a href="#">隐私策略</a>
							</li>
							<li><a href="#">购物须知</a>
							</li>
							<li><a href="#">联系我们</a>
							</li>
						</ul>
					</div>
					<div class="col-md-3 col-footer footer-3">
						<div class="heading">
							<h4>我的账户</h4>
						</div>
						<ul>
							<li><a href="#">我的账户</a>
							</li>
							<li><a href="#">品牌</a>
							</li>
							<li><a href="#">优惠卷</a>
							</li>
							<li><a href="#">特价</a>
							</li>
							<li><a href="#">网站导航</a>
							</li>
						</ul>
					</div>
					<div class="col-md-3 col-footer footer-4">
						<div class="heading">
							<h4>联系我们</h4>
						</div>
						<ul>
							<li><span class="glyphicon glyphicon-home"></span>仲恺农业工程学院</li>
							<li><span class="glyphicon glyphicon-earphone"></span>+86
								8866888111</li>
							<li><span class="glyphicon glyphicon-envelope"></span>infor@yoursite.com</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="copyright">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						Copyright &copy; 2015.Company name All rights reserved.<a
							target="_blank" href="#"">&#x8da3;&#x73a9;&#x4e50;&#x5668;&#x7f51;&#x4e0a;&#x5546;&#x57ce;</a>
					</div>
					<div class="col-md-6">
						<div class="pull-right">
							<ul>
								<li><img src="images/visa-curved-32px.png" />
								</li>
								<li><img src="images/paypal-curved-32px.png" />
								</li>
								<li><img src="images/discover-curved-32px.png" />
								</li>
								<li><img src="images/maestro-curved-32px.png" />
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>

</body>
</html>