<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Milk Distributor Management System</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="resources/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	var counter = 0;
	window.setInterval("refreshDiv()", 1000);
	function refreshDiv() {
		counter = counter + 1;
		document.getElementById("test").innerHTML = "Testing " + counter;
	}
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
					<td><a href="listProduct" id="font">Sản phẩm</a></td>

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
								<td><a href="listDealer" id="font"> Danh sách đại
										lý </a></td>
							</tr>
							<tr>
								<td><a href="createDealer" id="font"> Thêm đại lý
								</a></td>
							</tr>
						</table>
					</td>
					<td onmouseover="ShowSub('subDonhang', true);"
						onmouseout="ShowSub('subDonhang' ,false);">
						<table id="subDonhang" class="menu" cellpadding="0">
							<tr>
								<td><a href="store_orderList" id="font"> Danh sách đơn
										hàng </a></td>
							</tr>
							<tr>
								<td><a href="createOrder" id="font"> Thêm đơn hàng
								</a></td>
							</tr>
						</table>
					</td>

				</tr>
			</table>
			<div style="float: left">
				<td>
					<fieldset style="height: 600px; width: 1070px;">

						<div style="margin-top: 15px" id="title">
							<td width="10%">Tạo mới đại lý</td>
						</div>


						<div style="margin-top: 15px; margin-left: 40px">
							<table border="0" width="60%" align="left">


								<tr>
									<td width="5%">Tên đại lý</td>
									<td width="25%"><input type="text" name="tenDaily"></input>(*)</td>
								</tr>

								<tr>
									<td width="5%">Điện thoại</td>
									<td width="25%"><input type="" name="dienThoai"></input>(*)</td>
								</tr>

								<tr>
									<td width="5%">Fax</td>
									<td width="25%"><input type="" name="fax"></input></td>
								</tr>

								<tr>
									<td width="5%">E-mail</td>
									<td width="25%"><input type="email" name="email"></input></td>
								</tr>

								<tr>
									<td width="5%">Địa chỉ</td>
									<td width="25%">&nbsp;</td>
								</tr>

								<tr>
									<td width="5%">&nbsp;&nbsp;Tỉnh - Thành Phố</td>

									<td width="25%"><select name="tinhThanhPho">
											<option value="-1">Tỉnh/Thành phố</option>
											<c:forEach var="province" items="${provinceList}">
												<option value="${province.getProvinceId()}"><c:out
														value="${province.getProvinceName()}"></c:out></option>
											</c:forEach>
									</select> (*)</td>
								</tr>

								<tr>
									<td width="5%">&nbsp;&nbsp;Quận- Huyện</td>
									<td><select name="quanHuyen">
											<option value="-1">Quận/Huyện</option>
											<option value="1">Ba Đình</option>
											<option value="2">Bắc Từ Liêm</option>
											<option value="3">Cầu Giấy</option>
											<option value="4">Đống Đa</option>
											<option value="5">Hà Đông</option>
											<option value="6">Hai Bà Trưng</option>
											<option value="7">Hoàn Kiếm</option>
											<option value="8">Hoàn Kiếm</option>
											<option value="9">Long Biên</option>
											<option value="10">Hoàng Mai</option>
											<option value="2">Thanh Xuân</option>
											<option value="2">Tây Hồ</option>
									</select> (*)</td>
								</tr>

								<tr>
									<td width="5%">&nbsp;&nbsp;Số nhà</td>
									<td width="25%"><input type="text" name="soNha"></input>(*)</td>
								</tr>

								<tr>
									<td width="5%">Mã số thuế</td>
									<td width="25%"><input type="" name="mst"></input>(*)</td>
								</tr>

								<tr>
									<td width="6%">Giấy phép kinh doanh</td>
									<td width="25%"><input type="" name="gp"></input>(*)</td>
								</tr>

								<tr>
									<td width="5%">Đại lý cấp</td>
									<td width="25%"><select>
											<option value="c1">1</option>
											<option value="c2">2</option>
											<option value="c3">3</option>
									</select></td>
								</tr>

								<tr>
									<td width="5%">Người đại diện</td>
									<td width="25%"><input type="text" name="ten"></input>(*)</td>
								</tr>

								<tr>
									<td width="5%">Số di động</td>
									<td width="25%"><input type="" name="sdt"></input></td>
								</tr>

								<tr>
									<td width="5%"&nbsp;></td>
									<td width="25%"><button type="button" value="Goto"
											onclick='window.location="ListDealer.html"'>Lưu</button>
										<button type="button" value="Goto"
											onclick='window.location="ListDealer.html"'>Hủy bỏ</button></td>
								</tr>
							</table>
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
