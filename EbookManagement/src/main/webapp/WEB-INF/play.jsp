<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
    <meta charset="UTF-8">
    <title>幸运大抽奖</title>
    <script src="js/jquery-1.8.3.js"></script>
    <style type="text/css">
        *{margin:0;padding:0;}
        body{
            text-align:center;
            background:#66677c;
            overflow:hidden;
        }


        .div{
            float:left;
            left: 200px;
            top:50px ;
            position:relative;
            text-align:center;line-height: 30px ;
            position:relative;
            padding: 20px;
            border-radius: 20px;
            width:290px ;
            height: 600px;
            border: 2px solid gainsboro;
            background-color:yellow;
            background:-webkit-repeating-linear-gradient(#f0fba1,#F8F8F3);
            background:-webkit-repeating-linear-gradient(/*#3e99dd, #a5ffa9,#11eed8,*/ #cbb8ff,#fbd799,#fafbbd/*,#dcffe2*//*, #ffe46e,#f0fba1, #fffabe*/);
        }


        .box div{
            text-align:center;line-height: 30px ;
            float: left;
            position:relative;
            padding: 10px;
            margin: 7px;
            border-radius: 20px;
            width:57px ;
            height:30px;
            border: 2px solid gainsboro;
            background-color:yellow;
     /*       background:-webkit-repeating-linear-gradient(#fafbbd,#cbb8ff);*/
            background:-webkit-repeating-linear-gradient(#c4f1fb, #cbb8ff);
        /*    background:-webkit-repeating-linear-gradient(#3e99dd, #a5ffa9,#11eed8);*/
        }

        #but{
             text-align:center;line-height: 30px ;
             padding: 20px;
             border-radius: 20px;
             float: left;
             width:250px ;
             height:40px;
             font-size: 20px;
             border: 2px solid gainsboro;
             background:-webkit-repeating-linear-gradient(/*#cbb8ff,*/#fbd799,#fafbbd);
         }
        #title{
            color: #4d52ff;
            text-align:center;line-height: 10px ;
            padding: 10px;
            border-radius: 20px;
            float: left;
            width:260px ;
            height:10px;
            font-size:18px;
            border: 2px solid gainsboro;
            background:-webkit-repeating-linear-gradient(#fafbbd,#cbb8ff);
        }
        h3{
            color: #ff8884;;
        }
    </style>

    <script type="text/javascript">
    $(function() {
        var j = 0;
        $(document).on('selectstart', function() {
            return false
        })
        var timer,
            n = 0
        $('.box p').on('click', function() {
            if (j == 0) {
                j = 1;
                $(".but").html("开奖中……");
                timer = setInterval(function() {
                    n++

                    $('.box div').each(function(k, v) {

                        $('.box div').eq(k).css({
                            'background': color(),
                            'color': color()
                        })
                    })
                    console.log(n)
                    if (n >= 20) {

                        clearInterval(timer)
                        j = 0;
                        $(".but").html("开始抽奖");
                        n = 0
                        $('.box div').css({
                            'background': '-webkit-repeating-linear-gradient(#fbd799,#cbb8ff)',
                            'color': 'white'
                        })
                        $('.box div').eq(name()).css({
                            'background': '-webkit-repeating-linear-gradient(#fafbbd,#cbb8ff)',
                            'color': 'blueviolet'
                        })
                    }
                }, 100)
            }
        })

        /*随机索引号，需要改的就直接改数字，多少人就改成多少个*/
        function name() {
            return Math.floor(Math.random() * 21)
        }
        /*随机的颜色封装函数*/
        function color() {
            var r = Math.floor(Math.random() * 256)
            var g = Math.floor(Math.random() * 256)
            var b = Math.floor(Math.random() * 256)
            return 'rgb(' + r + ',' + g + ',' + b + ')'
        }
    })

    </script>

</head>
<body>
<div class="div" id="loginContent">
    <div id="title">幸运大抽奖</div>
<div class='box'>
    <div>田杰</div>
    <div>金博胜</div>
    <div>刘朝</div>
    <div>田丰</div>
    <div>唐文龙</div>
    <div>陈诗欣</div>
    <div>周毅衡</div>
    <div>彭珉</div>
    <div>孔凡龙</div>
    <div>黄修明</div>
    <div>刘晓珂</div>
    <div>张继刚</div>
    <div>袁丹琪</div>
    <div>杜豪</div>
    <div>徐思康</div>
    <div>熊志川</div>
    <div>肖紫芊</div>
    <div>陈子豪</div>
    <div>梅齐宇</div>
    <div>舒浩淼</div>
    <div>占兰海</div>
    <p class="but" id="but">开始抽奖</p>
</div>
    <button type="button" class="luck" name="return" onclick="javascript:history.back(-1)">返   回</button>
  <!--  <p class="but" id="buts">开始点名</p>-->
</div>

</body>
</html>