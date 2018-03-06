<%--
  Created by IntelliJ IDEA.
  User: shuangqiao
  Date: 2016/7/31
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta content="IE=11.0000" http-equiv="X-UA-Compatible">
<html>
<head>
    <meta name="GENERATOR" content="MSHTML 11.00.9600.17496">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="${pageContext.request.contextPath}/js/login_js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/css/user/user_login.css" rel="stylesheet">
    <script type="text/javascript">
        $(function(){
            $("#passwd").focus(function(){
                $("#left_hand").animate({
                    left: "150",
                    top: " -38"
                },{step: function(){
                    if(parseInt($("#left_hand").css("left"))>140){
                        $("#left_hand").attr("class","left_hand");
                    }
                }}, 2000);
                $("#right_hand").animate({
                    right: "-64",
                    top: "-38px"
                },{step: function(){
                    if(parseInt($("#right_hand").css("right"))> -70){
                        $("#right_hand").attr("class","right_hand");
                    }
                }}, 2000);
                /*用户名校验*/
                if($("#name").val()==''){
                    $("#name_warning").html('');
                    $("#name_warning").css("color","red");
                    $("#name_warning").html('<br>用户名为空！');
                }else{
                    $.ajax({
                        type :'POST',
                        url : '${pageContext.request.contextPath}/checkName',
                        data : {
                            username : $("#name").val(),
                        },
                        success : function(data) {
                            if(data=='1'){
                                $("#name_warning").css("color","red");
                                $("#name_warning").html('<br>&nbsp;用户名已存在！');
                            }else if(data=='0'){
                                $("#name_warning").css("color","green");
                                $("#name_warning").html('<br>用户名正确！');
                            }
                        },
                        error : function() {
                            console.log("失败");
                        }
                    });
                }
            });
            //失去焦点
            $("#passwd").blur(function(){
                $("#left_hand").attr("class","initial_left_hand");
                $("#left_hand").attr("style","left:100px;top:-12px;");
                $("#right_hand").attr("class","initial_right_hand");
                $("#right_hand").attr("style","right:-112px;top:-12px");
            });
        });
    </script>
</head>
<body onkeypress="if (event.keyCode == 13) commitInfo();" style="background: url('${pageContext.request.contextPath}/images/login/login_bg_${randNum}.jpg');background-size:cover;">
<%--<div class="top_div"></div>--%>
<div style="background: rgb(255, 255, 255); margin: 190px auto auto; border: 1px solid rgb(231, 231, 231); border-image: none; width: 400px; height: 293px; text-align: center;">
    <div style="width: 165px; height: 96px; position: absolute;">
        <div class="tou"></div>
        <div class="initial_left_hand" id="left_hand"></div>
        <div class="initial_right_hand" id="right_hand"></div>
    </div>

    <div id="registerForm">
        <table>
            <tr>
                <td style="width: 62%;">
                    <p style="padding: 30px 0px 10px; position: relative;"><span class="u_logo"></span>
                        <input class="ipt" name="username" id="name" type="text" placeholder="请输入用户名或邮箱" value="">
                    </p>
                </td>
                <td>
                    <span id="name_warning" style="color: red"></span>
                </td>
            </tr>
            <tr>
                <td style="width: 55%;">
                    <p style="padding: 2px 0px 10px; position: relative;">
                        <span class="phone_logo"></span>
                        <input class="ipt" id="phone" type="text" placeholder="请输入手机号" value="">
                    </p>
                </td>
                <td>
                    <span id="phone_warning" style="color: red"></span>
                </td>
            </tr>
            <tr>
                <td style="width: 55%;">
                    <p style="position: relative;"><span class="p_logo"></span>
                        <input class="ipt" name="code" id="code" type="text" placeholder="请输入验证码" value="">
                    </p>
                </td>
                <td>
                    <span id="codeWarning" style="color: red;margin-left: 15%;"></span>
                </td>
            </tr>
            <tr>
                <td style="text-align: left;">
                    <img id="codeImg" style="margin-left: 16%;margin-top: 5%;" src="${pageContext.request.contextPath}/imgCode"/>
                </td>
                <td>
                    <button type="button" onclick="changeImg()">看不清，换一张</button>
                </td>
            </tr>
        </table>
        <div style="height: 50px; line-height: 50px; margin-top: 16px; border-top-color: rgb(231, 231, 231); border-top-width: 1px; border-top-style: solid;">
            <p style="margin: 8px 35px 20px 45px;">
               <span style="float: right;">
                  <input type="button" onclick="commitInfo();"  value="下一步" style="background: rgb(0, 142, 173); padding: 7px 10px; border-radius: 4px; border: 1px solid rgb(26, 117, 152); border-image: none; color: rgb(255, 255, 255); font-weight: bold;">
               </span>
            </p>
        </div>
    </div>
