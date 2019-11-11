<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>登录图书管理系统</title>

    <style>

      #main {
        width: 350px;
        height: 100px;
        border: 1px solid #c3c3c3;
        display: flex;
      }

      #main div:nth-of-type(1) {flex-grow: 1;}
      #main div:nth-of-type(2) {flex-grow: 1;}
      #main div:nth-of-type(3) {flex-grow: 1;}

      #myBlueDiv
      {
        animation:mymove 5s infinite;
        /*Safari 和 Chrome:*/
        -webkit-animation:mymove 5s infinite;
      }

      @keyframes mymove
      {
        50% {flex-grow:8;}
      }

      /*Safari 和 Chrome:*/
      @-webkit-keyframes mymove
      {
        50% {flex-grow:8;}
      }
    </style>

  </head>

  <body >
    <div class="divAdd" align="center">
      <form name="dataFrm" id="dataFrm" action="/book/dologin" method="post">
              <table border="1">
                <tr>
                  <td  colspan="2" style="text-align: center;"><h1>登录图书管理系统</h1></td>
                </tr>
                <tr>
                  <td style="text-align: right;" class="text_tabledetail2">用户名：</td>
                  <td><input type="text" class="form-control" name="name" placeholder="请输入用户名" required="" /></td>
                </tr>
                <tr>
                  <td style="text-align: right;" class="text_tabledetail2">密码：</td>
                  <td><input type="password" class="form-control" name="password" placeholder="请输入密码" required="" /></td>
                </tr>

                <tr align="center">
                  <td colspan="2"><button type="submit" class="page-btn" name="save" >登录</button>
                  <button type="reset" class="page-btn" name="">重置</button></td></tr>
              </table>
                <div>
                  <p>Welcom！！！ </p>
                </div>
      </form>
    </div>



    <p>"blue DIV" 的 flex-grow 属性逐渐地从 1 变化到 8，然后再变回 1：<p>

    <div id="main">
      <div style="background-color:coral;"></div>
      <div style="background-color:lightblue;" id="myBlueDiv"></div>
      <div style="background-color:khaki;"></div>
    </div>

    </body>
</html>