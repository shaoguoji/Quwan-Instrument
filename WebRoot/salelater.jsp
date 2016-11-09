<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@page import="entity.Users"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>售后服务</title>
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
								class="glyphicon glyphicon-user"></span> 登录</a></li>
						<%
							} else {
						%>
						<li><a href="personal_centre.jsp"><span
								class="glyphicon glyphicon-user"></span> <%=session.getAttribute("user_account")%></a>
						</li>
						<li><a href="servlet/LogoutDealServlet"><span
								class="glyphicon glyphicon-off"></span> 注销</a></li>
						<%
							}
						%>
						</li>
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
						class="glyphicon glyphicon-shopping-cart"></span>购物车 </a>
				</div>
			</div>
		</div>
	</header>
	<%
		if (session.getAttribute("user") != null) {
			session.setAttribute("user_id",
					((Users) session.getAttribute("user")).getUserId());
		}else{response.sendRedirect("account.jsp");}
	%>

	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="tabbable">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#1" data-toggle="tab">我要退货</a>
						</li>
						<li><a href="#2" data-toggle="tab">我要退款(无需退货)</a>
						</li>
						<li><a href="#3" data-toggle="tab">我要返修</a>
						</li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="1">
							<form class="form-horizontal"
								action="servlet/UserSaleLaterServlet">
								<div class="form-group">
									<label class="col-sm-2 control-label">退货原因：</label>
									<div class="col-sm-6">
										<select name="" id="" class="form-control">
											<option value="1">请选择退货原因</option>
											<option value="2">无收到商品</option>
											<option value="8">商品损坏</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">退货说明：</label>
									<div class="col-sm-6">
										<textarea class="form-control " name="salelater"></textarea>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"></label>
									<div class="col-sm-2">
										<input type="hidden" name="product_id"
											value=<%=request.getParameter("product_id")%>> <input
											type="hidden" name="deal_id"
											value=<%=request.getParameter("deal_id")%>> <input
											type="hidden" name="salelater_type" value="5">
										<button>提交退货申请</button>
									</div>
								</div>
							</form>
						</div>
						<div class="tab-pane" id="2">
							<form class="form-horizontal"
								action="servlet/UserSaleLaterServlet">
								<div class="form-group">
									<label class="col-sm-2 control-label">是否收货：</label>
									<div class="col-sm-3">
										<div class="form-control" style="border:none;">
											<input type="radio" name="gender">未收到货&nbsp;&nbsp;&nbsp;<input
												type="radio" name="gender">已经收到货
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">退款原因：</label>
									<div class="col-sm-6">
										<select name="" id="" class="form-control">
											<option value="1">请选择退款原因</option>
											<option value="2">7天无理由退换货</option>
											<option value="3">退运费</option>
											<option value="4">做工粗糙/有瑕疵</option>
											<option value="5">颜色、图案、款式与商品描述不符</option>
											<option value="6">材质面料与商品描述不符</option>
											<option value="7">少件/漏发</option>
											<option value="8">卖家发错货</option>
											<option value="9">包装/商品破损/污渍/变形</option>
											<option value="10">未按约定时间发货</option>
											<option value="11">发票问题</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label">退款说明：</label>
									<div class="col-sm-6">
										<textarea name="salelater" class="form-control "></textarea>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"></label>
									<div class="col-sm-2">
										<input type="hidden" name="salelater_type" value="4">
										<input type="hidden" name="product_id"
											value=<%=request.getParameter("product_id")%>> <input
											type="hidden" name="deal_id"
											value=<%=request.getParameter("deal_id")%>>
										<button>提交退款申请</button>
									</div>
								</div>
							</form>
						</div>

						<div class="tab-pane " id="3">
							<form class="form-horizontal"
								action="servlet/UserSaleLaterServlet">
								<div class="form-group">
									<label class="col-sm-2 ">申请凭据：</label>
									<div class="col-sm-6">
										<input type="checkbox">有发票</input> <input type="checkbox">有保修凭据</input>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 ">问题描述：</label>
									<div class="col-sm-6">
										<textarea class="form-control "></textarea>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label"></label>
									<div class="col-sm-2">
										<input type="hidden" name="salelater_type" value="4">
										<input type="hidden" name="product_id"
											value=<%=request.getParameter("product_id")%>> <input
											type="hidden" name="deal_id"
											value=<%=request.getParameter("deal_id")%>>
										<button>提交返修申请</button>
									</div>
								</div>
							</form>
						</div>
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
