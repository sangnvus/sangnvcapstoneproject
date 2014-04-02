
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Milk Distributor Management System</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
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
					<img src="images/logo.gif" width="519" height="63"
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
								<td><a href="CreateOrder.html" id="font"> Thêm đơn hàng
								</a></td>
							</tr>
						</table>
					</td>

				</tr>
			</table>
			<div style="float: left">
				<td>
					<fieldset style="height: 600px; width: 1070px;">

						<div style="margin-top: 10px" id="title">
							<td width="10%">Danh sách đại lý</td>
						</div>

						<div style="margin-top: 15px">
							Theo Tên <input type="text" name="tkten"> <select>
								<option value="Seller">Đang hoạt động</option>
								<option value="Storemanager">Ngừng hoạt động</option>
							</select>
							<button type="button">Tìm kiếm</button>

						</div>
						<div style="margin-top: 20px">
							<table border="1" width="100%">

								<tr bgcolor="#DEB887">
									<td width="3%">Mã</td>
									<td width="20%">Tên đại lý</td>
									<td width="18%">Người đại diện</td>
									<td width="25%">Địa chỉ</td>

									<td width="10%">Điện thoại</td>


									<td width="8%">Hoạt động</td>
									<td width="7%">Chi tiết</td>
									<td width="4%">Sửa</td>
								</tr>

								<c:forEach var="dealer" items="${dealerList}">
									<tr>
										<td><c:out value="${dealer.getDealerID()}"></c:out></td>
										<td><c:out value="${dealer.getDealerName()}"></c:out></td>
										<td><c:out value="${dealer.getViceGerent()}"></c:out></td>
										<td><c:out value="${dealer.getAddress()}"></c:out></td>
										<td><c:out value="${dealer.getPhone()}"></c:out></td>
										<c:set var="status" value="${dealer.isStatus()}"></c:set>
										<c:if test="${ status== true}">
											<td>Đang hoạt động</td>
										</c:if>
										<c:if test="${ status== false}">
											<td>Ngừng hoạt động</td>
										</c:if>
										<td><input type="button" value="Chi tiết"></td>
										<td><input type="button" value="Sửa"></td>
									</tr>
								</c:forEach>
							</table>
						</div>
						<div style="margin-top: 15px">
							<button type="button" value="Goto"
								onclick='window.location="CreateDealer.html"'>Thêm đại
								lý</button>
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
