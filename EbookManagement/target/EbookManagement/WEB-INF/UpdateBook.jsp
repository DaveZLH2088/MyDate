<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common.css" />
<style type="text/css">
</style>
</head>
<body>
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#dataFrm").submit(
			function() {
				alert("asdfvb");
				var b_name = $("#b_name").val();
				var b_author = $("#b_author").val();
				var b_time = $("#b_time").val();
				var b_type = $("#b_type").val();
				if (b_name == "") {
				alert("图书名称不能为空！");
				return false;
				}
				if (b_author == "") {
				alert("作者不能为空！");
				return false;
		}

								/* var $time=/^(\d{2,4})(-|\/)(\d{1,2})\2(\d{1,2})$/; */
		var $time = /^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
	if (b_time == "") {
	alert("日期不能为空！");
	return false;
		}
		if (!b_time.match($time)) {
		alert("日期格式不正确！");
				return false;
					}
			if (!$time.text(b_time)) {
			alert("日期格式不正确！");
			return false;
			}
		if (b_type == 0) {
			alert("请选择图书分类");
		return false;
		}
		return true;
		});
});
	</script>

	<%-- <%
		List<StudentInfo> list = (List<StudentInfo>) request
				.getAttribute("list");
		if (list == null || list.size() == 0) {

			request.getRequestDispatcher("SelectChooseId").forward(request,
					response);
		}
	%> --%>
	<div class="divAdd">
		<form name="dataFrm" id="dataFrm"
			action="UpdateBooks?b_Id=${lista.b_Id}" method="post">
			<table cellpadding="1" cellspacing="1" class="admin-list"
				border="1px">
				<tr>
					<td colspan="2" style="text-align: center;"><h2>修改图书信息</h2></td>
				</tr>
				<tr>
					<td style="text-align: left;" class="text_tabledetail2">图书名称：</td>
					<td style="text-align: left;"><input type="text" id="b_name"
						name="b_name" value="${lista.b_name}" /></td>
				</tr>
				<tr>
					<td style="text-align: left;" class="text_tabledetail2">作者：</td>
					<td style="text-align: left;"><input type="text" id="b_author"
						name="b_author" value="${lista.b_author}" /></td>
				</tr>
				<tr>
					<td style="text-align: left;" class="text_tabledetail2">购买时间：</td>
					<td style="text-align: left;"><input type="text" id="b_time"
						name="b_time" value="${lista.b_time}" /></td>
				</tr>
				<tr>
					<td style="text-align: left;" class="text_tabledetail2">图书分类：</td>
					<td style="text-align: left;"><input type="text" id="b_type"
						name="b_type" value="${lista.b_type}" /></td>
				</tr>
				<tr>
					<td style="text-align: center;" class="text_tabledetail2"
						colspan="2">选择所属分类：1、计算机软件：2、小说/文摘：3、杂项：</td>

				</tr>
				<tr>
					<td style="text-align: center;" colspan="2">
						<button type="submit" class="page-btn" name="save">修改</button>
						<button type="reset" class="page-btn" name="">重置</button>
						<button type="button" class="page-btn" name="return"
							onclick="javascript:location.href='ShowBooks.jsp'">返回</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>