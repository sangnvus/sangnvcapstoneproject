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
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$('#province').change(
						function() {
							//ajax
							$.ajax({
								url : '/controller/changeCity',
								type : 'GET',
								data : 'province=' + $('#province').val(),
								dataType : 'json',
								success : function(data, textStatus, xhr) {
									$('#district option').remove();
									for ( var key in data) {
										$('#district').append(
												'<option value="' + key + '">'
														+ data[key]
														+ '</option>');
									}
								},
								error : function(xhr, textStatus, errorThrown) {
									alert(xhr);
									alert(textStatus);
									alert(errorThrown);
								}
							});
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

	<form action="store_saveEditSupplier" method="post">
		<input type="hidden" name="supplierID"
			value="${supplier.getSupplierID() }">
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
					<%@ include file="store_menu.jsp"%>
				</div>
				<div style="float: left">
					<td>
						<fieldset style="height: 600px; width: 1070px;">

							<div style="margin-top: 15px" id="title">
								<td width="10%">Sửa thông tin nhà cung cấp</td>
							</div>
							<div style="margin-top: 15px; margin-left: 40px">
								<table border="0" width="60%" align="left">
									<tr>
										<td width="5%">Tên công ty</td>
										<td width="25%"><input type="text" name="supplierName" class = "inputC"
											value="${supplier.getSupplierName() }"></input>(*)</td>
									</tr>

									<tr>
										<td width="5%">Mã số thuế</td>
										<td width="25%"><input type="text" name="taxCode" class = "inputBB"
											value="${supplier.getTax() }"></input>(*)</td>
									</tr>

									<tr>
										<td width="6%">Giấy phép kinh doanh</td>
										<td width="25%"><input type="text" name="businessLicence" class = "inputBB"
											value="${supplier.getBusinessLicenseCode() }"></input>(*)</td>
									</tr>
									<tr>
										<td width="5%">Điện thoại</td>
										<td width="25%"><input type="text" name="homePhone" class = "inputBB"
											value="${supplier.getPhone() }"></input>(*)</td>
									</tr>
									<tr>
										<td width="5%">Fax</td>
										<td width="25%"><input type="text" name="fax" class = "inputBB"
											value="${supplier.getFax() }"></input>(*)</td>
									</tr>
									<tr>
										<td width="5%">E-mail</td>
										<td width="25%"><input type="email" name="email" class = "inputC"
											value="${supplier.getEmail() }"></input>(*)</td>
									</tr>
									<tr>
										<td width="5%">Địa chỉ</td>
										<td width="25%">&nbsp;</td>
									</tr>
									<tr>
										<td width="5%">Tỉnh-Thành phố</td>
										<td width="25%"><select id="province" name="province" class = "inputBB">
												<option value="-1">Tỉnh-Thành phố</option>

												<c:forEach var="province" items="${provinceList}">
													<c:choose>
														<c:when
															test="${province.getProvinceID().equals(supplier.getDistrict().getProvince().getProvinceID()) }">
															<option value="${province.getProvinceID()}"
																selected="selected"><c:out
																	value="${province.getProvinceName()}"></c:out></option>
														</c:when>
														<c:otherwise>
															<option value="${province.getProvinceID()}"><c:out
																	value="${province.getProvinceName()}"></c:out></option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
										</select> (*)</td>

									</tr>
									<tr>
										<td width="5%">Quận- Huyện</td>
										<td width="25%"><select id="district" name="district" class = "inputBB">
												<option>Quận huyện</option>
												<c:forEach var="district" items="${districtList}">
													<c:choose>
														<c:when
															test="${district.getDistrictID().equals(supplier.getDistrict().getDistrictID()) }">
															<option value="${district.getDistrictID()}"
																selected="selected"><c:out
																	value="${district.getDistrictName()}"></c:out></option>
														</c:when>
														<c:otherwise>
															<option value="${district.getDistrictID()}"><c:out
																	value="${district.getDistrictName()}"></c:out></option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
										</select>(*)</td>
									</tr>

									<tr>
										<td width="5%">&nbsp;&nbsp;Số nhà</td>
										<td width="25%"><input type="text" name="address" class = "inputC"
											value="${supplier.getAddress() }"></input>(*)</td>
									</tr>
									<tr>
										<td width="5%"&nbsp;></td>
										<td width="25%"><input type="submit" value="Lưu"></input>
											<button type="button" onclick="history.go(-1);">Hủy
												bỏ</button></td>
									</tr>
								</table>
							</div>

						</fieldset>
					</td>

				</div>
			</div>
		</div>

	</form>
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
