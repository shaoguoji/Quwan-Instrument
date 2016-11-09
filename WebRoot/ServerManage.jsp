<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="entity.SaleBefore" %>
<%@ page import="entity.SaleLater" %>
<%@ page import="entity.Deal" %>
<%@ page import="entity.DealShopping" %>
<%@ page import="entity.Product" %>
<%@ page import="entity.Users" %>
<%@ page import="dao.SaleBeforeDao" %>
<%@ page import="dao.SaleLaterDao" %>
<%@ page import="dao.DealshoppingDao" %>
<%@ page import="dao.UsersDao" %>
<%@ page import="dao.ProductDao" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>服务管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="">
    <meta name="author" content="">
	
	
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
    <script type="text/javascript">
    	function delNode(node){
    		// alert(node.parentNode.parentNode.parentNode);
    		if (!confirm("你真的要删除所选的商品吗？")){
					return;
				} 
    		node.parentNode.parentNode.parentNode.removeChild(node.parentNode.parentNode);
    	}

    </script>
    <style type="text/css">
    	.tabbable{
    		background-color: white;
    		border:none;
    	}
    	.tab-content{
    		border:none;
    	}
    </style>
    
    
	
</head>
<body>
	<!-- <div class="container">
		  
			<li class="active"><a href="#">服务管理</a></li> 
			<li class="pull-right "><a href="#">注销</a></li>  


			<button id="b" class="btn btn-danger btn-lg"
			data-toggle="popover"
			title="Bootstrap" 
			data-content="Bootstrap是Twitter推出的一个用于前端开发的开源工具包。它由Twitter的设计师Mark Otto和Jacob Thornton合作开发,是一个CSS/HTML框架。目前,Bootstrap最新版本为3.0 。"
			data-placement="right"
	>点击弹出/隐藏弹出框</button>
