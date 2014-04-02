<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Create Order</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(
	 function() {
	 	$('a').click(
		 function() {
			 var row = $('table#myTable tr:last').index() + 1;
			 $('#myTable').append("<tr><td>"
			 + row
			 + "</td><td><select><option value='1'>Vinamilk</option><option value='1'>fami</option></select></td>"
			 + "<td></td><td><input type='text' disabled='disabled' name='packagedType'></td><td><input type='text' name='quantity'></td>"
			 + "<td><input type='text' disabled='disabled' name='price'></td><td><input type='text' name='total'></td></tr>");
		 });
	 });
	function autofill(packaged, price1, row) {
		 /* var row = $('table#myTable tr:last').index();
		$('#myTable')
				.append(
						"<tr><td>"
								+ (row + 1)
								+ "</td><td><select><option value='1'>Vinamilk</option><option value='1'>fami</option></select></td>"
								+ "<td></td><td><input type='text' disabled='disabled' name='packagedType'></td><td><input type='text' name='quantity'></td>"
								+ "<td><input type='text' disabled='disabled' name='price'></td><td><input type='text' name='total'></td></tr>");  */
		alert("here");
		var packagedType = document.getElementsByName("packagedType"+row);
		packagedType.item(0).value = packaged;
		var quantity = document.getElementsByName("quantity"+row);
		quantity.item(0).value = 1;
		var price = document.getElementsByName("price"+row);
		price.item(0).value = price1;
		var total = document.getElementsByName("total"+row);
		total.item(0).value = price1;

	}
	function Quantity(price, row) {
		alert("quantity");
		var text = document.getElementById("quantity"+row).value;
		var a=parseInt(text)*parseFloat(price);
		var total = document.getElementsByName("total"+row);
		total.item(0).value = a+".00";
	}
	function onload(){
		document.getElementById('createdDate').value = new Date().toISOString().substring(0, 10);
		document.getElementById('createdDate').value = new Date().toISOString().substring(0, 10);
	}
	function test() {
		alert("test");
		 var de = document.getElementById('dealer').options[dealer.selectedIndex].value;
		 var name =  document.getElementById('dealer').options[dealer.selectedIndex].dataset["a"];
		alert(name);
	}
</script>
</head>
<body onload="onload()">
	<form action="saveOrder" method="post">
		<table>
			<tr>
				<td>Ngày tạo:</td>
				<td><input type="date" name="createdDate" id="createdDate"></td>
			</tr>
			<tr>
				<td>Ngày yêu cầu giao hàng:</td>
				<td><input type="date" name="requiredDate" id="requiredDate"></td>
			</tr>
			<tr>
				<td>Đại lý:</td>
				<td><select name="dealerID" onchange="test()" id="dealer">
						<option>Select Dealer</option>
						<c:forEach var="dealer" items="${dealerList}">
							<option value="${dealer.getDealerID()}" data-a="${dealer.getDealerName()}">
								<c:out value="${dealer.getDealerName()}"></c:out></option>
						</c:forEach>
				</select></td>
			</tr>
		</table>
		<table id="myTable" border="1">
			<tr>
				<th>STT</th>
				<th>Tên hàng</th>
				<th></th>
				<th>Đơn vị tính</th>
				<th>Số lượng</th>
				<th>Đơn giá</th>
				<th>Thành tiền</th>
			</tr>
			<tr>
				<td>1</td>
				<td><select name="productID1">
						<option>Select Product</option>
						<c:forEach var="product" items="${productList}">
							<option value="${product.getProductID()}" 
								onclick="autofill('${product.getPackagedType()}','${product.getExportPrice()}','1')">
								${product.getProductName()}</option>
						</c:forEach>
				</select></td>
				<td></td>
				<td><input type="text" disabled="disabled" name="packagedType1"
					id=""></td>
				<td><input type="text" name="quantity1" id="quantity1"
					onchange="Quantity(document.getElementById('price1').value,'1');"></td>
				<td><input type="text" disabled="disabled" name="price1"
					id="price1"></td>
				<td><input type="text" disabled="disabled" name="total1"></td>
			</tr>
			<tr>
				<td>2</td>
				<td><select name="productID2">
						<option>Select Product</option>
						<c:forEach var="product" items="${productList}">
							<option value="${product.getProductID()}"
								onclick="autofill('${product.getPackagedType()}','${product.getExportPrice()}','2')">
								<c:out value="${product.getProductName()}"></c:out></option>
						</c:forEach>
				</select></td>
				<td></td>
				<td><input type="text" disabled="disabled" name="packagedType2"
					id="packagedType2"></td>
				<td><input type="text" name="quantity2" id="quantity2"
					onchange="Quantity(document.getElementById('price2').value,'2');"></td>
				<td><input type="text" disabled="disabled" name="price2"
					id="price2"></td>
				<td><input type="text" disabled="disabled" name="total2"></td>
			</tr>
			<tr>
				<td>3</td>
				<td><select name="productID3">
						<option>Select Product</option>
						<c:forEach var="product" items="${productList}">
							<option value="${product.getProductID()}"
								onclick="autofill('${product.getPackagedType()}','${product.getExportPrice()}','3')">
								<c:out value="${product.getProductName()}"></c:out></option>
						</c:forEach>
				</select></td>
				<td></td>
				<td><input type="text" disabled="disabled" name="packagedType3"
					id="packagedType3"></td>
				<td><input type="text" name="quantity3" id="quantity3"
					onchange="Quantity(document.getElementById('price3').value,'3');"></td>
				<td><input type="text" disabled="disabled" name="price3"
					id="price3"></td>
				<td><input type="text" disabled="disabled" name="total3"></td>
			</tr>

		</table>
		<a href="javascript:void(0);">Thêm</a> <input type="hidden"
			name="userID" value="3"> 
			<input type="hidden" name="row" value="3">
			<button type="submit" name="saveOrder">Lưu Order</button>
	</form>
</body>
</html>