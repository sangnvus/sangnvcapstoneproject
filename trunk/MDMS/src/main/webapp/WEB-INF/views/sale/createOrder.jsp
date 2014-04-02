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
	function autofill() {
		/* var row = $('table#myTable tr:last').index();
		$('#myTable')
			.append(
					"<tr><td>"
							+ (row + 1)
							+ "</td><td><select><option value='1'>Vinamilk</option><option value='1'>fami</option></select></td>"
							+ "<td></td><td><input type='text' disabled='disabled' name='packagedType'></td><td><input type='text' name='quantity'></td>"
							+ "<td><input type='text' disabled='disabled' name='price'></td><td><input type='text' name='total'></td></tr>");  */
		var product1 = document.getElementById('product').options[product.selectedIndex];
		var row = product1.dataset["row"];
		var packagedType = document.getElementsByName("packagedType" + row);
		packagedType.item(0).value = product1.dataset["packaged"];
		var quantity = document.getElementsByName("quantity" + row);
		quantity.item(0).value = 1;
		var price = document.getElementsByName("price" + row);
		price.item(0).value = product1.dataset["price"];
		var total = document.getElementsByName("total" + row);
		total.item(0).value = product1.dataset["price"];
	}
	function Quantity(price, row) {
		var text = document.getElementById("quantity" + row).value;
		var a = parseInt(text) * parseFloat(price);
		var total = document.getElementsByName("total" + row);
		total.item(0).value = a + ".00";
	}
	function onload() {
		document.getElementById('createdDate').value = new Date().toISOString()
				.substring(0, 10);
		document.getElementById('requiredDate').value = new Date()
				.toISOString().substring(0, 10);
	}
</script>
</head>
<body onload="onload()">
	<form action="saveOrder" method="post">
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
				<table width="600" align="center" cellspacing="0" id="menubar">
					<tr>
						<td><a href="Products.html" id="font">Sản phẩm</a></td>

						<td onmouseover="ShowSub('subKhachhang', true);"
							onmouseout="ShowSub('subKhachhang' ,false);"><a href="#"
							id="font">Đại lý</a></td>

						<td onmouseover="ShowSub('subDonhang', true);"
							onmouseout="ShowSub('subDonhang' ,false);"><a href="#"
							id="font">Đơn hàng</a></td>

						<td><a href="#" id="font">&nbsp;</a></td>

						<td><a href="#" id="font">&nbsp;</a></td>

					</tr>
					<tr>
						<td></td>
						<td onmouseover="ShowSub('subKhachhang', true);"
							onmouseout="ShowSub('subKhachhang' ,false);">
							<table id="subKhachhang" class="menu" cellpadding="0">
								<tr>
									<td><a href="Listdealer.html" id="font"> Danh sách đại
											lý </a></td>
								</tr>
								<tr>
									<td><a href="Createdealer.html" id="font"> Thêm đại lý
									</a></td>
								</tr>
							</table>
						</td>
						<td onmouseover="ShowSub('subDonhang', true);"
							onmouseout="ShowSub('subDonhang' ,false);">
							<table id="subDonhang" class="menu" cellpadding="0">
								<tr>
									<td><a href="ListOrder.html" id="font"> Danh sách đơn
											hàng </a></td>
								</tr>
								<tr>
									<td><a href="CreateOrder.html" id="font"> Thêm đơn
											hàng </a></td>
								</tr>
							</table>
						</td>

					</tr>
				</table>
				<div style="float: left">
					<div>
						<fieldset style="height: 1000px; width: 1070px;">
							<div style="margin-top: 15px" id="title">
								<td width="10%">Chi tiết đơn hàng</td>
							</div>
							<table>
								<tr>
									<td>Ngày tạo:</td>
									<td><input type="date" name="createdDate" id="createdDate"></td>
								</tr>
								<tr>
									<td>Ngày yêu cầu giao hàng:</td>
									<td><input type="date" name="requiredDate"
										id="requiredDate"></td>
								</tr>
								<tr>
									<td>Đại lý</td>
									<td><select name="dealerID" id="dealer">
											<option>Select Dealer</option>
											<c:forEach var="dealer" items="${dealerList}">
												<option value="${dealer.getDealerID()}">
													<c:out value="${dealer.getDealerName()}"></c:out></option>
											</c:forEach>
									</select></td>
								</tr>
							</table>

							<br />

							<div style="margin-top: 20px">
								<table border="1" width="100%">

									<tr bgcolor="#DEB887">
										<td width="5%">STT</td>
										<td width="25%">Tên hàng hóa</td>
										<td>&nbsp</td>

										<td width="4%">Đơn vị tính</td>
										<td width="10%">Số lượng</td>
										<td width="10%">Đơn giá(vnd)</td>
										<td width="10%">Thành tiền</td>

									</tr>

									<tr>
										<td>1</td>
										<td><select name="productID1" onchange="autofill()"
											id="product">
												<option value="0" data-packaged="" data-price="0"
													data-row="1">Select Product</option>
												<c:forEach var="product" items="${productList}">
													<option value="${product.getProductID()}"
														data-packaged="${product.getPackagedType()}"
														data-price="${product.getExportPrice()}" data-row="1">
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
											onchange="Quantity(document.getElementById('price1').value,'1');"></td>
										<td><input type="text" disabled="disabled" name="price1"
											id="price1"></td>
										<td><input type="text" disabled="disabled" name="total1"></td>

									</tr>
								</table>
							</div>
							<div style="margin-right: 40px; margin-top: 10px" align="right">
								Tổng Tiền : <input class="right" />
							</div>
							<div style="margin-right: 34px; margin-top: 10px" align="right">
								<button type="submit" value="Goto">Lưu</button>
								<button type="button" value="Goto"
									onclick='window.location="ListOrder.html"'>Hủy bỏ</button>
							</div>

						</fieldset>
					</div>
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
		<input type="hidden" name="userID" value="3"> <input
			type="hidden" name="row" value="1">
	</form>
</body>
</html>
