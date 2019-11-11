<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script type="text/javascript" src="/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	$(function(){
		$("#dataFrm").submit(function() {
			/* alert("asdfvb");

 				alert(1+"1");
 				var num=[1,2];
 				alert(num);
 				int q;
 				alert(q); */
		 	var bname=$("#bname").val();
				var bauthor=$("#bauthor").val();
				var publishdate=$("#publishdate").val();
				var publish=$("#publish").val();
				if(bname==""){
				/* alert(parseFloat(abc123.23)); */
				alert("图书名称不能为空！");
					return false;
				} 
				if(bauthor==""){
					alert("作者不能为空！");
					return false;
				} 
				
				/* var $time=/^(\d{2,4})(-|\/)(\d{1,2})\2(\d{1,2})$/; */
				 var $time=/^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
				if(publishdate==""){
					alert("日期不能为空！");
					return false;
				} 
				if(!publishdate.match($time)){
					alert("日期格式不正确！");
					return false;
				}
				if(!$time.text(publishdate)){
					alert("日期格式不正确！");
					return false;
				} 
				/*if(b_type=="选择所属分类"){
					alert("请选择图书分类");
					return false;
				} */
				return true;
		});
	});
</script>
</head>

<body>
<div class="divAdd" align="center">
		<form name="dataFrm" id="dataFrm" action="/book/addmodify" method="post">
            <%----%>
            <input type="hidden" id="id" name="id"value="${book.id}" />
			<table  cellpadding="1" cellspacing="1" class="admin-list"  border="1">
				<tr>
				<td colspan="3" style="text-align: center;"><h2>修改图书信息</h2></td>
				</tr>
				<tr>
					<td style="text-align: right;" class="text_tabledetail2">书名：</td>
					<td style="text-align: left;"align="center"><input type="text"id="bname" name="bname"value="${book.bname}" /><span class="span">(*)</span></td>
				</tr>
				<tr>
					<td style="text-align: right;" class="text_tabledetail2">图书作者：</td>
					<td style="text-align: left;"><input type="text" id="bauthor" name="bauthor"value="${book.bauthor}" /><span class="span">(*)</span></td>
				</tr>
				<tr>
					<td style="text-align: right;" class="text_tabledetail2">出版社：</td>
					<td style="text-align: left;"><input type="text" id="publish" name="publish"value="${book.publish}" /><span class="span">(*)</span></td>
				</tr>
				<tr>
					<td style="text-align: right;" class="text_tabledetail2">出版日期：</td><%-- 记住要导入包--%>
					<td style="text-align: left;"><input type="text" id="publishdate" name="publishdate"value="<fmt:formatDate value="${book.publishdate  }" pattern="yyyy-MM-dd"/>" /><span class="span">(*)</span><span>yyyyMMdd格式</span></td>
					<%--<td style="text-align: left;">yyyyMMdd格式</td>--%>
				</tr>
				<tr>
					<td style="text-align: right;" class="text_tabledetail2">页数：</td>
					<td style="text-align: left;"><input type="text" id="Page" name="Page"value="${book.page}" /></td>
				</tr>
				<tr>
					<td style="text-align: right;" class="text_tabledetail2">价格：</td>
					<td style="text-align: left;"><input type="text" id="prices" name="prices"value="${book.prices}" /></td>
				</tr>
				<tr>
					<td style="text-align: right;" class="text_tabledetail2">内容摘要：</td>
					<td style="text-align: left;" class="text_tabledetail2"><textarea rows="2" cols="20" id="Content" name="Content"value="">${book.content}</textarea></td>
				</tr>
				<%--<tr>
					<td style="text-align: right;" class="text_tabledetail2">内容摘要：</td>
					<td style="text-align: left;" class="text_tabledetail2"><select id="b_type" name="b_type">
						<c:forEach var="sa" items="${ary}" varStatus="s">
							<option value="${s.index}">${sa}</option>
						</c:forEach>
					</select></td>

				</tr>--%>
				<tr>
				<td style="text-align:center;" colspan="3" height="30px">
					<button type="submit" class="page-btn" name="save" >修改</button>
					<button type="reset" class="page-btn" name="">重置</button>
					<button type="button" class="page-btn" name="return" onclick="javascript:history.back(-1)">返回</button>
				</td>
			</tr>
			</table>
		</form>
	</div>
</body>
</html>