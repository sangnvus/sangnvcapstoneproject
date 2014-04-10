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
			<%@ include file="store_menu.jsp"%>
			<div style="float: left">
				<td>
					<fieldset style="height: 600px; width: 1070px;">

						<div style="margin-top: 15px" id="title">
							<td width="10%">Danh sách đơn hàng</td>
						</div>

						<div style="margin-top: 5px">
							Nhà cung cấp: <select>
								<option value="-1">Nhà cung cấp</option>
								<option>Công Ty sữa mộc châu</option>
								<option>Công Ty sữa Viamilk</option>
								<option>Công Ty sữa bò hải hà</option>
								<option>Công Ty sữa Thụy Sỹ</option>
								<option>Công Ty sữa Đức</option>
							</select>
							<button type="button" value="Goto" onclick='window.location="#"'>Tìm
								kiếm</button>
						</div>

						<div style="margin-top: 10px">
							<table border="1" width="100%">

								<tr bgcolor="#DEB887">
									<td width="5%">Mã</td>
									<td width="25%">Tên nhà cung cấp</td>
									<td width="10%">Thời gian</td>

									<td width="4%">Chi tiết</td>
									<td width="3%">Sửa</td>

								</tr>
								<c:forEach var="importBill" items="${importBillList}"
									varStatus="status">
									<tr>
										<td>${status.count}</td>
										<td>${importBill.supplier.supplierName}</td>
										<td>${importBill.importDate.toString().substring(0, 10)}</td>

										<td><button type="button" value="Goto"
												onclick='window.location="ViewImportBill.html"'>Chi
												tiết</button></td>
										<td><button type="button" value="Goto"
												onclick='window.location="EditImportBill.html"'>Sửa</button></td>
									</tr>
								</c:forEach>
							</table>
							<div>
								<button type="button"
									onclick='window.location="store_createImportBill"'>Nhập
									hàng</button>
							</div>
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
