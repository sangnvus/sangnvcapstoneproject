<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>List ImportBill</title>
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
	<form method="get" action="searchDealer">
		<div>
			<tr>
				<td>Nhà Cung Cấp: <input type="text" name="nhaCungCap"></td>				
				<td><input type="submit" value="Tìm Kiếm"></td>
			</tr>
		</div>
	</form>
	<table id="myTable" border="1">
		<tr>
			<th>Mã Hóa Đơn</th>
			<th>Nhà Cung Cấp</th>
			<th>Thời Gian</th>
			<th>Chi tiết</th>
			<th>Sửa</th>
		</tr>
		<c:forEach var="importBilltList" items="${importBilltList}">
			<tr>
				<td><c:out value="${importBilltList.getImportBillID()}"></c:out></td>
				<td>Minh company</td>
				<td><c:out value="${importBilltList.getImportDate()}"></c:out></td>			
				<td><input type="button" value="Chi tiết"></td>
				<td><input type="button" value="Sửa"></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>