<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import ="entity.Admin,dao.SuperAdminDao" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>superManager</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="">
    <meta name="author" content="">
	
    <title>Mobile Shop</title>
	
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css"  type="text/css">
	
	<!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css">
	
	
	<!-- Custom Fonts -->
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css"  type="text/css">
    <link rel="stylesheet" href="fonts/font-slider.css" type="text/css">
	
	<!-- jQuery and Modernizr-->
	<script src="js/jquery-2.1.1.js"></script>
	    <script type="text/javascript">
    	function delNode(node){
    		if (!confirm("你真的要删除所选的商品吗？")){
					return;
				} 
    		node.parentNode.parentNode.parentNode.removeChild(node.parentNode.parentNode);
    	}
    </script>
	<!-- Core JavaScript Files -->  	 
    <script src="js/bootstrap.min.js"></script>
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
	<%
			SuperAdminDao superAdminDao= new SuperAdminDao();
			List<Admin> admin = superAdminDao.findAllAdmin();
	 %>
	<nav id="top">
		<div class="container">
		<!-- class="container"设置为固定宽度 -->
			<div class="row">
				<div class="col-xs-6">
					<span>后台管理</span>
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
				<li class="active"><a href="#1" data-toggle="tab">人员信息管理</a></li>    
			<!-- 	<li><a href="#2" data-toggle="tab">权限管理</a></li>   -->
			</ul> 
			<div class="tab-content">    
				<div class="tab-pane active" id="1">
					<div class="row" style="margin-bottom: 30px;">
						<button>编辑</button>     
						<button>修改密码</button>     
						<form class="pull-right">
							<input class="text"></input>
							<button>查询</button>
						</form> 
					</div>

					<div class="row col-lg-12" >
						<div id="tab" >
						<table class="table" id="table">
							<tr>
								<th><input type="checkbox"></th>
								<th>管理员Id</th>
								<th>用户名</th>
								<th>岗位</th>
								<th>等级</th>
							</tr>
							<tr >
								<td></td>
								<td><input type="password" id="adminPassword" placeholder="管理员密码" size="15"></td>
								<td><input type="text" id="adminUsername" size="15"placeholder="用户名" size="15"></td>
								<td><input type="text" id="adminDep" size="15"placeholder="岗位" size="15"></td>
								<td><input type="text" id="adminLevel" size="15"placeholder="等级" size="15"></td>
								<td><button id="addButton">添加</button></td>
							</tr>
							<%
									for(int i=0;i<admin.size();i++){									
							 %>
							<tr >
								<td><input type="checkbox" name="box"></input></td>
								<td><%=admin.get(i).getAdminId() %></td>
								<td><%=admin.get(i).getAdminUsername() %></td>
								<td><%=admin.get(i).getAdminDep() %></td>
								<td><%=admin.get(i).getAdminLevel() %></td>
								<td><button onclick="delNode(this)">删除</button></td>
							</tr>
							<%
									}
							 %>
							 
						</table>
						</div>
					</div>
				</div> 
				<%-- <div class="tab-pane" id="2">
					<div class="row" style="margin-bottom: 30px;">
						<button>添加</button>     
						<button>编辑</button>     
						<form class="pull-right">
							<input class="text"></input>
							<button>查询</button>
						</form> 
					</div>

					<div class="row col-lg-12" >
						<table class="table">
							<tr>
								<th><input type="checkbox" ></th>
								<th>管理员Id</th>
								<th>用户名</th>
								<th>岗位</th>
								<th>等级</th>
							</tr>
							<%
									for(int i=0;i<admin.size();i++){									
							 %>
							<tr>
								<td><input type="checkbox" name="box"></input></td>
								<td><%=admin.get(i).getAdminId() %></td>
								<td><%=admin.get(i).getAdminUsername() %></td>
								<td><%=admin.get(i).getAdminDep() %></td>
								<td><%=admin.get(i).getAdminLevel() %></td>
								<td><button onclick="delNode(this)">删除</button></td>
							</tr>
							<%
									}
							 %>
						</table>
					</div> --%>
				</div> 
			</div> 
		</header>
</body>
<script type="text/javascript">
$(function(){
			$("#addButton").click(function(){
			var adminPassword = $("#adminPassword").val();
			 var adminUsername = $("#adminUsername").val();
			 var adminDep = $("#adminDep").val();
			var adminLevel = $("#adminLevel").val();
			if(adminPassword.length==0||adminUsername.length==0||adminDep.length==0||adminLevel.length==0){
					    alert("不能留空");
			}else{
				$.ajax({
				 data: {method:"doPost", adminPassword:adminPassword,adminUsername:adminUsername,adminDep:adminDep,adminLevel:adminLevel},
	             type: "POST",
	             url: "servlet/SuperAdminServlet",
	             success: function(data){
				    		 		if(data==1){
				    		 			alert("添加成功");
				    		 		}else{
				    		 			alert("添加失败");
				    		 		}
    						 } 
       			  }); 
       		}
			});
		});
</script>
</html>