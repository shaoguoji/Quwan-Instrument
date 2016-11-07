<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@page import="entity.Product"%>

<jsp:useBean id="productDao" class="dao.ProductDao" scope="page"/>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

request.setCharacterEncoding("utf-8");
String search = request.getParameter("search");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="">
    <meta name="author" content="">
	 
    <title><%= search %>-商品搜索</title>
	
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
    <style type="text/css">
    	.breadcrumb{
    		margin:0px;
    		background-color: white;
    		padding-left: 0px;
    	}
    	.classify{
    		/*background-color: #C6C7C9;*/
    		margin: 0px;
    		height: 43px;
    		line-height: 43px;
    		border: 1px solid #F7F5F6;
    		background-color: #F7F5F6;
    	}
    	
    	a:hover{
    		color: #2A6496;
    	}
    	.sort{
    		border: 1px solid #F7F5F6;


    	}
    	i{
    		color: #9B9A99;
    	}
    	/*.clear{
    		padding-left: 0px
    	}*/

    </style>
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
						<li><a href="account.jsp"><span class="glyphicon glyphicon-user"></span> 登录</a></li>
						<li><a href="contact.jsp"><span class="glyphicon glyphicon-envelope"></span> 联系我们</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<!--Header-->
	<header class="container"  style="padding-bottom:0px;" >
		<div class="row">
			<div class="col-md-4">
				<a href="index.jsp"><div id="logo"><img src="images/logo.png" /></div></a>
			</div>
			<div class="col-md-4">
				<form action="search.jsp"  class="form-search" method="post">  
					<input name="search" type="text" class="input-medium search-query">  
					<button type="submit" class="btn"><span class="glyphicon glyphicon-search"></span></button>  
				</form>
			</div>
			<div class="col-md-4">
				<div id="cart"><a class="btn btn-1" href="cart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span>购物车</a></div>
			</div>
		</div>
	</header>
	
	<!--//////////////////////////////////////////////////-->
	<!--///////////////////Category Page//////////////////-->
	<!--//////////////////////////////////////////////////-->
	<div id="page-content" class="single-page">



		<div class="container">
			<!-- <div class="classify"></div> -->
			<!-- <table>
				<tr>
					<td class="col-lg-3 col-md-3 ">分类</td>
					<td class="col-lg-9 col-md-9"></td>
				</tr>
			</table> -->
			<div class="row">
				<div class="col-lg-12">

					<div class="col-lg-2 col-md-2 classify ">分类</div>
					<div class="col-lg-10 col-md-10" style="padding-left: 0px">
						<ul class="breadcrumb">
							<li><a href="#">民谣吉他</a></li>
							<li><a href="#">古典吉他</a></li>
							<li><a href="#">电吉他</a></li>
							<li><a href="#">电箱吉他</a></li>
							<li><a href="#">其他吉他</a></li>
						</ul>
					</div>
				</div>
			
				
			
			
				<div class="col-lg-12">

					<div class="col-lg-2 col-md-2 classify">尺寸</div>
					<div class="col-lg-10 col-md-10" style="padding-left: 0px">
					
						<ul class="breadcrumb">
							<li><a href="#">42英寸</a></li>
							<li><a href="#">41英寸</a></li>
							<li><a href="#">40英寸</a></li>
							<li><a href="#">39英寸</a></li>
							<li><a href="#">38英寸</a></li>
							<li><a href="#">36英寸</a></li>
							<li><a href="#">34英寸</a></li>
							<li><a href="#">26英寸</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-12">

					<div class="col-lg-2 col-md-2 classify ">适用对象</div>
						<div class="col-lg-10 col-md-10" style="padding-left: 0px">
							<ul class="breadcrumb">
								<li><a href="#">初学者</li>
								<li><a href="#">熟悉者</a></li>
								<li><a href="#">专业者</a></li>
							</ul>
						</div>
					</div>
				</div>

			</div>	
			
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
		
						<div class="col-lg-1 col-md-1 sort"><a href="itemSearch.html">综合 <i class="glyphicon glyphicon-arrow-down"></i></a></div>
						<div class="col-lg-1 col-md-1 sort"><a href="itemSearch.html">人气<i class="glyphicon glyphicon-arrow-down"></i></a></div>
						<div class="col-lg-1 col-md-1 sort"><a href="itemSearch.html">新品<i class="glyphicon glyphicon-arrow-down"></i></a></div>
						<div class="col-lg-1 col-md-1 sort"><a href="itemSearch.html">销量<i class="glyphicon glyphicon-arrow-down"></i></a></div>
						<div class="col-lg-1 col-md-1 sort"><a href="itemSearch.html">价格<i class="glyphicon glyphicon-arrow-down"></i></a></div>
				
					
						<div class="col-lg-1 col-md-1 sort"><input type="checkbox">包邮</input></div>
											
				</div>	
			</div>
		</div>




			<div class="row">
				<div id="main-content" class="col-md-12">
					<div class="row">
						<div class="col-md-12">
							<div class="products">
  							
							<%
								if (!search.equals(""))
								{
								
									List<Product> products = new ArrayList<Product>();
								
									Properties pro = new Properties();
									pro.setProperty("product_name", search);
									products = productDao.findProduct(pro);
									
									//for (Product obj : products)
									//{
									//	System.out.println(obj);
									//}
									
									//if (products.size() > 0)
									//{
									//	for(Product p : products)
									//	{
							 %>
								
							<%
									//	}
									//}
									//else
									//{
							%>
										<div class="col-lg-12">																													
											<div class="alert alert-info">没有找到相关的商品</div>
										</div>
							<%			
									//}																	
								}
								else
								{																
							%>				
									<div class="col-lg-12">																													
										<div class="alert alert-warning">请输入商品关键字</div>
									</div>									
							<%		
								}
							 %>

							</div>
						</div>
					</div>
					
