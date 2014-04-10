<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Milk Distributor Management System</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="resources/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="resources/js/validation.js"></script>
<script type="text/javascript">
	function ShowSub(subId, flag) {
		var subMenu = document.getElementById(subId);
		if (flag == true) {
			subMenu.style.visibility = "visible";
		} else {
			subMenu.style.visibility = "hidden";
		}
	}
	function CheckValidate() {
		var inputs = document.forms['create'].getElementsByTagName('input');
		var run_onchange = false;
		function valid() {
			var errors = false;
			var reg_mail = /^[A-Za-z0-9]+([_\.\-]?[A-Za-z0-9])*@[A-Za-z0-9]+([\.\-]?[A-Za-z0-9]+)*(\.[A-Za-z]+)+$/;
			for (var i = 0; i < inputs.length; i++) {
				var value = inputs[i].value;
				var id = inputs[i].getAttribute('id');

			

				// Kiểm tra rỗng

				if (id == 'msp' && value == 'null') {
					span.innerHTML = 'Ban phai nhap thong tin nay';
				}
				// Kiểm tra c&aacute;c trường hợp kh&aacute;c
				if (id == 'email') {
					if (reg_mail.test(value) == false) {
						span.innerHTML = 'Email kh&ocirc;ng hợp lệ (v&iacute; dụ: abc@gmail.com)';
					}
				
				}
			
				if (id == 'gn' && isNaN(value) == true) {
					span.innerHTML = 'Gia nhap phai la chu so';
				}
				if (id == 'gx' && isNaN(value) == true) {
					span.innerHTML = 'Gia nhap phai la chu so';
				}

			}

			// Nếu c&oacute; lỗi th&igrave; ch&egrave;n span v&agrave;o hồ sơ, chạy onchange, submit return false, highlight border
			if (span.innerHTML != '') {
				inputs[i].parentNode.appendChild(span);
				errors = true;
				run_onchange = true;
				inputs[i].style.border = '1px solid #c6807b';
				inputs[i].style.background = '#fffcf9';
			}
		}// end for

		if (errors == false) {
			alert('Đăng k&yacute; th&agrave;nh c&ocirc;ng');
		}
		return !errors;
	}// end valid()

	// Chạy h&agrave;m kiểm tra valid()
	var register = document.getElementById('submit');
	register.onclick = function() {
		return valid();
	}

	// Kiểm tra lỗi với sự kiện onchange -&gt; gọi lại h&agrave;m valid()
	for (var i = 0; i < inputs.length; i++) {
		var id = inputs[i].getAttribute('id');
		inputs[i].onchange = function() {
			if (run_onchange == true) {
				this.style.border = '1px solid #999';
				this.style.background = '#fff';
				valid();
			}
		}

	}
</script>
</head>
<body>
	<form action="store_saveProduct" method="get" name="create"">
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
				<%@ include file="store_menu.jsp" %> 
				<div style="float: left">
					<td>
						<fieldset style="height: 600px; width: 1070px;">

							<div style="margin-top: 15px" id="title">
								<td width="10%">Thêm sản phẩm</td>
							</div>

							<div style="margin-top: 10px; margin-left: 40px">
								<table border="0" width="60%" align="left">

									<tr>
										<td width="5%">Mã sản phẩm</td>
										<td width="25%"><input width="25%" size="20" type="text" class = "inputA"
											name="msp"></input>(*)</td>
									</tr>

									<tr>
										<td width="5%">Tên sản phẩm</td>
										<td width="25%"><input width="25%" size="20" type="text" class = "inputC"
											name="tsp"></input>(*)</td>
									</tr>

									<tr>
										<td width="5%">Kiểu đóng gói</td>
										<td width="25%"><input width="25%" size="20" type="text" style = "width: 136px"
											name="kdg"></input>(*)</td>
									</tr>
									<tr>
										<td width="8%">Loại sản phẩm</td>
										<td width="25%"><select id="category" name="category" class = "inputB">
												<option value="-1">Loại</option>
												<c:forEach var="category" items="${categoryList}">
													<option value="${category.getCategoryID()}"><c:out
															value="${category.getCategoryName()}"></c:out></option>
												</c:forEach>
										</select>(*)</td>
									</tr>

									<tr>
										<td width="5%">Nhà cung cấp</td>
										<td width="25%"><select id="supplier" name="supplier" class = "inputC">
												<option value="-1">Nhà cung cấp</option>
												<c:forEach var="supplier" items="${supplierList}" >
													<option value="${supplier.getSupplierID()}"><c:out
															value="${supplier.getSupplierName()}"></c:out></option>
												</c:forEach>
										</select>(*)</td>
									</tr>

									<tr>
										<td width="5%">Nhà sản xuất</td>
										<td width="25%"><select id="producer" name="producer" class = "inputC">
												<option value="-1">Nhà sản xuất</option>
												<c:forEach var="producer" items="${producerList}">
													<option value="${producer.getProducerID()}"><c:out
															value="${producer.getProducerName()}"></c:out></option>
												</c:forEach>
										</select>(*)</td>
									</tr>

									<tr>
										<td width="5%">Giá nhập</td>
										<td width="25%"><input width="25%" size="20"
											type="number" name="gn" class = "inputB"></input>VND(*)</td>
									</tr>

									<tr>
										<td width="5%">Giá xuất</td>
										<td width="25%"><input width="25%" size="20"
											type="number" name="gx" class = "inputB"></input>VND(*)</td>
									</tr>

									<tr>
										<td width="8%">Mô tả sản phẩm</td>
										<td width="24%"><textarea type="text" name="mtsp" class = "inputE"
											></textarea>(*)</td>
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

		<!-- end wrapper -->
	</form>
</body>
</html>
