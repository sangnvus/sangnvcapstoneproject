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
<body>
	<%
		UserDao userDao = new UserDaoImpl();
		User user = (User) session.getAttribute("user");
	%>
	<div id="wrapper">
		<div id="inner">
			<div id="header">
				<h1>
					<img src="resources/images/logo.gif" width="519" height="63"
						alt="Milk Distributor Management System" />
				</h1>
				<div id="nav">
					Xin chào <a href=""> <font color="Blue"><%=user.getUserName()%></font></a>
					| <a href=""><font color="Blue">Đăng xuất</font></a>
				</div>
				<!-- end nav -->
			</div>
			<!-- end header -->
			<table width="600" align="center" cellspacing="0" id="menubar">
				<tr>
					<td><a href="listProduct" id="font">Sản phẩm</a></td>

					<td onmouseover="ShowSub('subKhachhang', true);"
						onmouseout="ShowSub('subKhachhang' ,false);"><a href="#"
						id="font">Đại lý</a></td>

					<td onmouseover="ShowSub('subDonhang', true);"
						onmouseout="ShowSub('subDonhang' ,false);"><a href="#"
						id="font">Đơn hàng</a></td>

					<td><a href="#" id="font">&nbsp;</a></td>

					<td><a href="#" id="font">&nbsp;</a></td>

				</tr>
				<tr>
					<td></td>
					<td onmouseover="ShowSub('subKhachhang', true);"
						onmouseout="ShowSub('subKhachhang' ,false);">
						<table id="subKhachhang" class="menu" cellpadding="0">
							<tr>
								<td><a href="listDealer" id="font"> Danh sách đại lý </a></td>
							</tr>
							<tr>
								<td><a href="createDealer" id="font"> Thêm đại lý </a></td>
							</tr>
						</table>
					</td>
					<td onmouseover="ShowSub('subDonhang', true);"
						onmouseout="ShowSub('subDonhang' ,false);">
						<table id="subDonhang" class="menu" cellpadding="0">
							<tr>
								<td><a href="" id="font"> Danh sách đơn hàng </a></td>
							</tr>
							<tr>
								<td><a href="createOrder" id="font"> Thêm đơn hàng </a></td>
							</tr>
						</table>
					</td>

				</tr>
			</table>
			<form method="get" action="searchDealer">
				<div>
					<tr>
						<td>Theo Tên: <input type="text" name="tenDaiLy"></input></td>
						<td><select name="trangThai">
								<option value="1">Đang hoạt động</option>
								<option value="0">Ngừng hoạt động</option>
						</select></td>
						<td><input type="submit" value="Tìm Kiếm"></input></td>
					</tr>
				</div>
			</form>
			<div style="margin-top: 20px">
				<table id="myTable" border="1">
					<tr>
						<th>STT</th>
						<th>Tên đại lý</th>
						<th>Người đại diện</th>
						<th>Địa chỉ</th>
						<th>điện thoại</th>
						<th>Hoạt động</th>
						<th>Chi tiết</th>
						<th>Sửa</th>
					</tr>
					<c:forEach var="dealer" items="${dealerList}">
						<tr>
							<td><c:out value="${dealer.getDealerID()}"></c:out></td>
							<td><c:out value="${dealer.getDealerName()}"></c:out></td>
							<td><c:out value="${dealer.getViceGerent()}"></c:out></td>
							<td><c:out value="${dealer.getAddress()}"></c:out></td>
							<td><c:out value="${dealer.getPhone()}"></c:out></td>
							<c:set var="status" value="${dealer.isStatus()}"></c:set>
							<c:if test="${ status== true}">
								<td>Đang hoạt động</td>
							</c:if>
							<c:if test="${ status== false}">
								<td>Ngừng hoạt động</td>
							</c:if>
							<td><input type="button" value="Chi tiết"></input></td>
							<td><input type="button" value="Sửa"></input></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<form action="createDealer" method="post">
				<div style="margin-top: 10px">
					<input type="submit" value="Thêm Đại Lý" /> <input type="hidden"
						name="userID" value="<%=user.getUserID()%>" />
				</div>
			</form>
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
</body>
</html>
