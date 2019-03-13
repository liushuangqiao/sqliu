<%--
  Created by IntelliJ IDEA.
  User: shuangqiao
  Date: 2016/7/8
  Time: 13:54
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
    <title>桥帮主&nbsp;|&nbsp;个人博客</title>
    <meta name="keywords" content="刘双桥,博客,技术博客"/>
    <meta name="description" content="刘双桥的个人博客。"/>
<link rel="icon" href="${pageContext.request.contextPath}/images/favicon.ico" type="image/x-icon">
    <link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/backtotop.css" rel="stylesheet">
    <style type="text/css">
        .introduce{
            font-size:14px;
        }
        .intervalid{
            margin-top: 70px;
            margin-left: 30%;
            font-size: 30px;
        }
    </style>
<meta name="baidu_union_verify" content="183970d8564cd7a6e767cdb68aba1aac">
</head>
<%--<%@include file="user/login_style.jsp"%>--%>
<body>
<header>
    <p id="back-to-top"><a href="#top"><span></span><img src="../images/top.gif"/></a></p>

    <div id="logo"><a href="${pageContext.request.contextPath}/"></a></div>
    <nav class="topnav" id="topnav">
        <a href="${pageContext.request.contextPath}/"><span>首页</span><span class="en">Home</span></a>
        <a href="${pageContext.request.contextPath}/essay/1/1"><span>生活随笔</span><span class="en">Life</span></a>
        <a href="${pageContext.request.contextPath}/essay/2/1"><span>编程笔记</span><span class="en">Coding</span></a>
        <a href="${pageContext.request.contextPath}/essay/3/1"><span>旅行游记</span><span class="en">Traveling</span></a>
        <a href="${pageContext.request.contextPath}/essay/4/1"><span>读书心得</span><span class="en">Reading</span></a>
        <a href="${pageContext.request.contextPath}/gustBook/list/1"><span>留言版</span><span class="en">Gustbook</span></a>
        <c:if test="${sessionScope.get('username')==null || sessionScope.get('username')==''}">
            <a href="#"><span onclick="setUrlSession()">登录</span><span class="en">登录</span></a>
        </c:if>
        <c:if test="${sessionScope.get('username')!=null && sessionScope.get('username')!=''}">
            <a><span>${sessionScope.get("username") }</span><span class="en">欢迎您</span></a>
            <a href="#" onclick="userLogout()"><span>退出</span><span class="en">退出</span></a>
        </c:if>
    </nav>
</header>
<%@include file="sqliu_js.jsp"%>
<div class="banner" style="background: url('${pageContext.request.contextPath}/images/banner/banner${randNum}.jpg')  top center; ">
    <section class="box">
        <ul class="texts">
            <p>你现在的气质里，</p>
            <p>藏着你走过的路，</p>
            <p>读过的书，</p>
            <p>和爱过的人...</p>
        </ul>
        <div class="avatar"><a href="#"><span>桥帮主</span></a></div>
    </section>
</div>
<div class="template">
    <div class="box">
    </div>
