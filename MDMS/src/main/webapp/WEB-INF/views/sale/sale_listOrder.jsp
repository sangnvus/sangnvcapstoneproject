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
				<div id="nav" align="right">
					<%@ include file="../header.jsp"%>
				</div>
				<!-- end nav -->
			</div>
			<!-- end header -->
			<div>
				<%@ include file="sale_menu.jsp"%>
			</div>
			<div style="float: left">
				<td>
					<fieldset style="height: 600px; width: 1070px;">
						<div style="margin-top: 15px" id="title">
							<td width="10%">Danh sách đơn hàng</td>
						</div>
						<form action="sale_searchOrder" method="post">
							<div style="margin-top: 15px">
								Tên đại lý: &nbsp;<input type="text" name="search_dealerName">     &nbsp;&nbsp;&nbsp;&nbsp;
								Trạng thái: &nbsp;<select name="status">
									<option value="0">Tất cả</option>
									<option value="1">Mới</option>
									<option value="2">Đang xử lý</option>
									<option value="3">Đã xong</option>
									<option value="4">Hủy bỏ</option>
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
												<c:when test="${order.getStatus()==2}">Đang xử lý
												</c:when>
												<c:when test="${order.getStatus()==3}">Đã xong
												</c:when>
												<c:when test="${order.getStatus()==4}">Hủy bỏ
												</c:when>
											</c:choose></td>
										<td><a
											href="store_viewOrder?orderID=${order.getOrderID()}">Chi
												tiết</a></td>
										<td><a
											href="store_editOrder?orderID=${order.getOrderID()}">Sửa</a></td>

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
