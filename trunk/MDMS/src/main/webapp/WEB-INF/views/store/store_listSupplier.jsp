<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
			</div>
			<!-- end header -->
			<div>
				<%@ include file="store_menu.jsp"%>
			</div>
			<div style="float: left">
				<td>
					<fieldset style="height: 600px; width: 1070px;">
						<div style="margin-top: 15px" id="title">
							<td width="10%">Danh sách nhà cung cấp</td>
						</div>
						<form action="store_searchSupplier" method="post">
							<div style="margin-top: 15px">
								Tên nhà cung cấp: <input type="text" name="supplierName"
									value="Tên nhà cung cấp"> <input type="submit"
									value="Tìm Kiếm">

							</div>
						</form>
						<div style="margin-top: 10px">
							<table border="1" width="100%" id="normalTable">

								<tr bgcolor="#DEB887">
									<td width="5%">Mã</td>
									<td width="15%">Nhà cung cấp</td>
									<td width="20%">Địa chỉ</td>
									<td width="15%">Điện thoại</td>
									<td width="4%">Chi tiết</td>
									<td width="4%">Sửa</td>
									<td width="4%">Xóa</td>

								</tr>
								<c:forEach var="supplierList" items="${supplierList}">
									<tr>

										<td>${supplierList.getSupplierID()}</td>
										<td>${supplierList.getSupplierName()}</td>
										<td>${supplierList.getAddress()}-
											${supplierList.getDistrict().getDistrictName()} -
											${supplierList.getDistrict().getProvince().getProvinceName()}</td>
										<td>${supplierList.getPhone()}</td>
										<td><a
											href="store_viewSupplier?supplierID=${supplierList.getSupplierID()}">Chi
												tiết</a></td>
										<td><a
											href="store_editSupplier?supplierID=${supplierList.getSupplierID()}">Sửa</a></td>
										<td><a
											href="store_deleteSupplier?supplierID=${supplierList.getSupplierID()}">Xóa</a></td>

									</tr>
								</c:forEach>
							</table>
							<form action="store_createSupplier" method="post">
								<input type="submit" value="Thêm nhà cung cấp">
							</form>

						</div>

					</fieldset>
			</div>


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
