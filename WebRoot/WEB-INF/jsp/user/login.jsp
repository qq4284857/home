<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>登录页面</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript">
	$(document).ready(function() {
		$("#chongzhi").click(function() {
			document.getElementById("username").value = "";
			document.getElementById("password").value = "";
		});

	});

	function checkByUsername() {
		var p = /^[a-zA-Z0-9_-]{4,16}$/;
		var username = document.getElementById("username").value;
		if (!p.test(username)) {
		$("#username").css("border","1px solid red");
			return false;
		}
		$("#username").css("border","");
		return true;
	}
		function checkByPassword() {
		var p = /^[a-zA-Z0-9_-]{4,16}$/;
		var username = document.getElementById("password").value;
		if (!p.test(username)) {
		$("#password").css("border","1px solid red");
			return false;
		}
		$("#password").css("border","");
		return true;
	}

	function CheckForm() {
		checkByUsername();
		checkByPassword();
		return checkByUsername()&&checkByPassword();

	}
</script>
<style type="text/css">
@media screen and (max-width:1100px) {
	table {
		width: 95%;
	}
}

@media screen and (min-width:1200px) {
	* {
		margin: 0;
		padding: 0;
	}
	table {
		width: 35%;
		height: 40%;
		border: 1px solid transparent;
		position: absolute;
		left: 35%;
		top: 35%;
		background-color: transparent;
	}
	form {
		height: 20rem !important;
	}
	input {
		width: 93% !important;
	}
	#butt button {
		margin-left: 30%;
	}
	#butt {
		margin-left: -40px;
	}
}
</style>
</head>

<body>
	<div style="width: 100%; height: 100%">
		<div id="zhong">
			<form action="admin/login" method="post"
				onsubmit="return CheckForm()">
				<table>
					<tbody id="tbody">
						<tr>
							<td align="center"><span>用户名：</span></td>
							<td align="center"><input id="username" class="form-control"
								type="text" name="username" placeholder="请输入用户名"></td>
						</tr>

						<tr>
							<td align="center"><span>密&nbsp;&nbsp;&nbsp;码：</span></td>
							<td align="center"><input id="password" class="form-control"
								type="password" name="password" placeholder="请输入密码"></td>
						</tr>

						<tr>
							<td colspan="2"><div id="butt">
									<button class="btn btn-primary" type="submit">登录</button>
									<button id="chongzhi" type="button" class="btn btn-default">重置</button>
								</div></td>

						</tr>
						<tr>
							<td align="center" colspan="2"><span><a
									href="admin/register">没有账号？去注册</a></span></td>
						</tr>
						<tr>
							<td align="center" colspan="2"><span style="color: red">${mes}</span></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>
</body>
</html>