</div>
<article>
    <h2 class="title_tj">
        <p>文章<span>推荐</span></p>
    </h2>
    <div class="bloglist left" id="alist">

        <%@include file="search.jsp"%>
    </div>

    <aside class="right">
        <%-- <div class="weather">
             <iframe width="250" scrolling="no" height="60" frameborder="0" allowtransparency="true"
                     src="http://i.tianqi.com/index.php?c=code&id=12&icon=1&num=1"></iframe>
         </div>--%>
        <div class="news">
            <h3>
                <p>站内<span>搜索</span></p>
            </h3>
            <div class="" style="margin-bottom:20px;margin-top:13px;">
                <form onsubmit="return false">
                    <input id="searchText" name="searchInput" style="height: 35px;width: 246px;"  placeholder="请输入标题或者其他有关内容" type="text"/><br>
                    <button style="margin-top:10px;height: 30px;width: 70px;background-color: #65B020;color: white;cursor:pointer" onclick="webSearch()" >站内搜索</button>
                    <button style="margin-left:120px;height: 30px;width: 40px;background-color: #65B020;color: white;cursor:pointer" type="reset">清空</button>
                </form>
            </div>
            <h3>
                <p>最新<span>文章</span></p>
            </h3>
            <ul class="rank"
                style="overflow: hidden; display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical; word-break: break-all;">
                <c:forEach items="${pageInfo}" var="Article">
                    <li><a href="/essayDetail/${Article.id }" target="_blank"
                           title="${Article.title}" target="_blank">${Article.title}</a></li>
                </c:forEach>
            </ul>
            <h3 class="ph">
                <p>点击<span>排行</span></p>
            </h3>
            <ul class="paih">
                <c:forEach items="${articleRight}" var="hitsList">
                    <li><a href="${pageContext.request.contextPath}/essayDetail/${hitsList.id }"
                           title="${hitsList.title}" target="_blank">${hitsList.title}</a></li>
                </c:forEach>
            </ul>
            <h3>
                <p>博主<span>简介</span></p>
            </h3>
            <ul class="rank">
		<span class="introduce"><b>姓名：</b></span>不详</br>
		<span class="introduce"><b>字：</b></span>乔木</br>
                <span class="introduce"><b>网名：</b></span>Sqliu | 桥帮主</br>
                <span class="introduce"><b>职业：</b></span>高级软件工程师</br>
                <span class="introduce"><b>爱好：</b></span>阅读，编程，LOL，烹饪，户外运动</br>
                <span class="introduce"><b>原产地：</b></span>鄂东北</br>
                <span class="introduce"><b>工作地点：</b></span>鹏城</br>
		<span class="introduce"><b>人生理想：</b></span>把当天的bug改完</br>
                <span class="introduce"><b>喜欢的书：</b></span>《白鹿原》《平凡的世界》</br>
                <span class="introduce"><b>喜欢的歌手：</b></span>张学友，伍佰，霉霉，Beyond</br>
		<span class="introduce"><b>喜欢的人：</b></span>露梅，明珠夫人，焰灵姬
            </ul>
            <h3 class="links">
                <p>友情<span>链接</span></p>
            </h3>
            <ul class="website">
                <c:forEach items="${urlList}" var="list" varStatus="vs">
                    <li><a href="${list.url}" title="${list.title}" target="_blank">${list.name}</a></li>
                </c:forEach>
            </ul>
        </div>
        <!-- Baidu Button BEGIN -->
        <div id="bdshare" class="bdshare_t bds_tools_32 get-codes-bdshare"><a class="bds_tsina"></a><a
                class="bds_qzone"></a><a class="bds_tqq"></a><a class="bds_renren"></a><span class="bds_more"></span><a
                class="shareCount"></a></div>
        <script type="text/javascript" id="bdshare_js" data="type=tools&amp;uid=6574585"></script>
        <script type="text/javascript" id="bdshell_js"></script>
        <script type="text/javascript">
            document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date() / 3600000)
        </script>
        <!-- Baidu Button END -->
        <div class="guanzhu">扫描二维码，加<span style="color: #65B020;">桥帮主的江湖</span>微信公众号，交个朋友</div>
        <!--<span href="#" class="weixin"> </span>-->
<img src="../images/weixinlogo.jpg" style="
    width: 108%;
    height: 100%;
">
</aside>
</article>
<footer>
    <p>Copyright © 2015-2018 &nbsp;桥帮主工作室&nbsp; All rights reserved. <a href="http://www.miitbeian.gov.cn/" target="_blank">鄂ICP备15020852号-1</a> </p>
</footer>
<script type="text/javascript">
    function hideContentWarning() {
        $("#contentWarning").css("display","none");
    }
    var intervalid;
    var i = 5;
    function fun() {

        if (i == 0) {
            window.location.href = "${pageContext.request.contextPath}/";
            clearInterval(intervalid);
        }
        var text = "搜索没有结果<br>将在<font color='red'>"+i+"</font>秒钟后跳转至<a color='green' href='${getPageHost}/'>首页</a>";

        document.getElementById("seconds").innerHTML = text;
        i--;
    }
    function webSearch(){
        var text = $("#searchText").val();
        if(text != '' && text != null){
        $.ajax({
            type : 'POST',
            url : '${pageContext.request.contextPath}/search/1',
            data : {
                searchInput : $("#searchText").val(),
            },
            success : function(data) {
                $('#alist').html(data);
                if($("#alist").html().length==13){
                    var div = '<div id="seconds"></div>';
                    $("#alist").html(div);
                    $("#seconds").addClass('intervalid');
                    intervalid = setInterval("fun()", 1000);
                }
            },
            error : function() {
                console.log("错了");
            }
        })
        }
    }
</script>
</body>
</html>

