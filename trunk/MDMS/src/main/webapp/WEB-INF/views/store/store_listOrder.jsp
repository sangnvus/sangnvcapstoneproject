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
			<div>
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
			</div>
			<div style="float: left">
				<td>
					<fieldset style="height: 600px; width: 1070px;">
						<div style="margin-top: 15px" id="title">
							<td width="10%">Danh sách đơn hàng</td>
						</div>
						<form action="store_orderSearch" method="post">
							<div style="margin-top: 15px">
								<input type="text" name="search_dealerName" value="Tên đại lý"
									onClick="(this.value='')"> <select>
									<option value="1">Mới</option>
									<option value="2">Từ chối</option>
									<option value="3">Đang chờ</option>
									<option value="4">Hoàn thành</option>
								</select>
								<button type="submit">Tìm kiếm</button>

							</div>
						</form>
						<div style="margin-top: 10px">
							<table border="1" width="100%" id="normalTable">

								<tr bgcolor="#DEB887">
									<td width="5%">Mã</td>
									<td width="25%">Tên đại lý</td>
									<td width="10%">Thời gian</td>
									<td width="15%">Trạng thái</td>
									<td width="4%">Chi tiết</td>
									<td width="7%">Tạo phiếu xuất</td>

								</tr>
								<c:forEach var="order" items="${orderList}">
									<tr>

										<td>${order.getOrderID()}</td>
										<td>${order.getDealer().getDealerName()}</td>
										<td>${order.getOrderDate().toString().substring(0, 10)}</td>
										<td><c:choose>
												<c:when test="${order.getStatus()==1}">Mới
												</c:when>
												<c:when test="${order.getStatus()==2}">Đang chờ
												</c:when>
												<c:when test="${order.getStatus()==3}">Đã xong
												</c:when>
												<c:when test="${order.getStatus()==4}">Hủy bỏ
												</c:when>
											</c:choose></td>
										<td><a
											href="store_viewOrder?orderID=${order.getOrderID()}">Chi
												tiết</a></td>
										<td>
										<c:choose>
												<c:when test="${order.getStatus()==1}"><a href="store_createExportBill?orderID=${order.getOrderID()}">Tạo phiếu xuất</a>
												</c:when>
												<c:when test="${order.getStatus()==2}"><a href="store_createExportBill?orderID=${order.getOrderID()}">Tạo phiếu xuất</a>
												</c:when>
												<c:otherwise></c:otherwise>
											</c:choose></td>

									</tr>
								</c:forEach>
							</table>
						</div>

					</fieldset>
			</div>


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
