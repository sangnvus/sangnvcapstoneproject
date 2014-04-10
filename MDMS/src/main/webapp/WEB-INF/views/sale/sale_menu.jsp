<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Milk Distributor Management System</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<table width="600" align="center" cellspacing="0" id="menubar">
	<tr>
		<td><a href="sale_listProduct" id="font">Sản phẩm</a></td>

		<td onmouseover="ShowSub('subKhachhang', true);"
			onmouseout="ShowSub('subKhachhang' ,false);"><a href="#"
			id="font">Đại lý</a></td>

		<td onmouseover="ShowSub('subDonhang', true);"
			onmouseout="ShowSub('subDonhang' ,false);"><a href="#" id="font">Đơn
				hàng</a></td>

		<td><a href="#" id="font">&nbsp;</a></td>

		<td><a href="#" id="font">&nbsp;</a></td>

	</tr>
	<tr>
		<td></td>
		<td onmouseover="ShowSub('subKhachhang', true);"
			onmouseout="ShowSub('subKhachhang' ,false);">
			<table id="subKhachhang" class="menu" cellpadding="0">
				<tr>
					<td><a href="sale_listDealer" id="font"> Danh sách đại lý
					</a></td>
				</tr>
				<tr>
					<td><a href="sale_createDealer" id="font"> Thêm đại lý </a></td>
				</tr>
			</table>
		</td>
		<td onmouseover="ShowSub('subDonhang', true);"
			onmouseout="ShowSub('subDonhang' ,false);">
			<table id="subDonhang" class="menu" cellpadding="0">
				<tr>
					<td><a href="sale_listOrder" id="font"> Danh sách đơn hàng
					</a></td>
				</tr>
				<tr>
					<td><a href="sale_createOrder" id="font"> Thêm đơn hàng </a></td>
				</tr>
			</table>
		</td>

	</tr>
</table>
</html>
