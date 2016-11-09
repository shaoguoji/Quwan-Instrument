<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>salesReturn</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="">
<meta name="author" content="">

<title>Mobile Shop</title>

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
<script type="text/javascript">
	function addTable() {
		var tabNode = document.getElementById("tab");
		// if (tabNode.className=="close"){
		// 	tabNode.className="open";
		if (tabNode.style.display == "none") {
			tabNode.style.display = "block";
		}

	}
	function checkAll(node) {
		var boxNodes = document.getElementsByName("box");
		for ( var x = 0; x < boxNodes.length; x++) {
			boxNodes[x].checked = node.checked;
		}
	}

	function deleteTable() {

		if (!confirm("你真的要删除所选的商品吗？")) {
			return;
		}

		//获取所有的box节点
		var boxNodes = document.getElementsByName("box");

		for ( var x = 0; x < boxNodes.length; x++) {

			if (boxNodes[x].checked) {

				var oTrNode = boxNodes[x].parentNode.parentNode;
				oTrNode.parentNode.removeChild(oTrNode);
				x--;
			}
		}

	}
	// function editTable(){
	// 	var boxNodes=document.getElementsByName("box");
	// 	for (var x = 0; x < boxNodes.length; x++) {

	// 		if (boxNodes[x].checked) {
	// 			alert(boxNodes[x].nextSibling);
	// 			boxNodes[x].nextSibling.innerHTML="<table><tr><td>222222222222</td></tr></table>";

	// 		}					
	// 	}

	// }
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

.addBorder {
	border: 1px solid #DCD8D8;
}
</style>
</head>

<body>
	<div class="container">
		<div class="top">
			<!-- <p><img src=""></p> -->
			<span class="fr">商品管理</span> <span class="fl"><a href="#">注销</a>
			</span>

		</div>
		<hr>
		<div class="row">
			<div class="col-md-2">
				<a
					href="addcomment.jsp"
					class="btn btn-default">&nbsp&nbsp添加商品&nbsp&nbsp</a>
			</div>
						<div class="col-md-2">
			<button class="btn btn-default" type="submit">&nbsp&nbsp编辑商品&nbsp&nbsp</button>			</div>
						<div class="col-md-2">
			<button class="btn btn-default" type="submit">&nbsp&nbsp删除商品&nbsp&nbsp</button>			</div>
			<p class="col-sm-13 text-right">
				<input type="text"></input>
				<button class="btn btn-default" type="submit">&nbsp搜索&nbsp</button>
			</p>
		</div>
		<div>
			<table class="table">
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

			<div id="tab" style="display: none;">
				<table class="table table-bordered">
					<tr>
						<td><input type="checkbox" name="box"></input>
						</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>

					<tr>
						<td><input type="checkbox" name="box"></input>
						</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
