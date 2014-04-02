<%@page import="fu.mdms.model.User"%>
<%@page import="fu.mdms.dao.impl.UserDaoImpl"%>
<%@page import="fu.mdms.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Milk Distributor Management System</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="resources/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function ShowSub(subId, flag) {
		var subMenu = document.getElementById(subId);
		if (flag == true) {
			subMenu.style.visibility = "visible";
		} else {
			subMenu.style.visibility = "hidden";
		}
	}
</script>
</head>
<%
	UserDao userDao = new UserDaoImpl();
	User user = (User) session.getAttribute("user");
%>
<body background="image/body-bg.gif">
	<div id="wrapper">
		<div id="inner">
			<div id="header">
				<h1>
					<img src="resources/images/logo.gif" width="519" height="63"
						alt="Milk Distributor Management System" />
				</h1>
				<div id="nav">
					Xin chào <a href=""> <font color="Blue"><%=user.getUserName() %></font></a>
					| <a href=""><font color="Blue">Đăng xuất</font></a>
				</div>
				<!-- end nav -->
				<!-- end header -->
				<table width="600" align="center" cellspacing="0" id="menubar">
					<tr>
						<td><a href="listUser" id="font">Quản
								lí người dùng</a></td>

						<td><a href="Products.html" id="font">Sản phẩm</a></td>

						<td><a href="#" id="font">&nbsp;</a></td>

						<td><a href="" id="font">&nbsp;</a></td>

						<td><a href="#" id="font">&nbsp;</a></td>

					</tr>

				</table>
				<div style="float: left">
					<td>
						<fieldset style="height: 600px; width: 1070px;">

							<div style="margin-top: -15px"></div>
						</fieldset>
					</td>

				</div>
			</div>


			<div id="body">
				<div class="inner"></div>
				<!-- end .inner -->
			</div>
			<!-- end body -->

			<div class="clear"></div>

		</div>
		<!-- end inner -->
	</div>
	<!-- end wrapper -->
	<div id="footer">© Copyright 2014 Group Milk Distributor
		Management System, All rights reserved.</div>
	<!---end footer -->
</body>
</html>
