<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>后台管理</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

<style>
@media screen and (min-width:1200px) {
	* {
		margin: 0;
		padding: 0:
	}
	#manage_index {
		width: 20%;
		float: left;
		height: 90%;
		background-color: #f8f8f8;
	}
	.caidanList {
		border: 1px solid blue;
		text-align: center;
	}
	.xiaList {
		text-align: center;
	}
	.biaoti {
		text-align: center;
	}
	#shuju {
		width: 80%;
		float: left;
		height: 90%;
	}
	#head{
	background-color: #1AB6FF;
	
	}
	#index_css{
	
	}
}
</style>

</head>

<body>
	<div>
		<div id="head" style="width: 100%; height: 10%;">
		
		<div><h1 style="color: #fff">后台管理系统</h1></div>
		
		</div>
		<div id="index_css">
			<div id="manage_index">
				<div class="biaoti">
					<h1>操作菜单</h1>
				</div>
				<div>
					<div class="caidanList">
						<strong>菜单管理</strong>
					</div>
					<div class="xiaList">
						<div>
							<a href="manage/pag" target="main">主页菜单操作</a>
						</div>
						<div>
							<a href="#">管理菜单操作</a>
						</div>

					</div>
				</div>
			</div>
			<div id="shuju">
				<iframe id="main" frameborder="0" src="" name="main" width="100%" height="100%"></iframe>


			</div>
		</div>
	</div>
</body>
</html>
