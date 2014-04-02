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
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var sum = 0;
		$('td[id^="total"]').each(function(k, v) {
			sum += parseInt($(this).text());
			if (k === $('td[id^="total"]').length - 1)
				$('#sum').text(sum);
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
				<div id="nav">
					Xin chào <a href=""> <font color="Blue">Tung</font></a> | <a
						href=""><font color="Blue">Đăng xuất</font></a>
				</div>
				<!-- end nav -->
			</div>
			<!-- end header -->
			<table width="600" align="center" cellspacing="0" id="menubar">
				<tr>

					<td onmouseover="ShowSub('subSanpham', true);"
						onmouseout="ShowSub('subSanpham' ,false);"><a
						href="Products.html" id="font">Sản phẩm</a></td>

					<td onmouseover="ShowSub('subDonhang', true);"
						onmouseout="ShowSub('subDonhang' ,false);"><a href="#"
						id="font">Đơn hàng</a></td>

					<td onmouseover="ShowSub('subDaily', true);"
						onmouseout="ShowSub('subDaily' ,false);"><a
						href="ListDealer.html" id="font">Đại lý</a></td>

					<td><a href="ListSupplier.html" id="font">Nhà cung cấp</a></td>

					<td><a href="#" id="font">Báo cáo</a></td>

				</tr>
				<tr>
					<td onmouseover="ShowSub('subSanpham', true);"
						onmouseout="ShowSub('subSanpham' ,false);">
						<table id="subSanpham" class="menu" cellpadding="0">
							<tr>
								<td><a href="CreateProduct.html" id="font"> Thêm sản
										phẩm </a></td>

							</tr>
							<tr>
								<td><a href="ListImportBill.html" id="font">Nhập hàng</a></td>
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
						</table>
					</td>
					<td onmouseover="ShowSub('subDaily', true);"
						onmouseout="ShowSub('subDaily' ,false);">
						<table id="subDaily" class="menu" cellpadding="0">
							<tr>
								<td><a href="CreateDealer.html" id="font"> Thêm đại lý</a>
								</td>
							</tr>
						</table>
					</td>

				</tr>
			</table>
			<div style="float: left">
				<td>
					<fieldset style="height: 600px; width: 1070px;">

						<div style="margin-top: 15px" id="title">
							<td width="10%">Chi tiết đơn hàng</td>
						</div>

						<div style="margin-top: 10px">Ngày tạo:
							${order.getOrderDate().toString().substring(0, 10)}</div>

						<div>Ngày yêu cầu giao hàng:
							${order.getRequiredDate().toString().substring(0, 10)}</div>

						<div>Đại lý: ${order.getDealer().getDealerName()}</div>

						<div>Điện thoại : ${order.getDealer().getPhone()}</div>
						<div>Fax : ${order.getDealer().getFax()}</div>
						<div>Mã số thuế: ${order.getDealer().getTaxCode()}</div>
						<div>Giấy phép kinh doanh:
							${order.getDealer().getBusinessLicenseCode()}</div>

						<div>Địa chỉ : ${order.getDealer().getAddress()} -
							${order.getDealer().getDistrict().getDistrictName()} -
							${order.getDealer().getDistrict().getProvince().getProvinceName()}</div>

						<div style="margin-top: 10px">
							<table border="1" width="100%">

								<tr bgcolor="#DEB887">
									<td width="5%">STT</td>
									<td width="25%">Tên hàng hóa</td>
									<td width="4%">Đơn vị tính</td>
									<td width="10%">Số lượng</td>
									<td width="10%">Đơn giá(vnd)</td>
									<td width="10%">Thành tiền</td>

								</tr>
								<c:forEach var="orderDetail" items="${orderDetailList}"
									varStatus="status">
									<tr>
										<td>${status.count}</td>
										<td>${orderDetail.getProduct().getProductName()}</td>
										<td>${orderDetail.getProduct().getPackagedType()}</td>
										<td class="right">${orderDetail.getQuantity()}</td>
										<td class="right">${orderDetail.getPrice()}</td>
										<td class=right id="total">${orderDetail.getQuantity()*orderDetail.getPrice()}</td>

									</tr>
								</c:forEach>
							</table>
						</div>
						<div style="margin-top: 15px;" align="right">
							Tổng tiền hàng: <span id="sum">0</span>
						</div>


						<div style="margin-top: 15px">
							<td>
									<button type="button" onclick='window.location="store_cancelOrder?orderID=${order.getOrderID()}"'>Từ chối</button>

								<button type="button" value="Goto"
									onclick='window.location="store_createExportBill"'>Phê
									duyệt</button>
							</td>
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
	</div>
	<!-- end wrapper -->
</body>
</html>
