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
	function onload() {
		document.getElementById('importDate').value = new Date().toISOString()
				.substring(0, 10);
	}
	function autofill(row) {
		var productSelect
		if (row == "1") {
			productSelect = document.getElementById('product1').options[product1.selectedIndex];
		} else if (row == "2") {
			productSelect = document.getElementById('product2').options[product2.selectedIndex];
		} else if (row == "3") {
			productSelect = document.getElementById('product3').options[product3.selectedIndex];
		}
		var packagedType = document.getElementsByName("packagedType" + row);
		packagedType.item(0).value = productSelect.dataset["packaged"];
		var quantity = document.getElementsByName("quantity" + row);
		quantity.item(0).value = 1;
		var price = document.getElementsByName("price" + row);
		price.item(0).value = productSelect.dataset["price"];
		var total = document.getElementsByName("total" + row);
		total.item(0).value = productSelect.dataset["price"];
	}
	function Quantity(price, row) {
		var text = document.getElementById("quantity" + row).value;
		var a = parseInt(text) * parseFloat(price);
		var total = document.getElementsByName("total" + row);
		total.item(0).value = a + ".00";
	}
</script>
</head>
<body onload="onload()">
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
			<%@ include file="store_menu.jsp" %> 
			<div style="float: left">
				<td>
				<form action="store_saveImportBill" method="post">
					<fieldset style="height: 600px; width: 1070px;">

						<div style="margin-top: 15px" id="title">
							<td width="10%">Nhập hàng</td>
						</div>

						<div style="margin-top: 15px">
							Ngày nhập: <input style="margin-left: 19px" type="date"
								name="importDate" id="importDate">
						</div>
						<div style="margin-top: 5px">
							Nhà cung cấp: <select name="supplierID" id="dealer">
								<option>Select Supplier</option>
								<c:forEach var="supplier" items="${supplierList}">
									<option value="${supplier.supplierID}">${supplier.supplierName}</option>
								</c:forEach>
							</select>
							<button type="button" value="Goto" onclick='window.location="#"'>Tìm
								kiếm</button>
							<button type="button" value="Goto"
								onclick='window.location="CreateSupplier.html"'>Tạo mới
								nhà cung cấp</button>





						</div>




						<div style="margin-top: 10px">
							<table border="1" width="100%">

								<tr bgcolor="#DEB887">
									<td width="5%">STT</td>
									<td width="25%">Tên hàng hóa</td>
									<td>&nbsp</td>
									<td width="4%">Đơn vị tính</td>
									<td width="10%">Số lượng</td>
									<td width="10%">Giá nhập(VND)/ 1(sp)</td>
									<td width="10%">Thành tiền(VND)</td>

								</tr>

								<tr>
									<td>1</td>
									<td><select name="productID1" onchange="autofill(1)"
										id="product1">
											<option value="0" data-packaged="" data-price="0"
												data-row="1">Select Product</option>
											<c:forEach var="product" items="${productList}">
												<option value="${product.getProductID()}"
													data-packaged="${product.getPackagedType()}"
													data-price="${product.getExportPrice()}">
													${product.getProductName()}</option>
											</c:forEach>
									</select></td>
									<td>
										<button type="button" value="Goto"
											onclick='window.location="FillProduct.html"'>Tìm
											kiếm</button>
									</td>
									<td><input type="text" disabled="disabled"
										name="packagedType1" id=""></td>
									<td><input type="number" name="quantity1" id="quantity1"
										value="0" min="1"
										onchange="Quantity(document.getElementById('importPrice1').value,'1');"
										class="right"></td>
									<td><input type="text" name="importPrice1"
										id="importPrice1"
										onchange="Quantity(document.getElementById('importPrice1').value,'1');"
										class="right" value="0"></td>
									<td><input type="text" name="total1" id="total1"
										class="right" disabled></input></td>
								</tr>
								<tr>
									<td>2</td>
									<td><select name="productID2" onchange="autofill(2)"
										id="product2">
											<option value="0" data-packaged="" data-price="0"
												data-row="1">Select Product</option>
											<c:forEach var="product" items="${productList}">
												<option value="${product.getProductID()}"
													data-packaged="${product.getPackagedType()}"
													data-price="${product.getExportPrice()}">
													${product.getProductName()}</option>
											</c:forEach>
									</select></td>
									<td>
										<button type="button" value="Goto"
											onclick='window.location="FillProduct.html"'>Tìm
											kiếm</button>
									</td>
									<td><input type="text" disabled="disabled"
										name="packagedType2" id=""></td>
									<td><input type="number" name="quantity2" id="quantity2"
										value="0" min="1"
										onchange="Quantity(document.getElementById('importPrice2').value,'2');"
										class="right"></td>
									<td><input type="text" name="importPrice2"
										id="importPrice2"
										onchange="Quantity(document.getElementById('importPrice2').value,'2');"
										class="right" value="0"></td>
									<td><input type="text" name="total2" id="total2"
										class="right" disabled></input></td>
								</tr>
								<tr>
									<td>3</td>
									<td><select name="productID3" onchange="autofill(3)"
										id="product3">
											<option value="0" data-packaged="" data-price="0"
												data-row="3">Select Product</option>
											<c:forEach var="product" items="${productList}">
												<option value="${product.getProductID()}"
													data-packaged="${product.getPackagedType()}"
													data-price="${product.getExportPrice()}">
													${product.getProductName()}</option>
											</c:forEach>
									</select></td>
									<td>
										<button type="button" value="Goto"
											onclick='window.location="FillProduct.html"'>Tìm
											kiếm</button>
									</td>
									<td><input type="text" disabled="disabled"
										name="packagedType3" id=""></td>
									<td><input type="number" name="quantity3" id="quantity3"
										value="0" min="1"
										onchange="Quantity(document.getElementById('importPrice3').value,'3');"
										class="right"></td>
									<td><input type="text" name="importPrice3"
										id="importPrice3"
										onchange="Quantity(document.getElementById('importPrice3').value,'3');"
										class="right" value="0"></td>
									<td><input type="text" name="total3" id="total3"
										class="right" disabled></input></td>
								</tr>
							</table>

							<div style="margin-right: 5px; margin-top: 10px" align="right">
								Tổng Tiền : <input type="text" name="tt" disabled class="right" />VND
							</div>
							<div style="margin-right: 34px; margin-top: 10px" align="left">
								<button type="submit" value="Goto">Lưu tạm</button>
								<button type="button" value="Goto"
									onclick='window.location="Products.html"'>Lưu</button>
								<button type="button" value="Goto"
									onclick='window.location="NhapKho.html"'>Hủy Bỏ</button>
							</div>
						</div>


					</fieldset>
					<input type="hidden" name="row" value="3">
					</form>
					
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

