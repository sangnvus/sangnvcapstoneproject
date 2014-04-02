<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>
	<form action="login" method="post">
		<table align="center">
			<tr>
				<td align="left">Tên Đăng Nhập:</td>
				<td><input type="text" name="userName"></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="text" name="passWord"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Login"></td>
			</tr>
		</table>
	</form>
	<a href="createOrder">Create Order</a>
	<br>
	<a href="listDealer">List Dealer</a>
	<br>
	<a href="listProduct">List Product</a>
	<br>
	<a href="listImportBill">List ImportBill</a>
	<br>
	<a href="testListDealer">Test List Dealer</a> <br>
	<a href="createDealer">Thêm Đại lý</a>
	<br/>
	<a href="store_listOrder">Danh sách đơn hàng(Dealer)</a>
	<br><a href="testUser">test user</a>
	<br>
</body>
</html>
