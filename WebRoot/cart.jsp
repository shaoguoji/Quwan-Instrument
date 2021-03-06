<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@page import="entity.Users"%>
<%@page import="entity.Product"%>
<%@page import="entity.Cart"%>

<%@page import="java.text.DecimalFormat"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

DecimalFormat formater = new DecimalFormat("#0.##");
Cart cart = null;
HashMap<Product,Integer> products;
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
	
    <title>购物车</title>

	
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
    
      <script type="text/javascript">
      function cartUpdate(id)
      {   	

         var num =  document.getElementById(id).value;
         window.location.href="servlet/CartServlet?id="+id+"&num="+num+"&action=update";
         //window.navigate("index.jsp");
         //window.location.href="servlet/CartServlet?id="+id+"&num="+num+"&action=update";  
         //J.dialog.get({id: 'haoyue_creat',title: '购物成功',width: 600,height:400, link: '<%=path%>/servlet/CartServlet?id='+id+'&num='+num+'&action=update', cover:true});
      }
      function add(id)
      {
         var num = parseInt(document.getElementById(id).value);
         if(num<100)
         {
            document.getElementById(id).value = ++num;
         }
      }
      function sub(id)
      {
         var num = parseInt(document.getElementById(id).value);
         if(num>1)
         {
            document.getElementById(id).value = --num;
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
	<!--///////////////////Cart Page//////////////////////-->
	<!--//////////////////////////////////////////////////-->
	<div id="page-content" class="single-page">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<ul class="breadcrumb">

						<li><a href="index.jsp">首页</a></li>
						<li><a href="cart.jsp">购物车</a></li>
						
					</ul>
				</div>
			</div>
			
			<% 
			    //首先判断session中是否有购物车对象
				if(request.getSession().getAttribute("cart")!=null)
				{
			%>
							<!-- 循环的开始 -->
			<% 
			    cart = (Cart)request.getSession().getAttribute("cart");
				products = cart.getProducts();
				Set<Product> ps = products.keySet();
				Iterator<Product> it = ps.iterator();
				 
				if (products.size() == 0)
				{
			%>		<div class="alert alert-info">提示 - 购物车空空的，先去挑选商品吧</div>
			<%	}
				 
				while(it.hasNext())
				{
					Product p = it.next();
					
			 %>
			<div class="row">
				<div class="product well">
					<div class="col-md-3">
						<div class="image">
							<img src=<%= p.getProduct_image() %> />
						</div>
					</div>
					<div class="col-md-9">

						<div class="caption"> 
							<div class="name"><h3><a href="product.jsp?id=<%= p.getProduct_id() %>"><%= p.getProduct_name() %></a></h3></div> 
							<div class="info">	 
								<ul> 
									<li>									
								<%
									if (loginUser != null)
									{
										if (loginUser.isUserVip())
										{
											
								 %>
											<div>会员价： <h6>¥<%= formater.format(p.getProduct_price() * 0.95) %></h6>&nbsp;&nbsp;<s>¥<%= p.getProduct_price() %></s></div>
								<%
										}
										else
										{
								%>		
											<div>单价： ¥<%= p.getProduct_price()%></div>
								<%
										}
									}
									else
									{
								 %>
								 		<div>单价： ¥<%= p.getProduct_price()%></div>
								 <%
								 	}
								  %> 									
									</li> 
 
								</ul> 
							</div> 
							

							
							<label>数量: </label> <span class="btn" onclick="sub(<%= p.getProduct_id() %>);">-</span> <input id = "<%= p.getProduct_id() %>" type="text" class="form-inline quantity" value="<%= products.get(p) %>"> <span class="btn" onclick="add(<%= p.getProduct_id() %>);">+</span> <a href="javascript:cartUpdate(<%= p.getProduct_id() %>)" class="btn btn-2">确定</a> 
							<hr> 
							<a href="servlet/CartServlet?action=delete&id=<%= p.getProduct_id() %>" class="btn btn-default pull-right">删除</a> 
							
							<%
								if (loginUser != null)
								{
									if (loginUser.isUserVip())
									{
							%>
										<h3>总计： ¥<%= formater.format(Float.parseFloat(formater.format(p.getProduct_price() * 0.95))*products.get(p)) %></h3>
							<%
									}
									else
									{
							 %>
										<h3>总计： ¥<%= formater.format(Float.parseFloat(formater.format(p.getProduct_price()))*products.get(p)) %></h3>
							<%
									}
								}
								else
								{
							%>
									<h3>总计： ¥<%= formater.format(Float.parseFloat(formater.format(p.getProduct_price()))*products.get(p)) %></h3>
							<%
								}
							%>
							
						</div>
					</div>
					<div class="clear"></div>
				</div>	
			</div>

			<%
				}
 			%>
				<!--循环的结束-->

			<div class="row">
				<div class="col-md-4 col-md-offset-8 ">
					<a href="servlet/CartServlet?action=clear" class="btn btn-1">清空购物车</a>
					<a href="category.jsp" class="btn btn-1">继续购物</a>
				</div>
			</div>
			<div class="row">
				<div class="pricedetails">
					<div class="col-md-4 col-md-offset-8">
						<table>
							<h6>价格详情</h6>
							<tr>
								<td>商品总价</td>
								<td><%= formater.format(cart.getTotalPrice()) %></td>
							</tr>
							<tr>
								<td>折扣</td>
								<%
									if (loginUser != null)
									{
										if (loginUser.isUserVip())
										{
								 %>
											<td>0.95</td>
								<%
										}
										else
										{
								%>
											<td>---------</td>
								<%
										}
									}
									else
									{		
								%>
										<td>---------</td>
								<%
									}
								 %>
							</tr>
							<tr>
								<td>派送费</td>
							<%
								if (products.size() > 0)
								{
							 %>		<td>40.00</td>
							</tr>
							<tr style="border-top: 1px solid #333">
								<td><h5>总价格</h5></td>
								<td><h5><%= formater.format(cart.getTotalPrice()+40) %></h5></td>
							</tr>
							 <%	}
							 	else
							 	{
							  %>	<td>00.00</td>
							</tr>
							<tr style="border-top: 1px solid #333">
								<td><h5>总价格</h5></td>
								<td><h5><%= formater.format(cart.getTotalPrice()) %></h5></td>
							</tr>
							  <%} %>

						</table>
				<%
					}
					else
					{
				 %>		
				<div class="alert alert-info">提示 - 购物车空空的，先去挑选商品吧</div>
				<div class="row">
				<div class="col-md-4 col-md-offset-8 ">
					<a href="servlet/CartServlet?action=clear" class="btn btn-1">清空购物车</a>
					<a href="category.jsp" class="btn btn-1">继续购物</a>
				</div>
				</div>
				
				<div class="row">
				<div class="pricedetails">
					<div class="col-md-4 col-md-offset-8">
						<table>
							<h6>价格详情</h6>
							<tr>
								<td>商品总价</td>
								<td>0.00</td>
							</tr>
							<tr>
								<td>折扣</td>
				 				<td>---------</td>
				 			</tr>
							<tr>
								<td>派送费</td>
								<td>00.00</td>
							</tr>
							<tr style="border-top: 1px solid #333">
								<td><h5>总价格</h5></td>
								<td><h5>0.00</h5></td>
							</tr>
						</table>
				 <%
				 	}
				  %>
				

						<center><a href="servlet/DealShoppingServlet?action=add" class="btn btn-1">去下单</a></center>

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
						<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
					</div>
					<div class="col-md-3 col-footer footer-2">
						<div class="heading"><h4>用户服务</h4></div>
						<ul>
							<li><a href="#">关于我们</a></li>
							<li><a href="#">物理信息</a></li>
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
							<li><span class="glyphicon glyphicon-earphone"></span>+91 8866888111</li>
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

