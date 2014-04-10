<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Milk Distributor Management System</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="resources/css/style.css" rel="stylesheet" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/single.js"></script>
<script type="text/javascript" src="resources/js/validation.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$('#province').change(
						function() {
							//ajax
							$.ajax({
								url : '/controller/changeCity',
								type : 'GET',
								data : 'province=' + $('#province').val(),
								dataType : 'json',
								success : function(data, textStatus, xhr) {
									$('#district option').remove();
									for ( var key in data) {
										$('#district').append(
												'<option value="' + key + '">'
														+ data[key]
														+ '</option>');
									}
								},
								error : function(xhr, textStatus, errorThrown) {
									alert(xhr);
									alert(textStatus);
									alert(errorThrown);
								}
							});
						});
			});
	function ShowSub(subId, flag) {
		var subMenu = document.getElementById(subId);
		if (flag == true) {
			subMenu.style.visibility = "visible";
		} else {
			subMenu.style.visibility = "hidden";
		}
	}
	// JScript source code
</script>
</head>
<body background="resources/image/body-bg.gif"
	onload="document.createUser.userName.focus();">
	<form action="admin_saveCreateUser" method="post" name="createUser"
		id="createUser" onsubmit="return formValidation();">
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
							<fieldset style="height: 600px; width: 1070;">

								<div style="margin-top: 5px" id="title">
									<td width="10%">Thêm người dùng</td>
								</div>
								<div style="margin-top: 20px; margin-left: 40px">
									<table border="0" width="100%" align="left">

										<tr>
											<td width="3%">Tên đăng nhập</td>
											<td width="25%"><input type="text" name="userName"
												id="userName" class="inputBB"></input><span
												style="color: red" id="userNameMessage">(*)</span></td>

										</tr>

										<tr>
											<td width="3%">Họ và tên</td>
											<td width="25%"><input type="text" name="fullName"
												class="inputC"></input><span id="fullNameMessage"
												style="color: red">(*)</span></td>


										</tr>

										<tr>
											<td width="3%">Ngày sinh</td>
											<td width="25%"><input type="date" name="dateOfBirth"
												class="inputB"></input><span id="dateOfBirthMessage"
												style="color: red">(*)</span></td>


										</tr>
										<tr>
											<td width="3%">Giới tính</td>
											<td width="25%"><input type="radio" name="gender" value="Nam" checked="checked">Nam</input><input
												type="radio" name="gender" value="Nu">Nữ</input><span
												id="genderMessage" style="color: red">(*)</span></td>

										</tr>
										<tr>
											<td width="3%">Số diện thoại</td>

											<td width="25%"><input type="text" name="phone"
												class="inputBB"></input><span id="phoneMessage"
												style="color: red">(*)</span></td>

										</tr>

										<tr>
											<td width="3%">E-mail</td>
											<td width="25%"><input type="email" name="email"
												class="inputC"></input><span id="emailMessage"
												style="color: red">(*)</span></td>
										</tr>
										<tr>
											<td width="3%">Địa chỉ</td>
											<td width="25%">&nbsp;</td>
										</tr>

										<tr>
											<td width="3%">&nbsp;&nbsp;Tỉnh-Thành phố</td>
											<td width="25%"><select id="province" name="province"
												class="inputB">
													<option value="0">Tỉnh-Thành phố</option>
													<c:forEach var="province" items="${provinceList}">
														<option value="${province.getProvinceID()}"><c:out
																value="${province.getProvinceName()}"></c:out></option>
													</c:forEach>
											</select><span id="provinceMessage" style="color: red">(*)</span></td>

										</tr>

										<tr>
											<td width="3%">&nbsp;&nbsp;Quận- Huyện</td>
											<td width="25%"><select id="district" name="district"
												class="inputB">
													<option>Quận- Huyện</option>
											</select><span id="districtMessage" style="color: red">(*)</span></td>
										</tr>

										<tr>
											<td width="3%">&nbsp;&nbsp;Số nhà</td>
											<td width="25%"><input type="text" name="address"
												class="inputC" id="address"></input><span
												id="addressMessage" style="color: red">(*)</span></td>
										</tr>

										<tr>
											<td width="3%">Chức vụ</td>
											<td width="25%"><select name="roleID"
												style="width: 155px">
													<option value="0">Chức vụ</option>
													<option value="2">Nhân viên Kinh Doanh</option>
													<option value="3">Quản Lý Kho Hàng</option>
											</select><span id="roleIDMessage" style="color: red">(*)</span></td>
										</tr>

										<tr>
											<td width="3%"></td>
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
