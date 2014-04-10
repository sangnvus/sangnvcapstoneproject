<%@page import="fu.mdms.model.User"%>
<%@page import="fu.mdms.dao.impl.UserDaoImpl"%>
<%@page import="fu.mdms.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Milk Distributor Management System</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<%
	UserDao userDao = new UserDaoImpl();
	User user = (User) session.getAttribute("user");
%>
	Xin chào <a href="changeUserInformation?userID=${user.getUserID()}">
		<font color="Blue"><%=user.getUserName()%></font>
	</a> | <a href=""><font color="Blue">Đăng xuất</font></a>
	<input type="hidden" name="userID" value="<%=user.getUserID()%>" />
</html>
