<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>List Product</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<!-- <script type="text/javascript">
	$(document)
			.ready(
					function() {
						$('a')
								.click(
										function() {
											var row = $('table#myTable tr:last')
													.index() + 1;
											$('#myTable')
													.append(
															"<tr><td>"
																	+ row
																	+ "</td><td><select><option value='1'>Vinamilk</option><option value='1'>fami</option></select></td>"
																	+ "<td></td><td><input type='text' disabled='disabled' name='packagedType'></td><td><input type='text' name='quantity'></td>"
																	+ "<td><input type='text' disabled='disabled' name='price'></td><td><input type='text' name='total'></td></tr>");
										});
					});
	function autofill(first, last) {
		alert("fsafaslfj");
		var object = document.getElementsByName('name_textbox');
		object.item(0).value = first;
	}
</script> -->
</head>
<body>
	<form method="get" action="searchProduct">
		<div>
			<tr>
				<td>Mã Sản Phẩm: <input type="text" name="maSanPham"></td>
				<td>Tên Sản Phẩm: <input type="text" name="tenSanPham"></td>
				<td>Loại Sản Phẩm: 
				<select name="loaiSanPham">
				<option value="0">Tất Cả</option>
				<c:forEach var="category" items="${categoryList}">
				<option value="${category.getCategoryID()} "><c:out value="${category.getCategoryName()}"></c:out></option>
				</c:forEach>
				</select>
				</td>
				<td><input type="submit" value="Tìm Kiếm"></td>
			</tr>
		</div>
	</form>
	<table id="myTable" border="1">
		<tr>
			<th>Mã</th>
			<th>Tên Sản Phẩm</th>
			<th>Đơn Vị Tính</th>
			<th>Giá Nhập(vnd)/1(sp)</th>
			<th>Giá Xuất(vnd)/1(sp)</th>
			<th>Nhà Cung cấp</th>
			<th>Số Lượng</th>
			<th>Sửa</th>
			<th>Xóa</th>
		</tr>
		<c:forEach var="product" items="${productList}">
			<tr>
				<td><c:out value="${product.getProductCode()}"></c:out></td>
				<td><c:out value="${product.getProductName()}"></c:out></td>
				<td><c:out value="${product.getPackagedType()}"></c:out></td>
				<td><c:out value="${product.getImportPrice()}"></c:out></td>
				<td><c:out value="${product.getExportPrice()}"></c:out><input
					type="button" value="Cập Nhật"></td>
				<td><c:out value="${product.getSupplier().getSupplierName()}"></c:out></td>
				<td><c:out value="${product.getUnitsInStock()}"></c:out></td>
				<td><input type="button" value="Chi tiết"></td>
				<td><input type="button" value="Sửa"></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>