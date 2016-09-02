<%--
  Created by IntelliJ IDEA.
  User: shuangqiao
  Date: 2016/7/8
  Time: 18:48
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
    <title>桥帮主|个人博客</title>
    <meta name="keywords" content="个人博客模板,博客模板"/>
    <meta name="description" content="寻梦主题的个人博客模板，优雅、稳重、大气,低调。"/>
    <link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/new.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/backtotop.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery-1.7.1.js"></script>
    <script src="http://ajax.microsoft.com/ajax/jQuery/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">
        $(function(){
            //当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失
            $(function () {
                $(window).scroll(function(){
                    if ($(window).scrollTop()>100){
                        $("#back-to-top").fadeIn(1500);
                    }
                    else
                    {
                        $("#back-to-top").fadeOut(1500);
                    }
                });

                //当点击跳转链接后，回到页面顶部位置

                $("#back-to-top").click(function(){
                    $('body,html').animate({scrollTop:0},1000);
                    return false;
                });
            });
        });
    </script>
</head>
<body>
<header>
    <p id="back-to-top"><a href="#top"><span></span><img src="../images/top.gif"/></a></p>
    <div id="logo"><a href="/"></a></div>
    <nav class="topnav" id="topnav">
        <a href="${pageContext.request.contextPath}/"><span>首页</span><span class="en">Home</span></a>
        <a href="${pageContext.request.contextPath}/essay/1/1"><span>随笔</span><span class="en">Essay</span></a>
        <%--        <a href="${pageContext.request.contextPath}/photo"><span>相册</span><span class="en">Life</span></a>--%>
        <a href="${pageContext.request.contextPath}/essay/2/1"><span>Java笔记</span><span class="en">Java</span></a>
        <a href="${pageContext.request.contextPath}/essay/3/1"><span>慢生活</span><span class="en">Life</span></a>
        <a href="${pageContext.request.contextPath}/essay/4/1"><span>读书心得</span><span class="en">Reading</span></a>
        <a href="#"><span>留言版</span><span class="en">Gustbook</span></a>
        <a href="${pageContext.request.contextPath}/user/login"><span>登录</span><span class="en">登录</span></a>
    </nav>
    </nav>
</header>
<article class="blogs">
    <h1 class="t_nav"><span>您当前的位置：<a href="${pageContext.request.contextPath}/">首页</a>&nbsp;&gt;&nbsp;<a href="${pageContext.request.contextPath}/essay/${article.categoryId}/1">${article.categoryName}</a>&nbsp;&gt;&nbsp;${article.title}</span></h1>
    <div class="index_about">
            <h2 class="c_titile">${article.title}</h2>
            <p class="box_c">
            <span class="d_time">
                发布时间：<fmt:formatDate pattern="yyyy-MM-dd" value="${article.createdTime }"></fmt:formatDate>
        </span>
                <span>浏览量：(${article.hits})</span>
                <ul class="infos">
            <p>
                    ${article.words }
            </p>
            </ul>
          <%--  <div class="keybq">
                <p><span>关键字词</span>：爱情,犯错,原谅,分手</p>
            </div>--%>
    <div class="ad"></div>
    <div class="nextinfo">
            <c:if test="${lastTitle != null}">
        <p>上一篇：<a href="${pageContext.request.contextPath}/essayDetail/${lastTitle.id}">${lastTitle.title}</a></p>
            </c:if>
                <c:if test="${nextTitle != null}">
        <p>下一篇：<a href="${pageContext.request.contextPath}/essayDetail/${nextTitle.id}">${nextTitle.title}</a></p>
                </c:if>
    </div>
        <div style="margin-top:2%;">
            <div style="font-size:15px;background-color:#F8F8F8;width:98%;">
                好友热评
            </div>
            <div style="heiht:10px;">
                &nbsp;
            </div>
            <div>
                <table style="line-height: 26px;">
                    <tr>
                        <td rows="2">文章不错哟</td>
                    </tr>
                    <tr>
                        <td width="83%"></td>
                        <td><span><a href="#" onclick="addPraise()">赞</a>（<span id="p_num">0</span>）&nbsp;</span><span align="right">2016-08-08</span></td>
                    </tr>
                </table>
                <h2 style="border-bottom: #B2BBBB 1px solid;margin-right: 20px;"/>
            </div>

            <div style="margin-top:2%;">
                <p style="font-size:15px;">发表评论</p>
                <textarea style="width:700px;height:80px;resize:none;"></textarea>
            </div>
            <div id="" class="" style="margin-top:1%;">
                <button type="button" style="width:60px;height:25px;">发 表</button>
            </div>
</div>

        </div>
    <aside class="right">
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
        <div class="blank"></div>
        <div class="news">
            <h3>
                <p>栏目<span>最新</span></p>
            </h3>
            <ul class="rank" style="overflow: hidden; display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical; word-break: break-all;">
                <c:forEach items="${newlist}" var="Article">
                    <li><a href="${pageContext.request.contextPath}/essayDetail/${Article.id }" target="_blank" title="${Article.title}" target="_blank">${Article.title}</a></li>
                </c:forEach>
            </ul>
            <h3 class="ph">
                <p>点击<span>排行</span></p>
            </h3>
            <ul class="paih">
                <c:forEach items="${articleRight}" var="hitsList">
                    <li><a href="${pageContext.request.contextPath}/essayDetail/${hitsList.id }" title="${hitsList.title}" target="_blank">${hitsList.title}</a></li>
                </c:forEach>
            </ul>
        </div>
        <div class="visitors">
          <%--  <h3>
                <p>最近访客</p>
            </h3>--%>
            <ul>
            </ul>
        </div>
    </aside>
</article>
<footer>
    <p>版权所有 ©&nbsp;桥帮主工作室&nbsp;&nbsp; <a href="http://www.miitbeian.gov.cn/" target="_blank">鄂ICP备15020852号-1</a> <a href="/">网站统计</a></p>
</footer>
</body>
<script type="text/javascript">
    function addPraise(){
        var praiseNum = $("#p_num").text();
        var sum = parseInt(praiseNum)+1;
        $("#p_num").html("");
        $("#p_num").html(sum);

    }
</script>
</html>
