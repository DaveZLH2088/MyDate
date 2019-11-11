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
		$("#dataFrm").submit(function() {
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
	});
</script>
</head>

<body>
<div class="divAdd" align="center">
		<form name="dataFrm" id="dataFrm" action="/airquality/addair" method="post">
			<table  cellpadding="1" cellspacing="1" class="admin-list"  border="1">
				<tr>
				<td colspan="3" style="text-align: center;"><h2>添加空气质量信息</h2></td>
				</tr>
				<tr>
					<td style="text-align: right;" class="text_tabledetail2">监测区域：</td>
					<td style="text-align: left;"><select name="district_id" id="district_id" style="width:90px">
						<option value="0">请选择</option>
						<option value="1">东城区</option>
						<option value="2">西城区</option>
						<option value="3">南城区</option>
						<option value="4">北城区</option>
						<option value="5">朝阳区</option>
						<option value="6">海定区</option>
					</select></td>
				</tr>
				<tr>
					<td style="text-align: right;" class="text_tabledetail2">监测日期：</td>
					<td style="text-align: left;"><input type="text" id="monitor_time" name="monitor_time"value="" /><span class="span">(*)</span><span>yyyyMMdd格式</span></td>
				</tr>

				<tr>
					<td style="text-align: right;" class="text_tabledetail2">PM10值：</td>
					<td style="text-align: left;"><input type="text" id="pm10" name="pm10"value="" /><span class="span">(*)</span></td>
					<%--<td style="text-align: left;">yyyyMMdd格式</td>--%>
				</tr>
				<tr>
					<td style="text-align: right;" class="text_tabledetail2">PM2.5值：</td>
					<td style="text-align: left;"><input type="text" id="pm25" name="pm25"value="" /><span class="span">(*)</span></td>
				</tr>
				<tr>
					<td style="text-align: right;" class="text_tabledetail2">监测站：</td>
					<td style="text-align: left;"><input type="text" id="monitoring_station" name="monitoring_station"value="" /><span class="span">(*)</span></td>
				</tr>
			<%--	<tr>
					<td style="text-align: right;" class="text_tabledetail2">最后修改时间：</td>
					<td><div><span id="systime"></span></div></td>
				</tr>--%>

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
					<button type="submit" class="page-btn" name="save" >保存</button>
					<button type="reset" class="page-btn" name="">重置</button>
					<button type="button" class="page-btn" name="return" onclick="javascript:history.back(-1)">返回</button>
				</td>
			</tr>
			</table>
		</form>
	</div>
</body>
</html>