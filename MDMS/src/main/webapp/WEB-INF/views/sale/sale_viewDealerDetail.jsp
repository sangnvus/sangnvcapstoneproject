<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
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

	<form action="sale_editDealer" method="get">		 <input
			type="hidden" name="dealerID" value="${dealer.getDealerID() }"></input>
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
				<%@ include file="sale_menu.jsp" %> 
				<div style="float: left">
					<td>
						<fieldset style="height: 600px; width: 1070px;">

							<div style="margin-top: 15px" id="title">
								<td width="10%">Thông tin đại lý</td>
							</div>
							<div style="margin-top: 15px; margin-left: 40px">
								<table border="0" width="60%" align="left">
									<tbody>
										<tr>
											<td width="5%">Tên đại lý</td>
											<td width="25%"><input type="text"
												value="${dealer.getDealerName() }"></input></td>
										</tr>
										<tr>
											<td width="5%">Điện thoại</td>
											<td width="25%"><input type="text"
												value="${dealer.getPhone() }"></input></td>
										</tr>
										<tr>
											<td width="5%">Fax</td>
											<td width="25%"><input type="text"
												value="${dealer.getFax()}"></input></td>
										</tr>
										<tr>
											<td width="5%">E-mail</td>
											<td width="25%"><input type="text"
												value="${dealer.getEmail()}"></input></td>
										</tr>
										<tr>
											<td width="5%">Địa chỉ</td>
											<td width="25%">&nbsp;</td>
										</tr>
										<tr>
											<td width="5%">&nbsp;&nbsp;Tỉnh - Thành Phố</td>

											<td width="25%"><input type="text"
												value="${dealer.getDistrict().getProvince().getProvinceName() }"></input></td>
										</tr>

										<tr>
											<td width="5%">&nbsp;&nbsp;Quận- Huyện</td>
											<td><input type="text"
												value="${dealer.getDistrict().getDistrictName() }"></input></td>
										</tr>

										<tr>
											<td width="5%">&nbsp;&nbsp;Số nhà</td>
											<td width="25%"><input type="text" disabled="disabled"
												value="${dealer.getAddress()}"></input></td>
										</tr>

										<tr>
											<td width="5%">Mã số thuế</td>
											<td width="25%"><input type="text" disabled="disabled"
												value="${dealer.getTaxCode()}"></input></td>
										</tr>

										<tr>
											<td width="6%">Giấy phép kinh doanh</td>
											<td width="25%"><input type="text" disabled="disabled"
												value="${dealer.getBusinessLicenseCode()}"></input></td>
										</tr>
										<tr>
											<td width="6%">Trạng thái:</td>
											<td width="25%"><c:choose>
													<c:when test="${dealer.isStatus()==false}">
														<input type="text" disabled="disabled"
															value="Đang hoạt động"></input>
													</c:when>
													<c:when test="${dealer.isStatus()==true}">
														<input type="text" disabled="disabled"
															value="Ngừng hoạt động"></input>
													</c:when>
												</c:choose></td>
										</tr>

										<tr>
											<td width="5%">Đại lý cấp</td>
											<td width="25%"><input type="text"
												value="${dealer.getDealerRank()}" disabled="disabled"></input></td>
										</tr>

										<tr>
											<td width="5%">Người đại diện</td>
											<td width="25%"><input type="text" disabled="disabled"
												value="${dealer.getViceGerent() }"></input></td>
										</tr>

										<tr>
											<td width="5%">Số di động</td>
											<td width="25%"><input type="text" disabled="disabled"
												value="${dealer.getMobilePhone() }"></input></td>
										</tr>

										<tr>
											<td width="5%"&nbsp;></td>
											<td width="25%"><input type="submit" value="Sửa"></input>
												<button type="button" onclick="history.go(-1);">Hủy
													bỏ</button></td>
										</tr>
									</tbody>
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
	</form>
</body>
</html>
