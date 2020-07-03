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

<title>注册</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	function CheckForm() {
		username();
		password();
		age();
		phone();

		return username() && password() && age() && phone();

	}

	function username() {
		var p = /^[a-zA-Z0-9_-]{4,16}$/;
		var username = document.getElementById("username").value;
		if (!p.test(username)) {
			$("#username").css("border", "1px solid red");
			return false;
		}

		$("#username").css("border", "");
		return true;
	}

	function password() {
		var p = /^[a-zA-Z0-9_-]{4,16}$/;
		var password = document.getElementById("password").value;
		if (!p.test(password)) {
			$("#password").css("border", "1px solid red");
			return false;
		}
		$("#password").css("border", "");
		return true;
	}
	function age() {
		var p = /^(?:[1-9][0-9]?|1[01][0-9]|120)$/;
		var age = document.getElementById("age").value;
		if (!p.test(age)) {
			$("#age").css("border", "1px solid red");
			return false;
		}
		$("#age").css("border", "");
		return true;
	}
	function phone() {
		var p = /^1[3-9]\d{9}$/;
		var phone = document.getElementById("phone").value;
		if (!p.test(phone)) {
			$("#phone").css("border", "1px solid red");
			return false;
		}
		$("#phone").css("border", "");
		return true;
	}
</script>
</head>

<body>
	<div>
		<form action="admin/setRegister" method="post"
			onsubmit="return CheckForm()">
			<table>
				<tbody>
					<tr>
						<td><span>用户&nbsp;&nbsp;&nbsp;&nbsp;名：</span></td>
						<td><input id="username" type="text" name="username"
							placeholder="请输入用户名"></td>
					</tr>
					<tr>
						<td><span>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</span></td>
						<td><input id="password" type="password" name="password"
							placeholder="请输入密码"></td>
					</tr>
					<tr>
						<td><span>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</span></td>
						<td><select name="sex">
								<option value="1">男</option>
								<option value="2">女</option>
						</select></td>
					</tr>
					<tr>
						<td><span>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：</span></td>
						<td><input id="age" type="text" name="age" placeholder="年龄"></td>
					</tr>
					<tr>
						<td><span>联系方式：</span></td>
						<td><input id="phone" type="text" name="phone"
							placeholder="联系方式"></td>
					</tr>
				</tbody>
				<tr>
					<td><button type="submit">提交</button></td>

				</tr>

			</table>
		</form>
	</div>
</body>
</html>
