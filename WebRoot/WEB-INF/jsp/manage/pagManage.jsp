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

<title>主页菜单</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		searchByUser();
	});

	function searchByUser() {
		var op = "<option value='0'>请选择授权用户</option>";
		$.post("manage/searchByUser", function(data) {
			var date = data.res;
			for (var i = 0; i < date.length; i++) {
				if (date[i].flag == 0) {
					break;
				}
				op += "<option value='"+date[i].id+"'>" + date[i].username
						+ "</option>";
			}
			document.getElementById("select").innerHTML = op;
		});

	}
	function sumbitByButt() {
		var name = document.getElementById("name").value;
		if (name == "") {
			alert("名称不能为空");
			return;
		}
		var url = document.getElementById("url").value;
		if (url == "") {
			alert("url不能为空");
			return;
		}
		var select = document.getElementById("select").value;
		if (select == "0") {
			alert("请选择用户");
			return;
		}
		var radio = document.getElementsByName("radio");
		var rad = "";
		if (radio[0].checked) {
			rad = radio[0].value;
		} else if (radio[1].checked) {
			rad = radio[1].value;
		}
		var menu = document.getElementById("menu").value;
		if (menu == "") {
			alert("请选择菜单！");
			return;
		}

		$.post("manage/addByInser", {
			name : name,
			url : url,
			userid : select,
			mark : rad,
			menu : menu
		}, function(data) {
			var sturt = data.res;
			if (sturt > 0) {
				alert("提交成功！");
			} else {
				alert("提交失败！");
			}

		});

	}

	function erji() {
		var radio = document.getElementsByName("radio");
		if (radio[1].checked) {
			$("#menu_css").show();
			$.post("menu/erMenu", function(data) {
				var op = "<option value='0'>请选择一级菜单</option>";
				for (var i = 0; i < data.length; i++) {
					op += "<option value='"+data[i].id+"'>" + data[i].name
							+ "</option>";
				}
				document.getElementById("menu").innerHTML = op;
			});
		} else {
			$("#menu_css").hide();
		}
	}

	function yiji() {
		$("#menu_css").hide();
	}
</script>
<style type="text/css">
* {
	margin: 0;
	position: 0;
}

.addCaidan {
	border: 1px solid #999999;
}

.addCaidan tr {
	margin-left: 1px
}
</style>
</head>

<body>
	<div>
		<div class="addCaidan">
			<table>
				<tbody>
					<tr>
						<h1>添加操作</h1>
					</tr>
					<tr>
						<td><span>菜单名称：</span></td>
						<td><input type="text" id="name" placeholder="菜单名称"></td>
					</tr>
					<tr>
						<td><span>菜单url：</span></td>
						<td><input type="text" id="url" placeholder="菜单地址"></td>
					</tr>
					<tr>
						<td><span>授权用户：</span></td>
						<td><select id="select">
								<option value="0">请选择授权用户</option>
						</select></td>
					</tr>
					<tr>
						<td><span>菜单层级：</span></td>
						<td><input type="radio" name="radio" checked="checked"
							value="1" onclick="yiji()"><span>一级菜单</span><input
							type="radio" name="radio" onclick="erji()" value="0"><span>二级菜单</span></td>
					</tr>
					<tr id="menu_css" style="display: none">
						<td><span>选择菜单：</span></td>
						<td><select id="menu">
								<option value="0">请选择一级菜单</option>
						</select></td>
					</tr>
					<tr>

						<td><button onclick="sumbitByButt()">提交</button></td>
					</tr>

				</tbody>


			</table>
		</div>

	</div>
</body>
</html>
