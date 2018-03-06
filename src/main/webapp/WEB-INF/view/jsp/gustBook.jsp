<%--
  Created by IntelliJ IDEA.
  User: shuangqiao
  Date: 2016/12/11
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>桥帮主|留言板</title>
    <meta name="keywords" content="刘双桥,博客,技术博客"/>
    <meta name="description" content="刘双桥的个人博客。"/>
    <link href="${getPageHost}/css/base.css" rel="stylesheet">
    <link href="${getPageHost}/css/index.css" rel="stylesheet">
    <link href="${getPageHost}/css/backtotop.css" rel="stylesheet">
    <link href="${getPageHost}/css/mood.css" rel="stylesheet">
    <script src="http://ajax.microsoft.com/ajax/jQuery/jquery-1.7.2.min.js"></script>
    <style>
        .bnt_style{
            margin-top: 5px;
            width: 60px;
            height: 30px;
            font-size: 17px;
        }
    </style>
</head>
<%--<%@include file="user/login_style.jsp"%>--%>
<body>
<header>
    <p id="back-to-top"><a href="#top"><span></span><img src="../images/top.gif"/></a></p>

    <div id="logo"><a href="/"></a></div>
    <nav class="topnav" id="topnav">
        <a href="${getPageHost}/"><span>首页</span><span class="en">Home</span></a>
        <a href="${getPageHost}/essay/1/1"><span>随笔</span><span class="en">Essay</span></a>
        <a href="${getPageHost}/essay/2/1"><span>Java笔记</span><span class="en">Java</span></a>
        <a href="${getPageHost}/essay/3/1"><span>慢生活</span><span class="en">Life</span></a>
        <a href="${getPageHost}/essay/4/1"><span>读书心得</span><span class="en">Reading</span></a>
        <a href="${getPageHost}/gustBook/list/1"><span>留言版</span><span class="en">Gustbook</span></a>
        <c:if test="${sessionScope.get('username')==null || sessionScope.get('username')==''}">
            <a href="#"><span onclick="setUrlSession()">登录</span><span class="en">登录</span></a>
        </c:if>
        <c:if test="${sessionScope.get('username')!=null && sessionScope.get('username')!=''}">
            <a><span id="userName">${sessionScope.get("username") }</span><span class="en">欢迎您</span></a>
        </c:if>
    </nav>
</header>
<%@include file="sqliu_js.jsp"%>
<div class="moodlist">
    <h1 class="t_nav"> <span style="background:url(${getPageHost}/images/gustbook.png) no-repeat left center; padding-left:65px;">&nbsp;一声问候，一丝回忆，让我听见你的心声。</span></h1>
    <div class="bloglist">
        <p style="font-size:20px;margin-left: 1%;">写留言
                    <span style="font-size:13px;margin-left: 25px;">
                        <c:if test="${sessionScope.get('username')==''||sessionScope.get('username')==null }">
                            您好，请先<a style="color: #1A5CC6" href="#" onclick="setUrlSession()">登录</a>
                        </c:if>
                    </span>
        </p>
        <ul style="width:730px;">
            <c:choose>
                <c:when test="${sessionScope.get('username')==''||sessionScope.get('username')==null }">
                    <textarea id="gustText" disabled style="width:709px;height:100px;resize:none;"></textarea><br>
                    <button class="bnt_style" disabled onclick="commitGust()">发表</button>
                    <span id="gustWarning" style="margin-left: 10px;color: red"></span>
                </c:when>
                <c:otherwise>
                    <textarea id="gustText" style="width:709px;height:100px;resize:none;"></textarea><br>
                    <button class="bnt_style" onclick="commitGust()">发表</button>
                    <span id="gustWarning" style="margin-left: 10px;color: red"></span>
                </c:otherwise>
            </c:choose>
        </ul>
        <c:forEach items="${pageInfo.list}" var="list" varStatus="vs">
        <ul class="arrow_box" style="width: 730px;margin: 20px 0;">
            <div class="sy">
                <p> <span style="min-width:40px;">${list.userName}</span><span style="margin-left:30px;">&nbsp;</span>${list.contents}</p>
            </div>
            <span class="dateview"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${list.createdTime }"></fmt:formatDate>&nbsp;&nbsp;&nbsp;</span>
        </ul>
        </c:forEach>
    </div>
    <div class="page"><%@include file="page.jsp"%></div>
</div>
<footer>
    <p>版权所有 ©&nbsp;桥帮主工作室&nbsp;&nbsp; <a href="http://www.miitbeian.gov.cn/" target="_blank">鄂ICP备15020852号-1</a> <a
            href="/">网站统计</a></p>
</footer>
<script src="js/silder.js"></script>
</body>
<script>
    function commitGust(){
        var text = $("#gustText").val();
        var username = $("#userName").text();
        if(text==''||text==null){
            $("#gustWarning").html("留言为空！");
        }else{
        $.ajax({
            type : 'POST',
            url : '${getPageHost}/gustBook/save',
            data : {
                contents : text,
                userName : username,
            },
            success : function(data) {
                if(data=='1'){
                    window.location.href = '${getPageHost}/gustBook/list/1';
                }else{
               $("#gustWarning").html("留言为空！");
                }
            },
            error : function() {
                console.log("错了");
            }
        })
        }
    }
</script>
</html>
