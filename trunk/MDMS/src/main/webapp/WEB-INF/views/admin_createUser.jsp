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
<script
src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<!-- <script type="text/javascript">
	$(document).ready(function() {
		$('#province').change(function() {
			//ajax
			$.ajax({
		        url: '/controller/changeCity',
		        type: 'GET',
		        data: 'provinceID=' + $('#province').val(),
		        dataType: 'json',
		        success: function (data, textStatus, xhr) {
        		    $('#district option').remove();
		        	for (var key in data){
		        		$('#district').append('<option value="' + key + '">' + data[key] + '</option>');
	        		}
		        },
		        error: function (xhr, textStatus, errorThrown) {
		        	alert(xhr);
	            	alert(textStatus);
	            	alert(errorThrown);
		        }
		    });
		});
	});
</script> -->
</head>
<%
	UserDao userDao = new UserDaoImpl();
	User user = (User) session.getAttribute("user");
%>
<body background="resources/image/body-bg.gif">
	<form action="admin_saveUser" method="post">
		<input type="hidden" name="userID" value="<%=user.getUserID()%>" />
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
					<!-- end header -->
					<table width="600" align="center" cellspacing="0" id="menubar">
						<tr>
							<td><a href="admin_listUser" id="font">Quản lý người dùng</a></td>

							<td><a href="admin_listProduct" id="font">Sản phẩm</a></td>

							<td><a href="#" id="font">&nbsp;</a></td>

							<td><a href="" id="font">&nbsp;</a></td>

							<td><a href="#" id="font">&nbsp;</a></td>

						</tr>

					</table>
					<div style="float: left">
						<td>
							<fieldset style="height: 600px; width: 1070;">

								<div style="margin-top: 5px" id="title">
									<td width="10%">Thêm người dùng</td>
								</div>
								<div style="margin-top: 20px; margin-left: 40px">
									<table border="0" width="60%" align="left">

										<tr>
											<td width="8%">Tên đăng nhập</td>
											<td width="25%"><input type="text" name="userName"></input>(*)</td>
										</tr>

										<tr>
											<td width="5%">Họ và tên</td>
											<td width="25%"><input type="text" name="fullName"></input>(*)</td>

										</tr>
										<tr>
											<td width="5%">Ngày sinh</td>
											<td width="25%"><input type="date" name="dateOfBirth"></input>(*)</td>

										</tr>
										<tr>
											<td width="5%">Giới tính</td>
											<td width="25%"><input type="radio" name="gender">Nam</input><input
												type="radio" name="gender">Nữ</input>(*)</td>

										</tr>
										<tr>
											<td width="5%">Số diện thoại</td>
											<td width="25%"><input type="text" name="phone"></input>(*)</td>
										</tr>

										<tr>
											<td width="5%">E-mail</td>
											<td width="25%"><input type="email" name="email"></input></td>
										</tr>

										<tr>
											<td width="5%">Tỉnh-Thành phố</td>
											<td width="25%"><select id="province" name="province">
													<option value="-1">Tỉnh-Thành phố</option>
													<c:forEach var="province" items="${provinceList}">
														<option value="${province.getProvinceId()}"><c:out
																value="${province.getProvinceName()}"></c:out></option>
													</c:forEach>
											</select> (*)</td>

										</tr>

										<tr>
											<td width="5%">Quận- Huyện</td>
											<td width="25%"><select id="district" name="district">
													<option value="-1">Quận-Huyện</option>
													<option value="1">Ba Đình</option>
													<option value="2">Bắc Từ Liêm</option>
													<option value="3">Cầu Giấy</option>
													<option value="4">Đống Đa</option>
													<option value="5">Hà Đông</option>
													<option value="6">Hai Bà Trưng</option>
													<option value="7">Hoàn Kiếm</option>
													<option value="8">Hoàn Kiếm</option>
													<option value="9">Long Biên</option>
													<option value="10">Hoàng Mai</option>
													<option value="2">Thanh Xuân</option>
													<option value="2">Tây Hồ</option>
											</select> (*)</td>
										</tr>

										<tr>
											<td width="5%">Địa chỉ</td>
											<td width="25%"><input type="text" name="address"
												value=" "></input>(*)</td>
											</td>
										</tr>

										<tr>
											<td width="5%">Chức vụ</td>
											<td width="25%"><select name="roleID">
													<option value="2">Nhân viên Kinh Doanh</option>
													<option value="3">Quản Lý Kho Hàng</option>
											</select></td>
										</tr>

										<tr>
											<td width="5%"&nbsp;></td>
											<td width="25%"><input type="submit" value="Lưu"></input>
												<button type="button" onclick="history.go(-1);">Hủy
													bỏ</button></td>
										</tr>
									</table>
								</div>

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
	</form>
</body>
</html>
