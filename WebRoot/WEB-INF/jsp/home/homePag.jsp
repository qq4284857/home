<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
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

<title>主页</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

<style>
* {
	margin: 0;
	padding: 0:
}

#menu_css {
	width: 20%;
	float: left;
	height: 90%;
}

#head {
	width: 100%;
	height: 10%;
	background-color: #1AB6FF;
}

#menu_cs {
	width: 80%;
	float: left;
	height: 90%;
}

.menu {
	text-align: center;
	border: 1px solid #999;
}
</style>
<%
	HttpSession session1 = request.getSession();
	String username = (String) session1.getAttribute("username");
%>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
var name="<%=username%>";
	$(document).ready(function() {
		searchByMenu();
	
	})

	function searchByMenu() {
		var div = "";
		var di="<div style='display:none' class='erMenu'>";
		$.post("menu/menu", function(data) {
			for (var j = 0; j < data.length; j++) {
				if (data[j].er_menu == "1") {
				div+="<div class='yiMenu'><a>"+data[j].name+"</a></div>"+di;
				
				for (var i = 0; i < data.length; i++) {
				if (data[i].username == name&&data[j].mid==data[i].er_menu) {
					div += "<div><a target='daohang' href='"+data[i].url+"'>"
							+ data[i].name + "</a></div>";
				}
			}
			div+="</div>";
				}
			}
			
			
			$(".menuList").html(div);
		});

	}
</script>
</head>

<body>
	<div>
		<div id="head"></div>
		<div id="index_css">
			<div id="menu_css">
				<div>
					<div class="menu">
						<h1>导航栏</h1>
					</div>
					<div class="menu menuList"></div>
				</div>
			</div>
			<div id="menu_cs">
				<iframe name="daohang" id="daohang" src="" frameborder="0"
					width="100%" height="100%" align="top"></iframe>

			</div>
		</div>
	</div>
	<div style="display: "></div>
</body>
</html>
