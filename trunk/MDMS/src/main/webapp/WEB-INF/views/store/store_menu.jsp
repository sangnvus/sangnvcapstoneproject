<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Milk Distributor Management System</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<table width="600" align="center" cellspacing="0" id="menubar">
	<tr>

		<td onmouseover="ShowSub('subSanpham', true);"
			onmouseout="ShowSub('subSanpham' ,false);"><a
			href="store_listProduct" id="font">Sản phẩm</a></td>

		<td onmouseover="ShowSub('subDonhang', true);"
			onmouseout="ShowSub('subDonhang' ,false);"><a href="#" id="font">Đơn
				hàng</a></td>

		<td onmouseover="ShowSub('subDaily', true);"
			onmouseout="ShowSub('subDaily' ,false);"><a
			href="sale_listDealer" id="font">Đại lý</a></td>

		<td><a href="store_listSupplier" id="font">Nhà cung cấp</a></td>

		<td><a href="#" id="font">Báo cáo</a></td>

	</tr>
	<tr>
		<td onmouseover="ShowSub('subSanpham', true);"
			onmouseout="ShowSub('subSanpham' ,false);">
			<table id="subSanpham" class="menu" cellpadding="0">
				<tr>
					<td><a href="store_createProduct" id="font"> Thêm sản phẩm
					</a></td>

				</tr>
				<tr>
					<td><a href="store_listImportBill" id="font">Quản lý nhập
							hàng</a></td>
				</tr>
			</table>
		</td>
		<td onmouseover="ShowSub('subDonhang', true);"
			onmouseout="ShowSub('subDonhang' ,false);">
			<table id="subDonhang" class="menu" cellpadding="0">
				<tr>
					<td><a href="store_listOrder" id="font"> Danh sách đơn
							hàng </a></td>
				</tr>
			</table>
		</td>
		<td onmouseover="ShowSub('subDaily', true);"
			onmouseout="ShowSub('subDaily' ,false);">
			<table id="subDaily" class="menu" cellpadding="0">
				<tr>
					<td><a href="store_listDealer" id="font"> Quản lý đại lý</a></td>
				</tr>
			</table>
		</td>

	</tr>
</table>
</html>