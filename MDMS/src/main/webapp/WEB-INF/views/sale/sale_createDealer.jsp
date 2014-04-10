<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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

	<form action="sale_saveCreateDealer" method="post">	
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
								<td width="10%">Tạo mới đại lý</td>
							</div>
							<div style="margin-top: 15px; margin-left: 40px">
								<table border="0" width="60%" align="left">
									<tr>
										<td width="5%">Tên đại lý</td>
										<td width="25%"><input type="text" name="dealerName" class = "inputC"></input>(*)</td>
									</tr>
									<tr>
										<td width="5%">Điện thoại</td>
										<td width="25%"><input type="" name="homePhone" class = "inputBB"></input>(*)</td>
									</tr>
									<tr>
										<td width="5%">Fax</td>
										<td width="25%"><input type="" name="fax" class = "inputBB"></input></td>
									</tr>
									<tr>
										<td width="5%">E-mail</td>
										<td width="25%"><input type="email" name="email" class = "inputC"></input></td>
									</tr>
									<tr>
										<td width="5%">Địa chỉ</td>
										<td width="25%">&nbsp;</td>
									</tr>
									<tr>
										<td width="5%">&nbsp;&nbsp;Tỉnh - Thành Phố</td>

										<td width="25%"><select name="province" id="province" class = "inputB">
												<option value="-1">Tỉnh-Thành phố</option>
												<c:forEach var="province" items="${provinceList}">
													<option value="${province.getProvinceID()}"><c:out
															value="${province.getProvinceName()}"></c:out></option>
												</c:forEach>
										</select> (*)</td>
									</tr>

									<tr>
										<td width="5%">&nbsp;&nbsp;Quận- Huyện</td>
										<td><select name="district" id="district" class = "inputBB">
										</select> (*)</td>
									</tr>

									<tr>
										<td width="5%">&nbsp;&nbsp;Số nhà</td>
										<td width="25%"><input type="text" name="address" class = "inputC"></input>(*)</td>
									</tr>

									<tr>
										<td width="5%">Mã số thuế</td>
										<td width="25%"><input type="" name="taxCode" class = "inputBB"></input>(*)</td>
									</tr>

									<tr>
										<td width="6%">Giấy phép kinh doanh</td>
										<td width="25%"><input type="" name="businessLicence" class = "inputBB"></input>(*)</td>
									</tr>

									<tr>
										<td width="5%">Đại lý cấp</td>
										<td width="25%"><select name="rank">
												<option value="1">Đại lý cấp 1</option>
												<option value="2">Đại lý cấp 2</option>
												<option value="3">Đại lý cấp 3</option>
										</select></td>
									</tr>

									<tr>
										<td width="5%">Người đại diện</td>
										<td width="25%"><input type="text" name="viceGerent" class = "inputC"></input>(*)</td>
									</tr>

									<tr>
										<td width="5%">Số di động</td>
										<td width="25%"><input type="" name="mobiphone" class = "inputBB"></input></td>
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
