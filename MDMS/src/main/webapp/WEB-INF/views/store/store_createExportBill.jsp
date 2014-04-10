<%@page import="org.springframework.context.annotation.Import"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="fu.mdms.model.Order"%>
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
	function Quantity(price, row, remaining) {
		var quantity = document.getElementById("quantity" + row).value;
		var a = parseInt(quantity) * parseFloat(price);
		var total = document.getElementsByName("total" + row);
		total.item(0).value = a + ".00";
		document.getElementsByName("remaining" + row).item(0).value = parseInt(remaining)
				- parseInt(quantity);
	}
	function onload() {
		document.getElementById('createdDate').value = new Date().toISOString()
				.substring(0, 10);
		document.getElementById('exportDate').value = new Date().toISOString()
				.substring(0, 10);
	}
	$(document).ready(function() {

		//iterate through each textboxes and add keyup
		//handler to trigger sum event
		$(".total").each(function() {

			$(this).keyup(function() {
				calculateSum();
			});
		});

	});

	function calculateSum() {

		var sum = 0;
		//iterate through each textboxes and add the values
		$(".total").each(function() {
			//add only if the value is number
			if (!isNaN(this.value) && this.value.length != 0) {
				sum += parseFloat(this.value);
			}

		});
		//.toFixed() method will roundoff the final sum to 2 decimal places
		$("#sum").html(sum.toFixed(2));
	}
</script>
</head>
<body onload="onload()">
	<form action="store_saveExportBill" method="post">
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
					<div>
						<fieldset style="height: 1000px; width: 1070px;">
							<div style="margin-top: 15px" id="title">
								<td width="10%">Tạo phiếu xuất</td>
							</div>
							<table width="100%">
								<td id="size">
									<div style="margin-top: 10px">
										Ngày tạo: <input style="margin-left: 19px;" type="date"
											name="createdDate" id="createdDate" value="">
									</div>
									<div>
										Ngày xuất: <input style="margin-left: 10px;" type="date"
											name="exportDate" id="exportDate">
									</div>
									<div>Ngày yêu cầu giao hàng:
										${order.getRequiredDate().toString().substring(0, 10)}</div>


									<div>Đại lý: ${order.getDealer().getDealerName()}</div>

									<div>Điện thoại : ${order.getDealer().getPhone()}</div>
									<div>Fax : ${order.getDealer().getFax()}</div>
									<div>Mã số thuế: ${order.getDealer().getTaxCode()}</div>

								</td>

								<td id="size">
									<div style="margin-top: 10px">&nbsp;</div>
									<div>&nbsp;</div>
									<div>&nbsp;</div>
									<div>&nbsp;</div>
									<div>&nbsp;</div>
									<div>Giấy phép kinh doanh:
										${order.dealer.businessLicenseCode}</div>
									<div>Địa chỉ : ${order.dealer.address} -
										${order.dealer.district.districtName} -
										${order.dealer.district.province.provinceName}.</div>
								</td>
							</table>

							<br />

							<div style="margin-top: 20px">
								<table border="1" width="100%">

									<tr bgcolor="#DEB887">
										<td width="5%">STT</td>
										<td width="25%">Tên hàng hóa</td>
										<td width="8%">&nbsp</td>
										<td width="5%">Đơn vị tính</td>
										<td width="5%">Số lượng xuất</td>
										<td width="5%">Còn lại</td>
										<td width="10%">Đơn giá(vnd)</td>
										<td width="10%">Thành tiền</td>

									</tr>
									<c:forEach var="orderDetail" items="${orderDetailList}"
										varStatus="status">
										<tr>
											<td>${status.count}</td>
											<td><select name="productID${status.count}" style="width: 100%" disabled="disabled">
													<option value="${orderDetail.product.productID}" selected="selected">${orderDetail.product.productName}
													</option>
											</select>
											<input type="hidden" name="productID${status.count}" value="${orderDetail.product.productID}"></td>
											<td>
												<button>Tìm kiếm</button>
											</td>
											<td><input type="text" disabled="disabled"
												name="packagedType${status.count}" id=""
												value="${orderDetail.product.packagedType}"></td>
											<td><input type="text" name="quantity${status.count}"
												id="quantity${status.count}" value="${orderDetail.quantity-quantityOfExport[status.count-1]}"
												onchange="Quantity(document.getElementById('price${status.count}').value,'${status.count}','${orderDetail.quantity-quantityOfExport[status.count-1]}');"></td>
											<td><input type="text" name="remaining${status.count}"
												size="6" disabled="disabled" id="remaining${status.count}"
												value="${orderDetail.quantity-quantityOfExport[status.count-1]}"></td>
											<td><input type="text" disabled="disabled"
												name="price${status.count}" id="price${status.count}"
												value="${orderDetail.price}"></td>
											<td><input type="text" disabled="disabled" class="total"
												name="total${status.count}"
												value="${orderDetail.quantity*orderDetail.price}"></td>

										</tr>
									</c:forEach>
								</table>
							</div>
							<div style="margin-right: 40px; margin-top: 10px" align="right">
								Triết khấu:<input size="3" type="text" name="discount" value="0">% 
							</div>
							<div style="margin-right: 40px; margin-top: 10px" align="right">
								Tổng tiền hàng: <span id="sum">0</span>
							</div>
							<div style="margin-top: 15px; margin-right: 14px" align="left">
								<td><input type="submit" value="Xuất">
									<button type="button" value="Goto"
										onclick='window.history.back()'>Hủy bỏ</button>
									<button type="button" value="Goto"
										onclick='window.open("Print.html", "littleWindow", "location=no,width=320,height=200")'>In</button>
								</td>
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
		<!-- end wrapper -->
		<input type="hidden" name="orderID" value="${order.getOrderID()}">
		<input type="hidden" name="row" value="${orderDetailList.size()}">
		<input type="hidden" name="dealerID" value="${order.dealer.dealerID}">
	</form>
</body>
</html>
