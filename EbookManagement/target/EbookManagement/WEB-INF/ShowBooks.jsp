<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link href="../../css/common.css" rel="stylesheet" type="text/css" />
	<link href="../../css/select.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../../js/jquery-1.8.3.js"></script>
<%--<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/common.css"/>--%>
    <script type="text/javascript">
      /*  $(function(){

            $("tbody tr:odd").attr("background","-webkit-repeating-linear-gradient(#fafbbd,#cbb8ff));
            $("tbody tr:odd").attr("background","-webkit-repeating-linear-gradient(#cbb8ff,#fafbbd));
           /!* $("tbody tr:odd").attr("bgColor","#DD1C73");
            $("tbody tr:even").attr("bgColor","#875BE6");*!/
        })*/

	  //获取系统时间
	  function current(){
		  var d=new Date(),str='';
		  str +=d.getFullYear()+'年'; //获取当前年份
		  str +=d.getMonth()+1+'月'; //获取当前月份（0——11）
		  str +=d.getDate()+'日';
		  str +=d.getHours()+'时';
		  str +=d.getMinutes()+'分';
		  //str +=d.getSeconds()+'秒';
		  return str;
	  }
	  setInterval(function(){
		  $("#systime").html(current)
	  },100);
	</script>
<style type="text/css">
   #tbody tr:nth-of-type(odd){ background:-webkit-repeating-linear-gradient(#fafbbd,#cbb8ff);}/*奇数行*/
   #tbody tr:nth-of-type(even){ background:-webkit-repeating-linear-gradient(#9dffd2, #93eafb);}/*偶数行*/
   /*#tbody tr:nth-child(4n+1){ background:#00ccff;}!*从第一行开始算起 每隔4个（包含第四个）使用此样式*!
   #tbody tr:nth-child(4n+2){background:#090;}!*从第二行开始算起 每隔4个（包含第四个）使用次样式*!
   #tbody tr:nth-child(4n+3){background:#009;}!*从第三行开始算起 每隔4个（包含第四个）使用次样式*!*/
                                                                                                                                                                                                                                                  #list00000 li:nth-child(4n+4){background:#990;}从第四行开始算起 每隔4个（包含第四个）使用次样式
</style>
</head>
<body>

<div class="myDiv" id="myDIV" align="center">
	<div class="toolbar2" align="center">
		<table>
	<tr>
		<td><div class="systime"><span id="systime"></span></div></td>
		<td><div class="user"> <span>当前用户，${userSession.name }:${userSession.nickname } </span></div></td>
	</tr>
		</table>
	</div>

    <div class="toolbar1" align="center">


        <table>

            <form method="post" name="serch" action="/book/list">
                <tr>
                    <td class="zi"><span>图书分类:</span></td>
                    <td><select name="choose">
                        <option value="1">书名</option>
                        <option value="2">作者</option>
                        <option value="3">出版社</option>
                        <option value="4">价格</option>
                    </select></td>
                   <td class="zi"><span>关键字：</span></td>
                    <td><input name="likes" type="text" placeholder="与分类关联" value=""/></td>
                    <td><input type="submit" value="查询" class="button"/></td>
                    <td><a href="/book/add"><input type="button" value="新增电子图书" class="button2"/></a></td>
                </tr>
            </form>
        </table>
    </div>

		<table cellpadding="1" cellspacing="1" class="admin-list" border="1">
		<thead>
		<tr>
		<!-- rowspan="5" 跨行 colspan="6"跨咧-->
		<th align="center"  colspan="8"><h1>图书详细信息表</h1></th>
		</tr>
		</thead>
			<thead  class="admin-list-head">
				<tr>
					<th width="15%">书名</th>
					<th width="10%">作者</th>
					<th width="20%">出版社</th>
					<th width="15%">出版日期</th>
					<th width="5%">页数</th>
					<th width="5%">价格</th>
					<th width="20%">内容摘要</th>
					<th width="10%">操作</th>
				</tr>
			</thead>
			<tbody id="tbody" >
			<c:forEach items="${bookList}" var="book" varStatus="status">
			<tr>
					<td>《${book.bname }》</td>
					<td>${book.bauthor }</td>
					<td>${book.publish }</td>
					<%--<td>${book.publishdate }</td>--%>
                    <td name="publishdate" id="rtime">
                     <span>
                     <%-- <fmt:formatDate value="${book.publishdate  }" pattern="yyyy-MM-dd HH:mm:ss"/>--%>
						  <fmt:formatDate value="${book.publishdate  }" pattern="yyyy-MM-dd"/>
                      </span>
                </td>
					<td>${book.page}</td>
					<td>${book.prices }</td>
					<td>${book.content}</td>
					<td><a href="/book/modifyByid?id=${book.id}">修改</a>
                        <a href="javascript:if(confirm('确认是否删除此书信息？'))
					location='<%=request.getContextPath()%>/book?b_Id=${book.id}'">删除</a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
			<tfoot class="admin-list-foot">
			<tr>
			<td colspan="8" height="30px"><a href="/book/luck" class="luck"> 幸 运 大 抽 奖 </a></td>
			</tr>
			</tfoot>
		</table>
		<div>${type}</div>

<%--
<div class="pagin">
    <div class="message">共<i class="blue">${pages.totalCount }</i>条记录，当前显示第&nbsp;<i class="blue">${pages.currentPageNo }</i>页</div>
    <ul class="paginList">
        <li class="paginItem"><a href="/ruzhunxx/list?pageIndex=${pages.currentPageNo-1}"><span class="pagepre">《</span></a></li>
        <c:forEach begin="1" end="${pages.totalPageCount }" varStatus="status">
            <li class="paginItem"><a href="/ruzhunxx/list?pageIndex=${status.index}">${status.index}</a></li>
        </c:forEach>
        <li class="paginItem"><a href="/ruzhunxx/list?pageIndex=${pages.currentPageNo+1}"><span class="pagenxt">》</span></a></li>
    </ul>
</div>
--%>

    <div class="page-bar">
        <ul class="page-num-ul clearfix">
            <li>共${pages.totalCount }条记录&nbsp;&nbsp;
                ${pages.currentPageNo}/${pages.totalPageCount}页</li>&nbsp;&nbsp;
            <c:if test="${pages.totalPageCount > 1 }">
                <a href="/book/list?pageIndex=1">首页</a>&nbsp;
                <a href="/book/list?pageIndex=${pages.currentPageNo - 1}">上一页</a>&nbsp;
            </c:if>
            <c:if test="${pages.currentPageNo < pages.totalPageCount}">
                <a href="/book/list?pageIndex=${pages.currentPageNo + 1}">下一页</a>&nbsp;
                <a href="/book/list?pageIndex=${pages.totalPageCount}">最后一页</a>&nbsp;&nbsp;
            </c:if>
        </ul>
        <span class="page-go-form"><label>跳转至</label> <input
                type="text" name="inputPage" id="inputPage" class="page-key" />页
						<button type="button" class="page-btn"
                                onClick='jump_to(document.forms[0],document.getElementById("inputPage").value)'>GO</button>
		</span>
    </div>
		<hr style="margin-bottom: 20px"/>
</div>
</body>
</html>