<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Milk Distributor Management System</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="resources/css/style.css" rel="stylesheet" type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">
	/* 	$(document).ready(
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
	 }); */
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

	<form action="" method="post">
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
					<%@ include file="store_menu.jsp" %> 
				</div>
				<div style="float: left">
					<td>
						<fieldset style="height: 600px; width: 1070px;">

							<div style="margin-top: 15px" id="title">
								<td width="10%">Thông tin chi tiết nhà cung cấp</td>
							</div>
							<div style="margin-top: 15px; margin-left: 40px">
								<table border="0" width="60%" align="left">
									<tr>
										<td width="5%">Tên công ty</td>
										<td width="25%"><input disabled="disabled" type="text"
											name="supplierName" value="${supplier.getSupplierName() }"></input></td>
									</tr>

									<tr>
										<td width="5%">Mã số thuế</td>
										<td width="25%"><input disabled="disabled" type="text"
											name="taxCode" value="${supplier.getTax() }"></input></td>
									</tr>

									<tr>
										<td width="6%">Giấy phép kinh doanh</td>
										<td width="25%"><input disabled="disabled" type="text"
											name="businessLicence"
											value="${supplier.getBusinessLicenseCode() }"></input></td>
									</tr>
									<tr>
										<td width="5%">Điện thoại</td>
										<td width="25%"><input disabled="disabled" type="text"
											name="homePhone" value="${supplier.getPhone() }"></input></td>
									</tr>
									<tr>
										<td width="5%">Fax</td>
										<td width="25%"><input disabled="disabled" type="text"
											name="fax" value="${supplier.getFax() }"></input></td>
									</tr>
									<tr>
										<td width="5%">E-mail</td>
										<td width="25%"><input disabled="disabled" type="email"
											name="email" value="${supplier.getEmail() }"></input></td>
									</tr>
									<tr>
										<td width="5%">Địa chỉ</td>
										<td width="25%">&nbsp;</td>
									</tr>
									<tr>
										<td width="5%">&nbsp;&nbsp;Tỉnh - Thành Phố</td>

										<td width="25%"><input disabled="disabled" type="text"
											value="${supplier.getDistrict().getProvince().getProvinceName() }">
										</td>
									</tr>

									<tr>
										<td width="5%">&nbsp;&nbsp;Quận- Huyện</td>
										<td><input disabled="disabled" type="text"
											value="${supplier.getDistrict().getDistrictName() }">
										</td>
									</tr>

									<tr>
										<td width="5%">&nbsp;&nbsp;Số nhà</td>
										<td width="25%"><input disabled="disabled" type="text"
											name="address" value="${supplier.getAddress() }"></input></td>
									</tr>
									<tr>
										<td width="5%"&nbsp;></td>
										<td width="25%">
											<button type="button" onclick="history.go(-1);">Quay
												lại</button>
										</td>
									</tr>
								</table>
							</div>

						</fieldset>
					</td>

				</div>
			</div>
		</div>

	</form>
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