</div>
		

	</div> -->

	<!-- <nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header" style="margin-top:13px;">
					<span>服务管理</span>
			</div>
			<div class="collapse navbar-collapse" id="navbar-collapse">
				<ul class="nav navbar-nav navbar-right" style="margin-top:0">
					<li class="active"><a href="#"><span class="glyphicon glyphicon-off"></span>注销</a></li>
				</ul>	
			</div>
		</div>
	</nav> -->
	<nav id="top">
		<div class="container">
		<!-- class="container"设置为固定宽度 -->
			<div class="row">
				<div class="col-xs-6">
					<span>服务管理</span>
				</div>
				<div class="col-xs-6">
					<ul class="top-link">
						<li class="active"><a href="#"><span class="glyphicon glyphicon-off"></span>注销</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
	<header class="container">
		<div class="tabbable">  
			<ul class="nav nav-tabs">    
				<li class="active"><a href="#1" data-toggle="tab">售前服务</a></li>    
				<li><a href="#2" data-toggle="tab">售后服务</a></li>  
			</ul> 
			<div class="tab-content">    
				<div class="tab-pane active" id="1">
					<div class="row" style="margin-bottom: 30px;">     
						<form class="pull-right">
							<input class="text"></input>
							<button>查询</button>
						</form> 
					</div>

					<div class="row col-lg-11" >
						<table class="table">
							<tr>
								<th><input type="checkbox" ></th>
								<th>商品ID</th>
								<th>用户ID</th>
								<th>咨询内容</th>
								<th>已解决</th>
					

							</tr>
							
							<!-- 循环的开始 -->
							<%
							SaleBeforeDao salebeforedao =new SaleBeforeDao();
							SaleBefore salebefore =new SaleBefore();	
							salebefore =salebeforedao.getSaleBeforeByProductid(1)	;					
							 %>
							<tr>
								<td><input type="checkbox" name="box"></input></td>
								<td class="user_id"><%=salebefore.getUser_id()  %></td>
								<td class="product_id"><%=salebefore.getProduct_id() %></td>
								<td class="service_before"><%=salebefore.getService_before()%></td>
								<%
									String a ="";
									if(salebefore.isSalebefore_is_handle()){
										
										a ="已解决";
					
									}else
										{a ="未解决";}
								 %>
								<td class="salebefore_is_handle"><%=a%></td>
								<td><button onclick="delNode(this)">删除</button></td>
								
								
							</tr>
							<tr>
								<td><input type="checkbox" name="box"></input></td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td>1</td>
								<td><button onclick="delNode(this)">删除</button></td>
					
				     	<!--循环的结束-->
							</tr>
						</table>
					
					</div>
				</div> 
				<div class="tab-pane" id="2">      
					<header class="container">
						<div class="tabbable">  
							<ul class="nav nav-tabs">    
								<li class="active"><a href="#3" data-toggle="tab">退货服务</a></li>    
								<li><a href="#4" data-toggle="tab">退款服务</a></li>  
								<li><a href="#5" data-toggle="tab">其他服务</a></li>  
							</ul> 
							<div class="tab-content"> 
								<!-- 售后服务里的退货服务 -->   
								<div class="tab-pane active" id="3">
										<div class="row" style="margin-bottom: 30px;">     
											<form class="pull-right">
												<input class="text"></input>
												<button>查询</button>
											</form> 
										</div>


										<div class="row col-lg-11" >
											<table class="table">
												<tr>
													<th><input type="checkbox" ></th>
													<th>订单号</th>
													<th>用户ID</th>
													<th>退货理由</th>
													<th>已解决</th>
													<th>退货时间</th>
													<th>解决时间</th>

												</tr>
												<tr>
													<td><input type="checkbox" name="box"></input></td>
													<td>1</td>
													<td>1</td>
													<td>1</td>
													<td>1</td>
													<td>1</td>
													<td>1</td>
													<td><button onclick="delNode(this)">删除</button></td>
													
													
												</tr>
												<tr>
													<td><input type="checkbox" name="box"></input></td>
													<td>1</td>
													<td>1</td>
													<td>1</td>
													<td>1</td>
													<td>1</td>
													<td>1</td>
													<td><button onclick="delNode(this)">删除</button></td>
													
													
												</tr>
											</table>
										</div>
									</div> 
								
								<!-- 售后服务里的退货服务END -->
								<!-- 售后服务里的退款服务 -->
							     <div class="tab-pane" id="4">
							     	<div class="row" style="margin-bottom: 30px;">     
											<form class="pull-right">
												<input class="text"></input>
												<button>查询</button>
											</form> 
										</div>

										<div class="row col-lg-11" >
											<table class="table">
												<tr>
													<th><input type="checkbox" ></th>
													<th>订单号</th>
													<th>用户ID</th>
													<th>退款理由</th>
													<th>已解决</th>
													<th>退货时间</th>
													<th>解决时间</th>

												</tr>
												<tr>
													<td><input type="checkbox" name="box"></input></td>
													<td>1</td>
													<td>1</td>
													<td>1</td>
													<td>1</td>
													<td>1</td>
													<td>1</td>
													<td><button onclick="delNode(this)">删除</button></td>
													
													
												</tr>
												<tr>
													<td><input type="checkbox" name="box"></input></td>
													<td>1</td>
													<td>1</td>
													<td>1</td>
													<td>1</td>
													<td>1</td>
													<td>1</td>
													<td><button onclick="delNode(this)">删除</button></td>
													
													
												</tr>
											</table>
										</div>
									</div> 
							     
							     <!-- 售后服务里的退款服务END    -->
							     <!-- 售后服务里的其他服务 -->
							     <div class="tab-pane" id="5">
							     	<div class="row" style="margin-bottom: 30px;">     
											<form class="pull-right">
												<input class="text"></input>
												<button>查询</button>
											</form> 
									</div>

										<div class="row col-lg-11" >
											<table class="table">
												<tr>
													<th><input type="checkbox" ></th>
													<th>订单号</th>
													<th>用户名</th>
													<th>申请理由</th>
													<th>已解决</th>
													<th>申请时间</th>
													<th>解决时间</th>

												</tr>
												<tr>
													<td><input type="checkbox" name="box"></input></td>
													<td>1</td>
													<td>1</td>
													<td>1</td>
													<td>1</td>
													<td>1</td>
													<td>1</td>
													<td><button onclick="delNode(this)">删除</button></td>
													
													
												</tr>
												<tr>
													<td><input type="checkbox" name="box"></input></td>
													<td>1</td>
													<td>1</td>
													<td>1</td>
													<td>1</td>
													<td>1</td>
													<td>1</td>
													<td><button onclick="delNode(this)">删除</button></td>
													
													
												</tr>
											</table>
										</div>
									</div> 
								<!-- 售后服务里的其他服务END -->
							     </div>
							 </div> 
						</div>
					</header>
				</div>   
			
		  </div>
			

					
				  
			 
		
	</header>

</body>

</html>
