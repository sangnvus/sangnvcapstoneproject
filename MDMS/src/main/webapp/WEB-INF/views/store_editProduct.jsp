<%@page import="fu.mdms.model.Product"%>
<%@page import="fu.mdms.dao.impl.ProductDaoImpl"%>
<%@page import="fu.mdms.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
<%
	ProductDao productDao = new ProductDaoImpl();
	Product product = (Product) session.getAttribute("product");
%>
<body>
	<form action="store_saveEditProduct" method="post">
	<input  type="hidden" name="productID" value="${product.getProductID() }"/>
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
									<td><a href="ListImportBill.html" id="font">Nhập hàng</a>
									</td>
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
								<td width="10%">Thêm sản phẩm</td>
							</div>

							<div style="margin-top: 10px; margin-left: 40px">
								<table border="0" width="60%" align="left">

									<tr>
										<td width="5%">Mã sản phẩm</td>
										<td width="25%" ><input width="25%" size="20" type="text" class ="inputE"
											name="msp" value="${product.getProductCode()}"></input>(*)</td>
									</tr>

									<tr>
										<td width="5%">Tên sản phẩm</td>
										<td width="25%"><input width="25%" size="20" type="text" class ="inputE"
											name="tsp" value="${product.getProductName()}"></input>(*)</td>
									</tr>

									<tr> 
										<td width="5%">Kiểu đóng gói</td>
										<td width="25%"><input width="25%" size="20" type="text" class ="inputE"
											name="kdg" value="${product.getPackagedType()}"></input>(*)</td>
									</tr>
									<tr>
										<td width="8%">Loại sản phẩm</td>
										<td width="25%"><select id="category" name="category" class ="inputE">
												
												<c:forEach var="category" items="${categoryList}">
													<option value="${category.getCategoryID()}"><c:out
															value="${category.getCategoryName()}"></c:out></option>
												</c:forEach>

										</select>(*)</td>
									</tr>

									<tr>
										<td width="5%">Nhà cung cấp</td>
										<td width="25%"><select id="supplier" name="supplier" class ="inputE">
												<c:forEach var="supplier" items="${supplierList}">
													<option value="${supplier.getSupplierID()}"><c:out
															value="${supplier.getSupplierName()}"></c:out></option>
												</c:forEach>

										</select>(*)</td>
									</tr>

									<tr>
										<td width="5%">Nhà sản xuất</td>
										<td width="25%"><select id="producer" name="producer" class ="inputE">
												<c:forEach var="producer" items="${producerList}">
													<option value="${producer.getProducerID()}"><c:out
															value="${producer.getProducerName()}"></c:out></option>
												</c:forEach>

										</select>(*)</td>
									</tr>

									<tr>
										<td width="5%">Giá nhập</td>
										<td width="25%"><input width="25%" size="20" class ="inputE"
											type="number" name="gn"  value="${product.getImportPrice()}"></input>VND(*)</td>
									</tr>

									<tr>
										<td width="5%">Giá xuất</td>
										<td width="25%"><input width="25%" size="20" class ="inputE"
											type="number" name="gx" value="${product.getExportPrice()}"></input>VND(*)</td>
									</tr>

									<tr>
										<td width="8%">Mô tả sản phẩm</td>
										<td width="24%"><textarea  class ="inputE" name="mtsp" value="${product.getDescription()}"
											style="height: 50px; width: 248px;"></textarea>(*)</td>
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
