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
			<!-- end nav -->
		</div>
		<!-- end header -->
		<%@ include file="sale_menu.jsp"%>
		<div style="float: left">
			<td>
				<fieldset style="height: 600px; width: 1070px;">

					<div style="margin-top: 15px" id="title">
						<td width="10%">Sản phẩm</td>
					</div>

					<form method="get" action="sale_searchProduct">
						<div style="margin-top: 20px">
							<tr>
								<td>Mã sản phẩm: <input type="text" name="productCode" /></td>
								<td>Tên sản phẩm: <input type="text" name="productName" /></td>
								<td>Loại sản phẩm: <select name="categoryID">
										<option value="0">Tất Cả</option>
										<c:forEach var="category" items="${categoryList}">
											<option value="${category.getCategoryID()} "><c:out
													value="${category.getCategoryName()}"></c:out></option>
										</c:forEach>
								</select>
								</td>
								<td><input type="submit" value="Tìm Kiếm" /><input
									type="hidden" name="productID"
									value="${product.getProductID()}" /></td>
							</tr>
						</div>
					</form>
					<div style="margin-top: 10px">
						<table id="normalTable" border="1" width="100%">

							<tr bgcolor="#DEB887">
								<td width="5%">Mã sản phẩm</td>
								<td width="20%">Tên sản phẩm</td>
								<td width="10%">Đơn vị tính</td>

								<td width="14%">Giá bán(vnd)/ 1(sp)</td>
								<td width="20%">Nhà cung cấp</td>
								<td width="4%">Trạng thái</td>


							</tr>
							<c:forEach var="productList" items="${productList}">
								<tr>
									<td>${productList.getProductCode()}</td>
									<td>${productList.getProductName()}</td>
									<td>${productList.getPackagedType()}</td>
									<td class="right">${productList.getImportPrice()}</td>
									<td>${productList.getSupplier().getSupplierName()}</td>
									<c:choose>
										<c:when
											test="${(productList.unitsInStock-productList.unitsOnOrders)>0}">
											<td>Còn hàng</td>
										</c:when>
										<c:otherwise>
											<td>Hết hàng</td>
										</c:otherwise>
									</c:choose>
							</c:forEach>
						</table>
						<div style="margin-top: 15px">
							<button type="button" value="Goto"
								onclick='window.location="store_createProduct"'>Thêm
								sản phẩm mới</button>
						</div>
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

	<!-- end wrapper -->
	<div id="footer">© Copyright 2014 Group Milk Distributor
		Management System, All rights reserved.</div>
	<!---end footer -->
</body>
</html>
