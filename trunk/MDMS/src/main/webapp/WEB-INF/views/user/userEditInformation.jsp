<%@ page language="java" contentType="text/html; charset=utf-8"
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
</script>
</head>

<body background="resources/image/body-bg.gif">
	<form action="saveChangeUserInformation" method="post">
		<input type="hidden" name="userID" value="${user.getUserID()}" />
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
					<div style="float: left">
						<td>
							<fieldset style="height: 600px; width: 1070px;">

								<div style="margin-top: 5px" id="title">
									<td width="10%">Sửa thông tin cá nhân</td>
								</div>
								<div style="margin-top: 20px; margin-left: 40px">
									<table border="0" width="60%" align="left">
										<tr>
											<td width="8%">Tên đăng nhập</td>
											<td width="25%"><input type="text" name="userName"
												value="${user.getUserName()}" disabled="disabled"></input></td>
										</tr>

										<tr>
											<td width="5%">Họ và tên</td>
											<td width="25%"><input type="text" name="fullName"
												value="${user.getFullName()}" disabled="disabled"></input></td>

										</tr>

										<tr>
											<td width="5%">Ngày sinh</td>
											<td width="25%"><input type="date" name="dateOfBirth"
												value="${user.getDisplayDateOfBirth()}" disabled="disabled"></input></td>

										</tr>
										<tr>
											<td width="5%">Giới tính</td>
											<td width="25%"><c:choose>
													<c:when test="${user.isGender()==false }">
														<input type="text" value="Nam" disabled="disabled"></input>
													</c:when>
													<c:when test="${user.isGender()==true }">
														<input type="text" value="Nữ" disabled="disabled"></input>
													</c:when>
												</c:choose></td>

										</tr>
										<tr>
											<td width="5%">Số điện thoại</td>
											<td width="25%"><input type="text" name="phone"
												value="${user.getPhone()}"></input>(*)</td>
										</tr>

										<tr>
											<td width="5%">E-mail</td>
											<td width="25%"><input type="email" name="email"
												value="${user.getEmail()}"></input>(*)</td>
										</tr>
										<tr>
											<td width="5%">Địa chỉ</td>
											<td width="25%">&nbsp;</td>
										</tr>
										<tr>
											<td width="5%">&nbsp;&nbsp;Tỉnh-Thành phố</td>
											<td width="25%"><select id="province" name="province">
													<option value="-1">Tỉnh-Thành phố</option>

													<c:forEach var="province" items="${provinceList}">
														<c:choose>
															<c:when
																test="${province.getProvinceID().equals(user.getDistrict().getProvince().getProvinceID()) }">
																<option value="${province.getProvinceID()}"
																	selected="selected"><c:out
																		value="${province.getProvinceName()}"></c:out></option>
															</c:when>
															<c:otherwise>
																<option value="${province.getProvinceID()}"><c:out
																		value="${province.getProvinceName()}"></c:out></option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
											</select> (*)</td>

										</tr>
										<tr>
											<td width="5%">&nbsp;&nbsp;Quận- Huyện</td>
											<td width="25%"><select id="district" name="district">
													<option>Quận huyện</option>
													<c:forEach var="district" items="${districtList}">
														<c:choose>
															<c:when
																test="${district.getDistrictID().equals(user.getDistrict().getDistrictID()) }">
																<option value="${district.getDistrictID()}"
																	selected="selected"><c:out
																		value="${district.getDistrictName()}"></c:out></option>
															</c:when>
															<c:otherwise>
																<option value="${district.getDistrictID()}"><c:out
																		value="${district.getDistrictName()}"></c:out></option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
											</select>(*)</td>
										</tr>

										<tr>
											<td width="5%">&nbsp;&nbsp;Số nhà</td>
											<td width="25%"><input type="text" name="address"
												value="${user.getAddress() }"></input>(*)</td>
											</td>
										</tr>

										<tr>
											<td width="5%">Chức vụ</td>
											<td width="25%"><c:choose>
													<c:when test="${user.getUserRole().getRoleID()==1}">
														<input type="text"
															value="${user.getUserRole().getRoleName()}"
															disabled="disabled" />
													</c:when>
													<c:when test="${user.getUserRole().getRoleID()==2}">
														<input type="text"
															value="${user.getUserRole().getRoleName()}"
															disabled="disabled" />
													</c:when>
													<c:when test="${user.getUserRole().getRoleID()==3}">
														<input type="text"
															value="${user.getUserRole().getRoleName()}"
															disabled="disabled" />
													</c:when>
												</c:choose></td>
										</tr>

										<tr>
											<td width="5%"&nbsp;></td>
											<td width="25%"><input type="submit" value="Lưu"></input>
												<button type="button" onclick="history.go(-1);">Hủy
													bỏ</button> <input type="button" value="Đổi mật khẩu"
												onClick="window.location.href='userChangePassword?userID=${user.getUserID()}'"></input></td>
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
