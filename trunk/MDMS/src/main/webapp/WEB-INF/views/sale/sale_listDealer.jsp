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
				<div id="nav" align="right">
					<%@ include file="../header.jsp"%>
				</div>
				<!-- end nav -->
			</div>
			<!-- end header -->
			<%@ include file="sale_menu.jsp"%>
			<div style="float: left">
				<td>
					<fieldset style="height: 600px; width: 1070px;">

						<div style="margin-top: 15px" id="title">
							<td width="10%">Danh sách đại lý</td>
						</div>
						<form method="get" action="sale_searchDealer">
							<div style="margin-top: 20px">
								<tr>
									<td>Theo tên: <input type="text" name="dealerName"></input></td>
									<td>Trạng thái: <select name="status">
											<option value="2">Tất cả</option>
											<option value="0">Đang hoạt động</option>
											<option value="1">Ngừng hoạt động</option>
									</select></td>
									<td><input type="submit" value="Tìm Kiếm"></input></td>
								</tr>
							</div>
						</form>
						<div style="margin-top: 20px">
							<table id="normalTable" border="1" width="100%">
								<tr bgcolor="#DEB887">
									<th>STT</th>
									<th>Tên đại lý</th>
									<th>Người đại diện</th>
									<th>Địa chỉ</th>
									<th>Điện thoại</th>
									<th>Trạng thái</th>
									<th>Chi tiết</th>
									<th>Sửa</th>
								</tr>
								<c:forEach var="dealer" items="${dealerList}">
									<tr>
										<td><c:out value="${dealer.getDealerID()}"></c:out></td>
										<td><c:out value="${dealer.getDealerName()}"></c:out></td>
										<td><c:out value="${dealer.getViceGerent()}"></c:out></td>
										<td><c:out value="${dealer.getAddress()}"></c:out></td>
										<td><c:out value="${dealer.getPhone()}"></c:out></td>
										<c:choose>
											<c:when test="${dealer.isStatus()==true}">
												<td>Ngừng hoạt động</td>
												<td></td>
												<td><a href='sale_activeDealer?dealerID=${dealer.getDealerID()}'>Kích
														hoạt</a></td>
											</c:when>
											<c:when test="${dealer.isStatus()==false}">
												<td>Đang hoạt động</td>
												<td><a
													href='sale_editDealer?dealerID=${dealer.getDealerID()}'>Sửa</a></td>
												<td><a
													href='sale_deleteDealer?dealerID=${dealer.getDealerID()}'>Xóa</a></td>
											</c:when>
										</c:choose>
									</tr>
								</c:forEach>
							</table>
						</div>
						<form action="sale_createDealer" method="get">
							<div style="margin-top: 10px">
								<input type="submit" value="Thêm Đại Lý" /> <input type="hidden" name="userID" value="<%=user.getUserID()%>" />
							</div>
						</form>
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
