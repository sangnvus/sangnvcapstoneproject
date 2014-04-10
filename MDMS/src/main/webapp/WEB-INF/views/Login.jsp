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
				<div id="nav"></div>
				<!-- end nav -->
				<!-- end header -->
				<div style="float: left">
					<td>
						<fieldset style="height: 550px; width: 1070px;">
							<div style="margin-top: 5px"></div>
							<div style="margin-top: 100px"></div>
							<h1 align="center">Đăng Nhập</h1>
							<div style="margin-top: 10px">

								<form action="login" method="post">
									<table align="center" width="300px">

										<tr>
											<td align="left">Tên đăng nhập:</td>
											<td><input type="text" name="userName"></td>
										</tr>
										<tr>
											<td>Mật khẩu:</td>
											<td><input type="text" name="passWord"></td>
										</tr>
										<tr>
											<td colspan="2" align="center"><input type="submit"
												value="Đăng Nhập"><input type="button"
													value="Quên mật khẩu"></input></td>
										</tr>
									</table>
								</form>
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
</body>
</html>
