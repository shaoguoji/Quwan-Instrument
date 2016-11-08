<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="dao.DealShoppingDao"%>
<%@ page import="entity.DealShopping"%>
<%@ page import="dao.ProductDao"%>
<%@ page import="entity.Product"%>


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

		// alert(node.parentNode.nodeName);
		var rowNode = node.parentNode.parentNode.parentNode;
		// alert(rowNode.parentNode.nodeName);
		var nextNode = rowNode.nextSibling.nextSibling;
		// alert(nextNode.nodeName);
		// rowNode.parentNode.removeChild(rowNode)；
		rowNode.parentNode.removeChild(rowNode);
		// $(nextNode).remove();
		// nextNode.removeNode(false);
		nextNode.innerHTML = "";

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

						<li><a href="account.jsp"><span
								class="glyphicon glyphicon-user"></span> 登录</a>
						</li>
						<li><a href="contact.jsp"><span
								class="glyphicon glyphicon-envelope"></span> 联系我们</a>
						</li>

						<%
							if(session.getAttribute("isLogin")==null){
					 %>
						<li><a href="account.jsp"><span class="glyphicon glyphicon-user"></span> 登录</a></li>
						<%
							}else{
						 %>
						<li><a href="personal_centre.jsp"><span class="glyphicon glyphicon-user"></span> <%=session.getAttribute("user_account") %></a></li>
						<li><a href="servlet/LogoutDealServlet"><span class="glyphicon glyphicon-off"></span> 注销</a></li>
						<%
							}
						 %>
						<li><a href="contact.jsp"><span class="glyphicon glyphicon-envelope"></span> 联系我们</a></li>

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
					<a class="btn btn-1" href="cart.html"><span
						class="glyphicon glyphicon-shopping-cart"></span>购物车 </a>
				</div>
			</div>
		</div>
	</header>
	<!--//////////////////////////////////////////////////-->
	<!--///////////////////0rderForm/////////////////////-->
	<!--//////////////////////////////////////////////////-->
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<!-- <div class="col-lg-2 col-md-2 col-xs-12">
						<ul class="group">
							<li class="list-group-item active" ><a href="#">退货/退款</a></li>
							<li class="list-group-item" ><a href="#">商品投诉</a></li>
							<li class="list-group-item" ><a href="#">售后保修</a></li>
							<li class="list-group-item" ><a href="#">用户评价</a></li>
						</ul>	
					</div> -->
					<div class="col-lg-10 col-md-10 col-xs-12">
						<div class="row">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#">所有订单</a>
								</li>
								<li><a href="#">待付款</a>
								</li>
								<li><a href="#">待发货</a>
								</li>
								<li><a href="#">待收货</a>
								</li>
								<li><a href="#">待评价</a>
								</li>
							</ul>
						</div>

						<div class="row">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="输入订单号进行搜索"></input>
								<div class="input-group-btn">
									<button class="btn btn-default">订单搜索</button>
								</div>
							</div>
						</div>

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

						<div class="row">
							<div class="col-md-6">
								<input type="checkbox" onclick="selectAll(this)">全选</input>
								<button onclick="confirm()">批量确认收货</button>
							</div>

							<div class="col-md-6">
								<p class="text-right">
									<button class="glyphicon glyphicon-chevron-left">上一页</button>
									<button class="glyphicon glyphicon-chevron-right">下一页</button>
								</p>
							</div>
						</div>


						<!-- 循环的开始 -->
						<%
							// ArrayList<DealShopping> list= new ArrayList<DealShopping>();
							ArrayList<ArrayList<DealShopping>> lists = new ArrayList<ArrayList<DealShopping>>();
							DealShoppingDao dealDao = new DealShoppingDao();
							ProductDao pDao = new ProductDao();
							Product product = new Product();
							lists = dealDao.getDealsByUsername("钟志坚");
							if (lists != null && lists.size() > 0) {
								for (ArrayList<DealShopping> list : lists) {
									if (list != null && list.size() > 0) {
										for (DealShopping deal : list) {
											if (deal.getDeal().getIs_delete() == 0) {
											product = pDao.findProductById(String
										.valueOf(deal.getProduct_id()));
						%>



						<div class="row top" style="margin-bottom: 0px;">
							<div class="col-md-5">
								<input type="checkbox" name="orderItems">时间：<span><%=deal.getDeal().getDeal_create_date()%></span>&nbsp;&nbsp;&nbsp;订单号:<span><%=deal.getShopping_number()%></span>
							</div>

							<div class="col-md-7">
								<p class="text-right">
									<a href="javascript:void(0)" onclick="deleteOrder(this)"><i
										class="glyphicon glyphicon-trash"></i>
									</a>
								</p>
							</div>
						</div>

						<div class="row">
							<div class="product well">
								<div class="col-md-1">
									<div class="image">
										<a href="product.html"><img src="images/galaxy-note-4.jpg" />
										</a>
									</div>
								</div>
								<div class="col-md-2">
									<div class="caption">
										<div class="name">
											<h3>
												<a href="product.jsp"><%=product
										.getProduct_name()%></a>
											</h3>
										</div>
									</div>
								</div>
								
								<div class="col-md-1">
									
										<div class="price"><%=product
										.getProduct_price()%><div>$122</div>
										</div>
									</div>
								</div>
								
								<div class="col-md-1">
									<div class="image">
									<div class="count">
									<%=deal.getProduct_count()%>
										</div>
									</div>
								</div>
								
								<div class="col-md-1">
									<span><%=product
										.getProduct_price()
										* deal.getProduct_count()%></span>
								</div>
								<div class="col-md-2">
									<a href="#">查看物流</a>
								</div>
								<div class="col-md-2">
									<a href="salesReturn.html">退款/退货/返修</a><br>

								</div>
								<div class="col-md-2">
									<a href="#" class="btn btn-default">确认收货</a><br>
									<div style="height: 5px;"></div>
									<a href="itemComment.html" class="btn btn-default">评价晒单</a>
								</div>
							</div>
						</div>


						<%
							}
										}
									}
								}
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