</div>
<%--  <div style="text-align:center;">
      <p>版权所有 ©&nbsp;桥帮主工作室&nbsp;&nbsp; <a href="http://www.miitbeian.gov.cn/" target="_blank">鄂ICP备15020852号-1</a> <a href="/">网站统计</a></p>
  </div>--%>
</body>
<script type="text/javascript">
    function login(){
        var name = $("#username").val();
        var pwd = $("#password").val();
        if(name==null || name==''){
            $("#name_error").html('');
            $("#name_error").css("color","red");
            $("#name_error").html('请输入用户名！');
        }
        if(pwd==null || pwd==''){
            $("#pwd_error").html('');
            $("#pwd_error").css("color","red");
            $("#pwd_error").html('请输入密码！');
        }
        if(name!=null && name!='' && pwd!=null && pwd!=''){
            $.ajax({
                type :'POST',
                url : '${pageContext.request.contextPath}/login',
                data : {
                    username : name,
                    password : pwd,
                },
                success : function(data) {
                    if(data=='1'){
                        window.location.href = "${pageContext.request.contextPath}/";
                    }else if(data=='0'){
                        $("#pwd_error").html('密码错误！');
                    }
                },
                error : function() {
                    console.log("失败");
                }
            });
        }
    }

    function showRegister(){
        $("#loginForm").css("display","none");
        $("#registerForm").css("display","block");
    }
    function commitInfo(){
        $.ajax({
            type :'POST',
            url : '${pageContext.request.contextPath}/codeCheck',
            data:{
                code : $("#code").val(),
            },
            success : function(data) {
             if(data=='0'){
                  $("#codeWarning").html('');
                  $("#codeWarning").html('验证码错误');
              }else if(data=='1'){
                 $("#codeWarning").html('');
                 $.ajax({
                     type :'POST',
                     url : '${pageContext.request.contextPath}/forgetCheck',
                     data:{
                         phone : $("#phone").val(),
                         username : $("#name").val(),
                     },
                     success : function(data) {
                        if(data=='1'){
                            window.location.href = "${pageContext.request.contextPath}/passwordReset";
                        }else if(data=='2'){
                            $("#phone_warning").html('');
                            $("#name_warning").html('');
                            $("#phone_warning").html('手机号错误');
                        }else if(data=='0'){
                            $("#name_warning").html('');
                            $("#phone_warning").html('');
                            $("#name_warning").html('用户名错误');
                        }
                     },
                 });
             }
            },
            error : function() {
                console.log("失败");
            }
        });
      /*  $("#loginForm").css("display","block");
        $("#registerForm").css("display","none");*/
    }

    function register(){
        var username = $("#name").val();
        var pwd = $("#passwd").val();
        var phone = $("#phone").val();
        if(username==null || username==''){
            $("#name_warning").html('');
            $("#name_warning").css("color","red");
            $("#name_warning").html('<br>&nbsp;请输入用户名！');
        }
        if(pwd==null || pwd==''){
            $("#pwd_warning").html('');
            $("#pwd_warning").css("color","red");
            $("#pwd_warning").html('请输入密码！');
        }
        var regBox = {
            regMobile : /^0?1[3|4|5|8][0-9]\d{8}$/,//手机
        }
        var mflag = regBox.regMobile.test(phone);
        if (!(mflag)) {
            $("#phone_warning").html('');
            $("#phone_warning").css("color","red");
            $("#phone_warning").html('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;手机号输入有误！');
        }else{
            $("#phone_warning").html('');
            $("#phone_warning").css("color","green");
            $("#phone_warning").html('正确！');
        }
        if(phone==null || phone==''){
            $("#phone_warning").html('');
            $("#phone_warning").css("color","red");
            $("#phone_warning").html('请输入手机号！');
        }
        if(username!=null && username!='' && pwd!=null && pwd!='' && phone!=null && phone!='' && (mflag)){
            $.ajax({
                type :'POST',
                url : '${pageContext.request.contextPath}/register',
                data : {
                    username : username,
                    password : pwd,
                    phone : phone,
                },
                success : function(data) {
                    if(data=='1'){
                        window.location.href = "${pageContext.request.contextPath}/";
                    }else if(data=='0'){
                        $("#name_warning").html('<br>&nbsp;用户名已存在！');
                    }

                },
                error : function() {
                    console.log("失败");
                }
            });
        }
    }

    function changeImg(){
        $.ajax({
            type :'POST',
            url : '${pageContext.request.contextPath}/imgCode',
            success : function(data) {
                $("#codeImg").attr("src","");
                $("#codeImg").attr("src",'${pageContext.request.contextPath}/imgCode');
            },
            error : function() {
                console.log("失败");
            }
        });

    }
</script>
</HTML>
