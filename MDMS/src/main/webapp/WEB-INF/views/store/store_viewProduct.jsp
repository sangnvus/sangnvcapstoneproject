<%@page import="fu.mdms.model.Product"%>
<%@page import="fu.mdms.dao.impl.ProductDaoImpl"%>
<%@page import="fu.mdms.dao.ProductDao"%>
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
<%
	ProductDao productDao = new ProductDaoImpl();
	Product product = (Product) session.getAttribute("product");
%>
<body>
	<form action="store_editProduct" method="post">
		<input type="hidden" name="productID"
			value="${product.getProductID() }" />
		<div id="wrapper">
			<div id="inner">
				<div id="header">
					<h1>
						<img src="resources/images/logo.gif" width="519" height="63"
							alt="Milk Distributor Management System" />
					</h1>
					<div id="nav">
						Xin chào <a href=""> <font color="Blue">Tung</font></a> | <a
							href=""><font color="Blue">Đăng xuất</font></a>
					</div>
					<!-- end nav -->
				</div>
				<!-- end header -->
				<%@ include file="store_menu.jsp" %> 

				<div style="float: left">
					<td>
						<fieldset style="height: 600px; width: 1070px;">

							<div style="margin-top: 15px" id="title">
								<td width="10%">Thêm sản phẩm</td>
							</div>

							<div style="margin-top: 10px; margin-left: 40px">
								<table border="0" width="60%" align="left">

									<tr>
										<td width="5%">Mã sản phẩm</td>
										<td width="25%" ><input width="25%" size="20" type="text" disabled="disabled" class ="inputA"
											name="msp" value="${product.getProductCode()}"></input></td>
									</tr>

									<tr>
										<td width="5%">Tên sản phẩm</td>
										<td width="25%"><input width="25%" size="20" type="text" disabled="disabled" class ="inputE"
											name="tsp" value="${product.getProductName()}"></input></td>
									</tr>

									<tr>
										<td width="5%">Kiểu đóng gói</td>
										<td width="25%"><input width="25%" size="20" type="text" disabled="disabled"  style = "width: 136px
											name="kdg" value="${product.getPackagedType()}"></input></td>
									</tr>
									<tr>
										<td width="8%">Loại sản phẩm</td>
										<td width="25%"><select id="category" name="category" disabled="disabled" class ="inputC"> 
												
												<c:forEach var="category" items="${categoryList}">
													<option value="${category.getCategoryID()}"><c:out
															value="${category.getCategoryName()}"></c:out></option>
												</c:forEach>

										</select></td>
									</tr>

									<tr>
										<td width="5%">Nhà cung cấp</td>
										<td width="25%"><select id="supplier" name="supplier" disabled="disabled" class ="inputC"> 
												<c:forEach var="supplier" items="${supplierList}">
													<option value="${supplier.getSupplierID()}"><c:out
															value="${supplier.getSupplierName()}"></c:out></option>
												</c:forEach>

										</select></td>
									</tr>

									<tr>
										<td width="5%">Nhà sản xuất</td>
										<td width="25%"><select id="producer" name="producer" disabled="disabled" class ="inputC">
												<c:forEach var="producer" items="${producerList}">
													<option value="${producer.getProducerID()}"><c:out
															value="${producer.getProducerName()}"></c:out></option>
												</c:forEach>

										</select></td>
									</tr>

									<tr>
										<td width="5%">Trong kho</td>
										<td width="25%"><input width="25%" size="20"
											type="number" disabled="disabled"  class ="inputBB"name="gn" value="${product.unitsInStock}"></input></td>
									</tr>
									
									<tr>
										<td width="5%">Đặt hàng</td>
										<td width="25%"><input width="25%" size="20"
											type="number"  disabled="disabled" class ="inputBB" name="gn"  value="${product.unitsOnOrders}"></input></td>
									</tr>
									<tr>
										<td width="5%">Giá nhập</td>
										<td width="25%"><input width="25%" size="20"
											type="number"  disabled="disabled" class ="inputBB" name="gn" value="${product.getImportPrice()}"></input>VND</td>
									</tr>

									<tr>
										<td width="5%">Giá xuất</td>
										<td width="25%"><input width="25%" size="20"
											type="number" disabled="disabled" class ="inputBB" name="gx" value="${product.getExportPrice()}"></input>VND</td>
									</tr>

									<tr>
										<td width="8%">Mô tả sản phẩm</td>
										<td width="24%"><textarea type="text" class ="inputE"  disabled="disabled" name="mtsp"
											value="${product.getDescription()}"
											"></textarea></td>
									</tr>

									<tr>
										<td width="5%"&nbsp;></td>
										<td width="25%"><input type="submit" value="Sửa"></input>
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

		<!-- end wrapper -->
	</form>
</body>
</html>
