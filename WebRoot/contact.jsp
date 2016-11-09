<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="">
    <meta name="author" content="">
	
    <title>联系我们</title>
	
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css"  type="text/css">
	
	<!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css">
	
	
	<!-- Custom Fonts -->
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css"  type="text/css">
    <link rel="stylesheet" href="fonts/font-slider.css" type="text/css">
	
	<!-- jQuery and Modernizr-->
	<script src="js/jquery-2.1.1.js"></script>
	
	<!-- Core JavaScript Files -->  	 
    <script src="js/bootstrap.min.js"></script>
	
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<!--Top-->
	<nav id="top">
		<div class="container">
			<div class="row">
			
				<div class="col-xs-6">

					<div class="col-xs-6">
						<ul class="top-link">
							<li><a href="index.jsp"><span class="glyphicon glyphicon-home"></span> 趣玩乐器网上商城</a></li>
						</ul>
					</div>
					

				</div>
				
				<div class="col-xs-6">
					<ul class="top-link">
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
				<a href="index.jsp"><div id="logo"><img src="images/logo.png" /></div></a>
			</div>
			<div class="col-md-4">
				<form action="servlet/ProductFilterServlet"  class="form-search" method="post">  
					<input name="search" type="text" class="input-medium search-query">  
					<input name="action" type="hidden" value="query">
					<button type="submit" class="btn"><span class="glyphicon glyphicon-search"></span></button>  
				</form>
			</div>
			<div class="col-md-4">

				<div id="cart"><a class="btn btn-1" href="cart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span>购物车   </a></div>
			</div>
		</div>
	</header>
	<!--Navigation-->
 <nav id="menu" class="navbar">
		<div class="container">
			<div class="navbar-header"><span id="heading" class="visible-xs">Categories</span>
			  <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
			</div>
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav">

					<li><a href="index.jsp">首页</a></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">西洋乐器</a>
						<div class="dropdown-menu">
							<div class="dropdown-inner">
								<ul class="list-unstyled">
									<li><a href="category.jsp">吉他</a></li>
									<li><a href="category.jsp">钢琴</a></li>
									<li><a href="category.jsp">萨克斯风</a></li>
									<li><a href="category.jsp">架子鼓他</a></li>
									<li><a href="category.jsp">小提琴</a></li>
									<li><a href="category.jsp">单簧</a></li>
								</ul>
							</div>
						</div>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">民族乐器</a>
						<div class="dropdown-menu">
							<div class="dropdown-inner">
								<ul class="list-unstyled">
									<li><a href="category.jsp">古琴</a></li>
									<li><a href="category.jsp">葫芦丝</a></li>
									<li><a href="category.jsp">二胡</a></li>
									<li><a href="category.jsp">古筝</a></li>
									<li><a href="category.jsp">笛子</a></li>
									<li><a href="category.jsp">陶笛</a></li>
									<li><a href="category.jsp">阮</a></li>
								</ul>
							</div> 
						</div>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">电声乐器</a>
						<div class="dropdown-menu">
							<div class="dropdown-inner">
								<ul class="list-unstyled">
									<li><a href="category.jsp">电钢琴</a></li>
									<li><a href="category.jsp">电子琴</a></li>
									<li><a href="category.jsp">电吉他</a></li>
									<li><a href="category.jsp">电子鼓</a></li>
								</ul>
							</div> 
						</div>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">乐器品牌</a>
						<div class="dropdown-menu" style="margin-left: -203.625px;">
							<div class="dropdown-inner">
								<ul class="list-unstyled">
									<li><a href="category.jsp">珠江钢琴</a></li>
									<li><a href="category.jsp">英昌</a></li>
									<li><a href="category.jsp">雅马哈</a></li>
									<li><a href="category.jsp">星海</a></li>
								</ul>
								<ul class="list-unstyled">
									<li><a href="category.jsp">星臣</a></li>
									<li><a href="category.jsp">海伦钢琴</a></li>
									<li><a href="category.jsp">卡西欧</a></li>
									<li><a href="category.jsp">卡瓦依</a></li>
									<li><a href="category.jsp">敦煌</a></li>
								</ul>
								<ul class="list-unstyled">
									<li><a href="category.jsp">红棉吉他</a></li>
									<li><a href="category.jsp">乐海</a></li>
									<li><a href="category.jsp">凤灵</a></li>
									<li><a href="category.jsp">托雅玛</a></li>
									<li><a href="category.jsp">T&T</a></li>
								</ul>
							</div>
						</div>
					</li>
					<li><a href="category.jsp">其他配件</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!--//////////////////////////////////////////////////-->
	<!--///////////////////Contact Page///////////////////-->
	<!--//////////////////////////////////////////////////-->
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">

						<li><a href="index.jsp">首页</a></li>
						<li><a href="contact.jsp">联系我们</a></li>

					</ul>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="heading"><h1>联系我们</h1></div>
				</div>
				<div class="col-md-6" style="margin-bottom: 30px;">
					<form name="form1" id="ff" method="post" action="contact.php">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="您的姓名 *" name="name" id="name" required data-validation-required-message="Please enter your name.">
						</div>
						<div class="form-group">
							<input type="email" class="form-control" placeholder="您的邮箱 *" name="email" id="email" required data-validation-required-message="Please enter your email address.">
						</div>
						<div class="form-group">
							<input type="tel" class="form-control" placeholder="您的手机号码 *" name="phone" id="phone" required data-validation-required-message="Please enter your phone number.">
						</div>
						<div class="form-group">
							<textarea class="form-control" placeholder=" ***" name="message" id="message" required data-validation-required-message="Please enter a message."></textarea>
						</div>
						<button type="submit" class="btn btn-1">发送</button>
					</form>
				</div>
				<div class="col-md-6">
					<p><span class="glyphicon glyphicon-home"></span> 仲恺农业工程学院</p>
					<p><span class="glyphicon glyphicon-earphone"></span> +86 888 888 90 , +86 888 88891</p>
					<p><span class="glyphicon glyphicon-envelope"></span> info@yourdomain.com</p>
					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.289259162295!2d-120.7989351!3d37.5246781!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8091042b3386acd7%3A0x3b4a4cedc60363dd!2sMain+St%2C+Denair%2C+CA+95316%2C+Hoa+K%E1%BB%B3!5e0!3m2!1svi!2s!4v1434016649434" width="95%" height="230" frameborder="0" style="border:0"></iframe>
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
						<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
					</div>
					<div class="col-md-3 col-footer footer-2">
						<div class="heading"><h4>用户服务</h4></div>
						<ul>
							<li><a href="#">关于我们</a></li>
							<li><a href="#">物流信息</a></li>
							<li><a href="#">隐私策略</a></li>
							<li><a href="#">购物须知</a></li>
							<li><a href="#">联系我们</a></li>
						</ul>
					</div>
					<div class="col-md-3 col-footer footer-3">
						<div class="heading"><h4>我的账户</h4></div>
						<ul>
							<li><a href="#">我的账户</a></li>
							<li><a href="#">品牌</a></li>
							<li><a href="#">优惠卷</a></li>
							<li><a href="#">特价</a></li>
							<li><a href="#">网站导航</a></li>
						</ul>
					</div>
					<div class="col-md-3 col-footer footer-4">
						<div class="heading"><h4>联系我们</h4></div>
						<ul>
							<li><span class="glyphicon glyphicon-home"></span>仲恺农业工程学院</li>
							<li><span class="glyphicon glyphicon-earphone"></span>+86 8866888111</li>
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
						Copyright &copy; 2015.Company name All rights reserved.<a target="_blank" href="#"">&#x8da3;&#x73a9;&#x4e50;&#x5668;&#x7f51;&#x4e0a;&#x5546;&#x57ce;</a>
					</div>
					<div class="col-md-6">
						<div class="pull-right">
							<ul>
								<li><img src="images/visa-curved-32px.png" /></li>
								<li><img src="images/paypal-curved-32px.png" /></li>
								<li><img src="images/discover-curved-32px.png" /></li>
								<li><img src="images/maestro-curved-32px.png" /></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>
