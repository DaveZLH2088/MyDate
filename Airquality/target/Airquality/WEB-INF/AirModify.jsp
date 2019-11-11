<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
		/*  $(function(){

              $("tbody tr:odd").attr("background","-webkit-repeating-linear-gradient(#fafbbd,#cbb8ff));
              $("tbody tr:odd").attr("background","-webkit-repeating-linear-gradient(#cbb8ff,#fafbbd));
             /!* $("tbody tr:odd").attr("bgColor","#DD1C73");
              $("tbody tr:even").attr("bgColor","#875BE6");*!/
          })*/

		//获取系统时间
		function current(){
			var d=new Date(),str='';
			str +=d.getFullYear()+'-'; //获取当前年份
			str +=d.getMonth()+1+'-'; //获取当前月份（0——11）
			str +=d.getDate()+' ';
			str +=d.getHours()+':';
			str +=d.getMinutes()+':';
			str +=d.getSeconds();
			return str;
		}
		setInterval(function(){
			$("#systime").html(current)
			$("#systime").html(current)
		},100);
	</script>
<script type="text/javascript">
	$(function(){
		/*alert("进入function！")*/
		$("#dataFrm").submit(function() {
			/*alert("进入dataFrm！")*/
			/* alert("asdfvb");

 				alert(1+"1");
 				var num=[1,2];
 				alert(num);
 				int q;
 				alert(q); */
		 	var district_id=$("#district_id").val();
            var pm10=$("#pm10").val();
				var pm25=$("#pm25").val();
				var monitor_time=$("#monitor_time").val();
				var monitoring_station=$("#monitoring_station").val();
				if(district_id==0){
				/* alert(parseFloat(abc123.23)); */
				alert("请选择监测区域！");
					return false;
				} 

				/* var $time=/^(\d{2,4})(-|\/)(\d{1,2})\2(\d{1,2})$/; */
				 var $time=/^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
				if(monitor_time==""){
					alert("监测日期不能为空！");
					return false;
				}

			if(pm10==""){
				alert("PM10不能为空！");
				return false;
			}
			if(pm25==""){
				alert("PM2.5不能为空！");
				return false;
			}
			if(monitoring_station==""){
				alert("监测站不能为空！");
				return false;
			}
				if(!monitor_time.match($time)){
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

		/*Ajax删除*/
		$("#delete").click(function(){
			/*获取参数id*/
			var id=$("#id").val();
			$.ajax({
				type:"GET",
				url:"/airquality/deleteAirById.html",
				data:{id:id},
				dataType:"json",
				success:function(data){
					if(data== "true"){//删除成功：移除删除行
						alert("删除成功！")
						window.location.href = '/airquality/list';
					}else{ //删除失败
						alert("对不起，删除失败路噢哟！")
					}
				},
				error:function(data) {
					alert("对不起，删除失败");
				}
			})
		})
	});
</script>
</head>

<body>
<div class="divAdd" align="center">
		<form name="dataFrm" id="dataFrm" action="/airquality/addmodify" method="post">
			<table  cellpadding="1" cellspacing="1" class="admin-list"  border="1">
				<tr>
				<td colspan="3" style="text-align: center;"><h2>空气质量信息维护页面</h2><input id="id" name="id" type="hidden" value="${air.id}">
					<input name="ids" type="hidden" value="${air.district_id}"></td>
				</tr>
				<tr>
					<td style="text-align: right;" class="text_tabledetail2">监测区域：</td>
					<td style="text-align: left;"><select name="district_id" id="district_id" style="width:90px">
						<option value="0">请选择</option>
						<option value="1" <c:if test="${air.district_id==1}">selected="selected"</c:if>>东城区</option>
						<option value="2" <c:if test="${air.district_id==2}">selected="selected"</c:if>>西城区</option>
						<option value="3" <c:if test="${air.district_id==3}">selected="selected"</c:if>>南城区</option>
						<option value="4" <c:if test="${air.district_id==4}">selected="selected"</c:if>>北城区</option>
						<option value="5" <c:if test="${air.district_id==5}">selected="selected"</c:if>>朝阳区</option>
						<option value="6" <c:if test="${air.district_id==6}">selected="selected"</c:if>>海定区</option>
					</select>
						<input name="ids" type="button" value="${air.district_id}">
					</td>
				</tr>
				<tr>
					<td style="text-align: right;" class="text_tabledetail2">监测日期：</td><%--日期格式转换的时候注意导包--%>
					<%--<td style="text-align: left;"><input type="text" id="monitor_time" name="monitor_time"value="${air.monitor_time}" /><span class="span">(*)</span><span>yyyyMMdd格式</span></td>--%>
					<td style="text-align: left;"><input type="text" id="monitor_time" name="monitor_time"value="<fmt:formatDate value="${air.monitor_time}" pattern="yyyy-MM-dd"/>" /><span class="span">(*)</span><span>yyyyMMdd格式</span></td>
				</tr>
				<tr>
					<td style="text-align: right;" class="text_tabledetail2">PM10值：</td>
					<td style="text-align: left;"><input type="text" id="pm10" name="pm10"value="${air.pm10}" /><span class="span">(*)</span></td>
					<%--<td style="text-align: left;">yyyyMMdd格式</td>--%>
				</tr>
				<tr>
					<td style="text-align: right;" class="text_tabledetail2">PM2.5值：</td>
					<td style="text-align: left;"><input type="text" id="pm25" name="pm25"value="${air.pm25}" /><span class="span">(*)</span></td>
				</tr>
				<tr>
					<td style="text-align: right;" class="text_tabledetail2">监测站：</td>
					<td style="text-align: left;"><input type="text" id="monitoring_station" name="monitoring_station"value="${air.monitoring_station}" /><span class="span">(*)</span></td>
				</tr>
				<tr>
					<td style="text-align: right;" class="text_tabledetail2">最后修改：</td>
					<td style="text-align: left;"><span id="systime"></span></td>
				</tr>

				<%--<tr>
					<td style="text-align: right;" class="text_tabledetail2">内容摘要：</td>
					<td style="text-align: left;" class="text_tabledetail2"><textarea rows="2" cols="20" id="Content" name="Content"value=""></textarea></td>
				</tr>--%>
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
					<%--<a href="/airquality/deleteUserById.html"></a>--%><button type="button" id="delete" class="page-btn" name="">删除</button>


					<button type="button" class="page-btn" name="return" onclick="javascript:history.back(-1)">返回</button>
				</td>
			</tr>
			</table>
		</form>
	</div>
</body>
</html>