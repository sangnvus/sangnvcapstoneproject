<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Milk Distributor Management System</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="resources/css/style.css" rel="stylesheet" type="text/css" />

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
							<fieldset style="height: 600px; width: 1070;">

								<div style="margin-top: 5px" id="title">
									<td width="10%">Đổi mật khẩu</td>
								</div>
								<div style="margin-top: 20px; width: 50%" align="left" >
									<table width="100" align="right">
										<h2>Hướng dẫn sử dụng</h2>
										<p>1. Nhập mật khẩu hiện tại</p>
										<p>2. Nhập mật khẩu mới</p>
										<p>3. Nhấn vào "Cập nhật" để hoàn tất quá trình thay đổi
											mật khẩu</p>
										<p>Chú ý: Mật khẩu mới không được trùng với mật khẩu cũ và
											tên đăng nhập, độ dài từ 8 đến 20 ký tự bao gồm chữ và số</p>
									</table>
								</div>
								<div style="margin-top: 20px; margin-left: 40px; width:50%" align="left">

									<table border="0" width="100%" align="left">
										<tr>
											<td width="8%">Mật khẩu hiện tại</td>
											<td width="25%"><input type="text"
												name="currentPassword"></input></td>
										</tr>
										<tr>
											<td width="8%">Mật khẩu mới</td>
											<td width="25%"><input type="text" name="newPassword"></input></td>
										</tr>
										<tr>
											<td width="8%">Xác nhận mật khẩu mới</td>
											<td width="25%"><input type="text"
												name="confirmNewPassword"></input></td>
										</tr>
										<tr>
											<td width="5%"&nbsp;></td>
											<td width="25%"><input type="submit" value="Cập nhật"></input>
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
