<%@page import="javax.management.StringValueExp"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="dao.ProductDao"%>
<%@ page import="entity.Product"%>
<%
	Product product = new Product();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>销售服务管理</title>
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
<!-- <link rel="stylesheet" type="text/css" href="insert.js"> -->


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
				<div class="col-xs-14">
					<ul class="top-link">
						<%
							if (session.getAttribute("admin_username") == null) {
								//response.sendRedirect("admin_account.jsp");
							} else {
						%>
						<li><a href="personal_centre.jsp"><span
								class="glyphicon glyphicon-user"></span> <%=(session.getAttribute("admin_username").toString())%></a>
						</li>
						<li><a href="admin_account.jsp"><span
								class="glyphicon glyphicon-off"></span> 注销</a>
						</li>
						<%
							}
						%>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<div class="container">
		<hr>
		<div class="row">
			<form action="servlet/AdminProductChargeServlet">
				<p class="col-sm-13 text-right">
					<input type="text" name="pro"></input>
					<button class="btn btn-default" type="submit" name="action"
						value="search">&nbsp搜索&nbsp</button>
				</p>
			</form>
		</div>
		<div>
			<form action="servlet/AdminProductChargeServlet">
				<div class="col-md-2">
					<a href="adminproduct.jsp" class="btn btn-2">&nbsp&nbsp添加商品&nbsp&nbsp</a>
				</div>

				<div class="col-md-2">
					<button class="btn btn-2" type="submit" name="action"
						value="update">&nbsp&nbsp编辑商品&nbsp&nbsp</button>
				</div>
				<div class="col-md-2">
					<button class="btn btn-2" type="submit" name="action"
						value="delete"&nbsp>&nbsp删除商品&nbsp&nbsp</button>
				</div>
				<div class="col-md-2">
					<button class="btn btn-2" type="submit" name="action"
						value="upproduct"&nbsp>&nbsp上架商品&nbsp&nbsp</button>
				</div>
				<table class="table">
					<tr style="border-top: 0px solid #000">
						<td><h5></h5></td>
						<td></td>
					</tr>
					<tr>
						<th><input type="checkbox" onclick="checkAll(this)"></input>
						</th>
						<th>商品名称</th>
						<th>商品价格</th>
						<th>商品颜色</th>
						<th>商品尺寸</th>
						<th>商品分类</th>
						<th>商品试用者层次</th>
						<th>商品销量</th>
						<th>商品图片</th>
						<th>商品介绍</th>
						<th>商品信息</th>
						<th>商品是否上架</th>
						<th>上架日期</th>
					</tr>
				</table>
				<table class="table table-bordered">
					<!-- 循环的开始 -->
					<%
						ProductDao pDao = new ProductDao();
						String issale;
						List<Product> list;
						if (session.getAttribute("searchproduct") != null) {
							list = (List<Product>) session.getAttribute("searchproduct");
						} else {
							list = pDao.findAllProduct();
						}
						for (Product p : list) {
							product = p;
							if (p.isProduct_is_sale()) {
								issale = "已上架";
							} else {
								issale = "未上架";
							}
					%>
					<tr>
						<td><input type="checkbox" name="checkbox"
							value=<%=p.getProduct_id()%>>
						</td>
						<td><%=p.getProduct_name()%></td>
						<td><%=p.getProduct_price()%></td>
						<td><%=p.getProduct_color()%></td>
						<td><%=p.getProduct_size()%></td>
						<td><%=p.getProduct_type()%></td>
						<td><%=p.getProduct_level()%></td>
						<td><%=p.getProduct_sale_count()%></td>
						<td><img src="<%=p.getProduct_image()%>" alt="First slide"></td>
						<td><%=p.getProduct_introdution()%></td>
						<td><%=p.getProduct_infomation()%></td>
						<td><%=issale%></td>
						<td><%=p.getProduct_show_date()%></td>
					</tr>
					<%
						}
						session.removeValue("searchproduct");
					%>
				</table>

			</form>
		</div>

	</div>
</body>
</html>
