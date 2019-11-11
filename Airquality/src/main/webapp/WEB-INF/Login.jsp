<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>登录图书管理系统</title>

    <style>

      #main {
        margin-left: 250px;
        margin-top: 50px;
        width: 1000px;
        height: 600px;
        TEXT-ALIGN: center;
        border: 5px solid #64c370;
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
      #login{
        margin-left: 50px;
        margin-top: 50px;
        width: 500px;
        height: 300px;
        TEXT-ALIGN: center;
        border: 5px solid #64c370;
        display: flex;
      }

      #divAdd{
        margin-left: 250px;
        margin-top: 100px;
        color:#000000;
        position: relative;
        border: 5px solid #64c370;
        /* padding: 20px; */
        border-radius: 20px;
        width:400px ;
        /* 表体文字居左删除下一个 */
        TEXT-ALIGN: center;
        border: 2px solid gainsboro;
        background-color:#ffffff;
      /*  background:-webkit-repeating-linear-gradient(#3e99dd, #a5ffa9,#11eed8);*/
        /*  background:-webkit-repeating-linear-gradient(#3e99dd, #a5ffa9,#11eed8, #cbb8ff,#fbd799,#fafbbd,#dcffe2, #ffe46e,#f0fba1, #fffabe); */
      }

      #dataFrm{
        margin-top: 200px;
        width: 400px;
      }
    </style>

  </head>

  <body >

    <div id="main">
      <div style="background-color:coral;"></div>
      <div style="background-color:lightblue;" id="myBlueDiv">

        <div class="divAdd"  align="center">
          <form name="dataFrm"  action="/book/dologin" method="post">
            <table border="1" id="dataFrm">
              <tr>
                <td  colspan="2" style="text-align: center;"><h2>登录图书管理系统</h2></td>
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
<h3><p>Welcom！！！ </p></h3>
</div>
</form>
</div>
      </div>
      <div style="background-color:khaki;"></div>
    </div>

    </body>
</html>