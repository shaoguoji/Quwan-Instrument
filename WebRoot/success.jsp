<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@page import="entity.Users"%>
<%@page import="entity.Product"%>
<%@page import="entity.Cart"%>

<jsp:useBean id="productDao" class="dao.ProductDao" scope="page"/>
<jsp:useBean id="usersDao" class="dao.UsersDao" scope="page"/>

<%@page import="java.text.DecimalFormat"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

DecimalFormat formater = new DecimalFormat("#0.##");
Users loginUser = null;

if(request.getSession().getAttribute("user") != null)
{
	loginUser = (Users)request.getSession().getAttribute("user");
}
%>
<base href="<%=basePath%>">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'success.jsp' starting page</title>
  	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <center>
      <img src="images/add_cart_success.jpg"/>
      <hr>
      <% 
         String id = request.getParameter("id");
         String num = request.getParameter("num");
         
         Product p = productDao.findProductById(id);
      %>
           <!-- 您成功购买了<%=num%>件商品编号为<%=id%>的商品&nbsp;&nbsp;&nbsp;&nbsp; -->
           
           <div class="row">
				<div class="product well">
					<div class="col-md-3">
					<!-- 
						<div class="image">
							<img src=<%= p.getProduct_image() %> />
						</div>
					 -->
					</div>
					<div class="col-md-9">

						<div class="caption"> 
							<div class="name"><h3><a href="product.jsp"><%= p.getProduct_name() %></a></h3></div> 
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
							

							
							<label>数量: </label> <span class="btn" onclick="sub(<%= p.getProduct_id() %>);">-</span> <input id = "<%= p.getProduct_id() %>" type="text" class="form-inline quantity" value="<%= Float.parseFloat(num) %>"> <span class="btn" onclick="add(<%= p.getProduct_id() %>);">+</span> <a href="javascript:cartUpdate(<%= p.getProduct_id() %>)" class="btn btn-2">确定</a> 
							<hr> 
							<a href="servlet/CartServlet?action=delete&id=<%= p.getProduct_id() %>" class="btn btn-default pull-right">删除</a> 
							
							<%
								if (loginUser != null)
								{
									if (loginUser.isUserVip())
									{
							%>
										<h3>总计： ¥<%= formater.format(Float.parseFloat(formater.format(p.getProduct_price() * 0.95))*Float.parseFloat(num)) %></h3>
							<%
									}
									else
									{
							 %>
										<h3>总计： ¥<%= p.getProduct_price()*Float.parseFloat(num) %></h3>
							<%
									}
								}
								else
								{
							%>
									<h3>总计： ¥<%= p.getProduct_price()*Float.parseFloat(num) %></h3>
							<%
								}
							%>
							
						</div>
					</div>
					<div class="clear"></div>
				</div>	
			</div>
      <br>
      <br>
      <br>
      
    </center>
  </body>
</html>