<!--  					
					<div class="row">
						<div class="col-md-12">
							<div class="products">
							
								<div class="col-lg-3 col-md-3 col-xs-12">
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
								
								<div class="col-lg-3 col-md-3 col-xs-12">
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
								
								<div class="col-lg-3 col-md-3 col-xs-12">
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
								
								<div class="col-lg-3 col-md-3 col-xs-12">
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
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-12">
							<div class="products">
							
								<div class="col-lg-3 col-md-3 col-xs-12">
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
								
								<div class="col-lg-3 col-md-3 col-xs-12">
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
								
								<div class="col-lg-3 col-md-3 col-xs-12">
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
								
								<div class="col-lg-3 col-md-3 col-xs-12">
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
						</div>
					</div>
-->
					<!-- <div class="row text-center">
						<ul class="pagination">
						  <li class="active"><a href="#">1</a></li>
						  <li><a href="#">2</a></li>
						  <li><a href="#">3</a></li>
						  <li><a href="#">4</a></li>
						  <li><a href="#">5</a></li>
						</ul>
					</div> -->
				</div>
				<!-- <div id="sidebar" class="col-md-4">
					<div class="widget wid-categories">
						<div class="heading"><h4>CATEGORIES</h4></div>
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
						<div class="heading"><h4>TYPE</h4></div>
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
						<div class="heading"><h4>DISCOUNTS</h4></div>
						<div class="content">
							<label class="checkbox"><input type="checkbox" name="discount" checked="">Upto - 10% (20)</label>
							<label class="checkbox"><input type="checkbox" name="discount">40% - 50% (5)</label>
							<label class="checkbox"><input type="checkbox" name="discount">30% - 20% (7)</label>
							<label class="checkbox"><input type="checkbox" name="discount">10% - 5% (2)</label>
							<label class="checkbox"><input type="checkbox" name="discount">Other(50)</label>
						</div>
					</div>
					<div class="widget wid-brand">
						<div class="heading"><h4>BRAND</h4></div>
						<div class="content">
							<label class="checkbox"><input type="checkbox" name="brand">Nokia</label>
							<label class="checkbox"><input type="checkbox" name="brand">Samsung</label>
							<label class="checkbox"><input type="checkbox" name="brand">Iphone</label>
							<label class="checkbox"><input type="checkbox" name="brand">HTC</label>
							<label class="checkbox"><input type="checkbox" name="brand">Oppo</label>
							<label class="checkbox"><input type="checkbox" name="brand">Kings</label>
							<label class="checkbox"><input type="checkbox" name="brand">Zumba</label>	
						</div>
					</div> -->
					<!-- <div class="widget wid-product">
						<div class="heading"><h4>LATEST</h4></div>
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
					</div> -->
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

