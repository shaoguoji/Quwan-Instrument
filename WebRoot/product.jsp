<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@page import="entity.Product"%>
<%@page import="entity.Comment"%>
<%@page import="entity.Users"%>
<%@page import="java.text.DecimalFormat"%>

<jsp:useBean id="productDao" class="dao.ProductDao" scope="page"/>
<jsp:useBean id="usersDao" class="dao.UsersDao" scope="page"/>
<jsp:useBean id="commentDao" class="dao.CommentDao" scope="page"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
Product product = productDao.findProductById(id);
DecimalFormat formater = new DecimalFormat("#0.##");

// 获取商品图片
StringBuilder image = new StringBuilder(product.getProduct_image());
String imageName = image.delete(image.length() - 4, image.length()).toString(); // 去掉.jpg后缀

// 获取商品评论
ArrayList<Comment> comments = new ArrayList<Comment>();
comments = commentDao.getCommentsByProductname(product.getProduct_name());

// 获取发表评论用户
ArrayList<Users> users = new ArrayList<Users>();
for (Comment cm : comments)
{
	Users user;
	user = usersDao.getUserById(String.valueOf(cm.getUser_id()));
	users.add(user);
}

// 获取当前登陆用户
Users loginUser = null;
if(request.getSession().getAttribute("user") != null)
{
	loginUser = (Users)request.getSession().getAttribute("user");
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="">
    <meta name="author" content="">
    <title><%=product.getProduct_name()+" - "%>商品详情</title>


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
    
    <script src="js/photo-gallery.js"></script>
	
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
    <![endif]-->
    
    <script type="text/javascript" src="js/lhgcore.js"></script>
    <script type="text/javascript" src="js/lhgdialog.js"></script>
    <script type="text/javascript">
      function selflog_show(id)
      {   	
         var num =  document.getElementById("number").value; 
         window.location.href = "servlet/CartServlet?id="+id+"&num="+num+"&action=add";
         //J.dialog.get({id: 'haoyue_creat',title: '购物成功',width: 600,height:400, link: '<%=path%>/servlet/CartServlet?id='+id+'&num='+num+'&action=add', cover:true});
      }
      function add()
      {
         var num = parseInt(document.getElementById("number").value);
         if(num<100)
         {
            document.getElementById("number").value = ++num;
         }
      }
      function sub()
      {
         var num = parseInt(document.getElementById("number").value);
         if(num>1)
         {
            document.getElementById("number").value = --num;
         }
      }
    </script>
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

				<div id="cart"><a class="btn btn-1" href="cart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span>购物车 </a></div>
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
					<li><a href="index.jsp">Home</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">PC Computers</a>
						<div class="dropdown-menu">
							<div class="dropdown-inner">
								<ul class="list-unstyled">
									<li><a href="category.jsp">Window</a></li>
									<li><a href="category.jsp">MacBook</a></li>
								</ul>
							</div>
						</div>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Laptops &amp; Notebooks</a>
						<div class="dropdown-menu">
							<div class="dropdown-inner">
								<ul class="list-unstyled">
									<li><a href="category.jsp">Dell</a></li>
									<li><a href="category.jsp">Asus</a></li>
									<li><a href="category.jsp">Samsung</a></li>
									<li><a href="category.jsp">Lenovo</a></li>
									<li><a href="category.jsp">Acer</a></li>
								</ul>
							</div> 
						</div>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Mobiles &amp; Tablet</a>
						<div class="dropdown-menu" style="margin-left: -203.625px;">
							<div class="dropdown-inner">
								<ul class="list-unstyled">
									<li><a href="category.jsp">Iphone</a></li>
									<li><a href="category.jsp">Samsung</a></li>
									<li><a href="category.jsp">Nokia</a></li>
									<li><a href="category.jsp">Lenovo</a></li>
									<li><a href="category.jsp">Google</a></li>
								</ul>
								<ul class="list-unstyled">
									<li><a href="category.jsp">Nexus</a></li>
									<li><a href="category.jsp">Dell</a></li>
									<li><a href="category.jsp">Oppo</a></li>
									<li><a href="category.jsp">Blackberry</a></li>
									<li><a href="category.jsp">HTC</a></li>
								</ul>
								<ul class="list-unstyled">
									<li><a href="category.jsp">LG</a></li>
									<li><a href="category.jsp">Q-Mobiles</a></li>
									<li><a href="category.jsp">Sony</a></li>
									<li><a href="category.jsp">Wiko</a></li>
									<li><a href="category.jsp">T&T</a></li>
								</ul>
							</div>
						</div>
					</li>
					<li><a href="category.jsp">Software</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!--//////////////////////////////////////////////////-->
	<!--///////////////////Product Page///////////////////-->
	<!--//////////////////////////////////////////////////-->
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">

						<li><a href="index.jsp">首页</a></li>
						<li><a href="category.jsp">分类</a></li>
						<li><a href="#">三星 盖乐世</a></li>

					</ul>
				</div>
			</div>
			<div class="row">
				<div id="main-content" class="col-md-12">
					<div class="product">
						<div class="col-md-6">
								<div class="image">
									<img class="img-responsive center-block" src="<%=image + ".jpg" %>" />
								<div class="image-more">
									 <ul class="row">
										 <li class="col-lg-3 col-sm-3 col-xs-4">
											<a href="#"><img class="img-responsive" src="<%=image + ".jpg" %>"></a>
										</li>
										 <li class="col-lg-3 col-sm-3 col-xs-4">
											<a href="#"><img class="img-responsive" src="<%=image + "-1.jpg" %>"></a>
										</li>
										 <li class="col-lg-3 col-sm-3 col-xs-4">
											<a href="#"><img class="img-responsive" src="<%=image + "-2.jpg" %>"></a>
										</li>
										 <li class="col-lg-3 col-sm-3 col-xs-4">
											<a href="#"><img class="img-responsive" src="<%=image + "-3.jpg" %>"></a>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="caption">
								<div class="name"><h3><%= product.getProduct_name() %></h3></div>
								
								<%
									if (loginUser != null)
									{
										if (loginUser.isUserVip())
										{
								 %>
											会员价：<div class="price"><h3>¥<%= formater.format(product.getProduct_price() * 0.95) %></h3><div>¥<%= product.getProduct_price() %></div></div>
								<%
										}
										else
										{
								%>		
											<div class="price"><h3>¥<%= product.getProduct_price()%></h3></div>
								<%
										}
									}
									else
									{
								 %>
								 		<div class="price"><h3>¥<%= product.getProduct_price()%></h3></div>
								 <%
								 	}
								  %>
								
								<strong><p><%= product.getProduct_introdution() %></p></strong>
								<div class="options">
									可用选项
									<select>
										<option value="" selected>----请选择物流----</option>
										<option value="red">快递</option>
										<option value="black">EMS</option>
									</select>
								</div>
								<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span></div>
								<div class="well"><label>数量: </label> <span class="btn" id="sub" onclick="sub();">-</span><input id="number" class="form-inline quantity" type="text" value="1" /><span class="btn" id="add" onclick="add();">+</span><a href="javascript:selflog_show(<%=id%>)" class="btn btn-2 "><span class="glyphicon glyphicon-shopping-cart"></span>加入购物车</a></div>
								<div class="share well">
									<strong style="margin-right: 13px;">分享 :</strong>
									<a href="#" class="share-btn" target="_blank">
										<i class="fa fa-twitter"></i>
									</a>
									<a href="#" class="share-btn" target="_blank">
										<i class="fa fa-facebook"></i>
									</a>
									<a href="#" class="share-btn" target="_blank">
										<i class="fa fa-linkedin"></i>
									</a>
								</div>
							</div>
						</div>
						<div class="clear"></div>
					</div>	
					<div class="product-desc">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#description">描述</a></li>
							<li><a href="#review">评论</a></li>
						</ul>
						<div class="tab-content">
							<div id="description" class="tab-pane fade in active">
								<h4>商品简介</h4>
								<p><%= product.getProduct_introdution() %></p>
								<h4>商品详情</h4>
								<p><%= product.getProduct_infomation() %></p>
							</div>
							<div id="review" class="tab-pane fade">
							
							<ul class="list-group">
							
							<%
								if (comments.size() > 0)
								{
								for (int i = 0; i < comments.size(); i++)
								{	
									Comment c = comments.get(i);
									Users u = users.get(i);
							%>
							
    							<li class="list-group-item">
									<div class="row">
										<div style="padding-top: 0px"class="col-md-2 column">
											<br>
											<img alt="140x140" src="<%= u.getUserImage() %>" class="img-rounded img-responsive center-block" />
											<hr>
											<div class="text-center"><span class="glyphicon glyphicon-user"></span>用户：<%= u.getUserName() %></div>
										</div>
										<div class="col-md-10 column">
											<br>
											<h6>评论内容</h6>
											<dl><dd><%= c.getComment_content() %></dd></dl>
											<hr>
											<p>评论星级：
												<%
													int degree = Integer.parseInt(c.getComment_degree());
													for (int j = 0; j < degree; j++)
													{
												 %>
												
													<span class="glyphicon glyphicon-star"></span>
												<%
													}
													for (int j = 0; j < 5-degree; j++)
													{
												 %>
													<span class="glyphicon glyphicon-star-empty"></span>
												<%
													}
												 %>													
											</p>
											<p>评论时间：<%= c.getComment_date().toString() %></p>
										</div>
									</div>
								</li>
							<%
								}
								}
								else
								{
							 %>
							 		<div class="alert alert-info">提示-此商品暂无评论</div>
							 <%
							 	}
							  %>
							</ul>

							  <div class="review-text">
								<p></p>
							  </div>
							  <div class="review-form">
								<h4>售前咨询</h4>
								<form name="form1" id="ff" method="post" action="review.php">
									<label>
									<span>请输入你的姓名</span>
									<input type="text"  name="name" id="name" required>
									</label>
									<label>
									<span>资讯信息</span>
									<textarea name="message" id="message"></textarea>
									</label>
									<div class="text-right">
										<input class="btn btn-default" type="reset" name="chongzhi" value="重置">
										<input class="btn btn-default" type="submit" name="Submit" value="提交">
									</div>
								</form>
							  </div>

							</div>
						</div>
					</div>
					<div class="product-related">
						<div class="heading"><h2>相关产品</h2></div>
						<div class="products">
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="product">
									<div class="image"><a href="product.jsp"><img src="images/iphone.png" /></a></div>
									<div class="buttons">
										<a class="btn cart" href="#"><span class="glyphicon glyphicon-shopping-cart"></span></a>
										<a class="btn wishlist" href="#"><span class="glyphicon glyphicon-heart"></span></a>
										<a class="btn compare" href="#"><span class="glyphicon glyphicon-transfer"></span></a>
									</div>
									<div class="caption">
										<div class="name"><h3><a href="product.jsp">Aliquam erat volutpat</a></h3></div>
										<div class="price">$122<span>$98</span></div>
										<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span></div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="product">
									<div class="image"><a href="product.jsp"><img src="images/galaxy-s4.jpg" /></a></div>
									<div class="buttons">
										<a class="btn cart" href="#"><span class="glyphicon glyphicon-shopping-cart"></span></a>
										<a class="btn wishlist" href="#"><span class="glyphicon glyphicon-heart"></span></a>
										<a class="btn compare" href="#"><span class="glyphicon glyphicon-transfer"></span></a>
									</div>
									<div class="caption">
										<div class="name"><h3><a href="product.jsp">Aliquam erat volutpat</a></h3></div>
										<div class="price">$122<span>$98</span></div>
										<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span><span class="glyphicon glyphicon-star-empty"></span></div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-xs-12">
								<div class="product">
									<div class="image"><a href="product.jsp"><img src="images/galaxy-note.jpg" /></a></div>
									<div class="buttons">
										<a class="btn cart" href="#"><span class="glyphicon glyphicon-shopping-cart"></span></a>
										<a class="btn wishlist" href="#"><span class="glyphicon glyphicon-heart"></span></a>
										<a class="btn compare" href="#"><span class="glyphicon glyphicon-transfer"></span></a>
									</div>
									<div class="caption">
										<div class="name"><h3><a href="product.jsp">Aliquam erat volutpat</a></h3></div>
										<div class="price">$122<span>$98</span></div>
										<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span><span class="glyphicon glyphicon-star-empty"></span><span class="glyphicon glyphicon-star-empty"></span></div>
									</div>
								</div>
							</div>
						</div>
						<div class="clear"></div>
					</div>
				</div>
<!--				
				<div id="sidebar" class="col-md-4">
					<div class="widget wid-categories">
						<div class="heading"><h4>分类</h4></div>
						<div class="content">
							<ul>
								<li><a href="#">PC Computers</a></li>
								<li><a href="#">Laptops & Notebooks</a></li>
								<li><a href="#">Mobiles & Tablet</a></li>
								<li><a href="#">Software</a></li>
							</ul>
						</div>
					</div>
					<div class="widget wid-type">
						<div class="heading"><h4>种类</h4></div>
						<div class="content">
							<select>
								<option value="EL" selected>Electronics</option>
								<option value="MT">Mice and Trackballs</option>
								<option value="WC">Web Cameras</option>
								<option value="TA">Tablates</option>
								<option value="AP">Audio Parts</option>
							</select>
						</div>
					</div>
					<div class="widget wid-discouts">
						<div class="heading"><h4>折扣</h4></div>
						<div class="content">
							<label class="checkbox"><input type="checkbox" name="discount" checked="">Upto - 10% (20)</label>
							<label class="checkbox"><input type="checkbox" name="discount">40% - 50% (5)</label>
							<label class="checkbox"><input type="checkbox" name="discount">30% - 20% (7)</label>
							<label class="checkbox"><input type="checkbox" name="discount">10% - 5% (2)</label>
							<label class="checkbox"><input type="checkbox" name="discount">Other(50)</label>
						</div>
					</div>
					<div class="widget wid-brand">
						<div class="heading"><h4>品牌</h4></div>
						<div class="content">
							<label class="checkbox"><input type="checkbox" name="brand">Nokia</label>
							<label class="checkbox"><input type="checkbox" name="brand">Samsung</label>
							<label class="checkbox"><input type="checkbox" name="brand">Iphone</label>
							<label class="checkbox"><input type="checkbox" name="brand">HTC</label>
							<label class="checkbox"><input type="checkbox" name="brand">Oppo</label>
							<label class="checkbox"><input type="checkbox" name="brand">Kings</label>
							<label class="checkbox"><input type="checkbox" name="brand">Zumba</label>	
						</div>
					</div>
					<div class="widget wid-product">
						<div class="heading"><h4>新品</h4></div>
						<div class="content">
							<div class="product">
								<a href="#"><img src="images/galaxy-note.jpg" /></a>
								<div class="wrapper">
									<h5><a href="#">Samsung Galaxy Tab</a></h5>
									<div class="price">$122</div>
									<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span></div>
								</div>
							</div>
							<div class="product">
								<a href="#"><img src="images/galaxy-s4.jpg" /></a>
								<div class="wrapper">
									<h5><a href="#">Samsung Galaxy Tab</a></h5>
									<div class="price">$122</div>
									<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span></div>
								</div>
							</div>
							<div class="product">
								<a href="#"><img src="images/Z1.png" /></a>
								<div class="wrapper">
									<h5><a href="#">Samsung Galaxy Tab</a></h5>
									<div class="price">$122</div>
									<div class="rating"><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star"></span><span class="glyphicon glyphicon-star-empty"></span></div>
								</div>
							</div>
						</div>
					</div>
				</div>
-->				
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
	
	<!-- IMG-thumb -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">         
          <div class="modal-body">                
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
	
	<script>
	$(document).ready(function(){
		$(".nav-tabs a").click(function(){
			$(this).tab('show');
		});
		$('.nav-tabs a').on('shown.bs.tab', function(event){
			var x = $(event.target).text();         // active tab
			var y = $(event.relatedTarget).text();  // previous tab
			$(".act span").text(x);
			$(".prev span").text(y);
		});
	});
	</script>
</body>
</html>
