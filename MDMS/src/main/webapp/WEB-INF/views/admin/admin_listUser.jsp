<%@page import="fu.mdms.model.User"%>
<%@page import="fu.mdms.dao.impl.UserDaoImpl"%>
<%@page import="fu.mdms.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
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
<body background="resources/image/body-bg.gif">
	<div id="wrapper">
		<div id="inner">
			<div id="header">
				<h1>
					<img src="resources/images/logo.gif" width="519" height="63"
						alt="Milk Distributor Management System" />
				</h1>
				<div id="nav" align="right">
					<%@ include file="../header.jsp"%>
				</div>
				<!-- end nav -->
				<!-- end header -->
				<%@ include file="admin_menu.jsp"%>
				<div style="float: left">
					<td>
						<fieldset style="height: 600px; width: 1070px;">
							<div style="margin-top: 5px" id="title">
								<td width="10%">Quản lí người dùng</td>
							</div>
							<form action="admin_searchUser" method="post">
								<div style="margin-top: 20px">
									Chức vụ <select name="roleName">
										<option value="0">Tất Cả</option>
										<c:forEach var="userRole" items="${userRoleList}">
											<option value="${userRole.getRoleID()}">${userRole.getRoleName()}</option>
										</c:forEach>
									</select> Theo Tên <input type="text" name="userName"> </input> Trạng
									thái <select name="status">
										<option value="-1">Tất Cả</option>
										<option value="0">Đang Làm</option>
										<option value="1">Nghỉ Làm</option>
									</select> <input type="submit" value="Tim Kiếm"></input> <input
										type="hidden" name="userID" value="${user.getUserID()}" />
								</div>
							</form>
							<div style="margin-top: 10px">
								<table border="1" width="100%" id="normalTable">

									<tr bgcolor="#DEB887">
										<td width="10%">Tên đăng nhập</td>
										<td width="22%">Tên</td>
										<td width="15%">Chức vụ</td>
										<td width="23%">Địa chỉ</td>
										<td width="10%">Số điện thoại</td>
										<td width="15%">E-mail</td>
										<td width="10%">Trạng thái</td>
										<td width="5%">Sửa</td>
										<td width="5%">Xóa</td>

									</tr>
									<c:forEach var="userList" items="${userList}">
										<tr>
											<td>${userList.getUserName()}</td>
											<td>${userList.getFullName()}</td>
											<td>${userList.getUserRole().getRoleName()}</td>
											<td>${userList.getAddress()}-
												${userList.getDistrict().getDistrictName()} -
												${userList.getDistrict().getProvince().getProvinceName()}</td>

											<td>${userList.getPhone()}</td>
											<td>${userList.getEmail() }</td>
											<c:choose>
												<c:when test="${userList.isDeleted()==true}">
													<td>Nghỉ Làm</td>
													<td></td>
													<td><a
														href='admin_activeUser?userID=${userList.getUserID()}'>Kích
															hoạt</a></td>
												</c:when>
												<c:when test="${userList.isDeleted()==false}">
													<td>Đang Làm</td>
													<td><a
														href='admin_editUser?userID=${userList.getUserID()}'>Sửa</a></td>
													<td><a
														href='admin_deleteUser?userID=${userList.getUserID()}'>Xóa</a></td>
												</c:when>
											</c:choose>
										</tr>

									</c:forEach>

								</table>
							</div>
							<form action="admin_createUser" method="post">
								<div style="margin-top: 10px">
									<input type="submit" value="Thêm Người Dùng" /> <input
										type="hidden" name="userID" value="${user.getUserID()}" />
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
	<div id="footer">© Copyright 2014 Group Milk Distributor
		Management System, All rights reserved.</div>
	<!---end footer -->
</body>
</html>