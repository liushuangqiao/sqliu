<%--
  Created by IntelliJ IDEA.
  User: shuangqiao
  Date: 2016/7/8
  Time: 18:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>桥帮主|个人博客</title>
    <meta name="keywords" content="个人博客模板,博客模板" />
    <meta name="description" content="桥帮主的个人博客。" />
    <link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/new.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/modernizr.js"></script>
    <script src="${pageContext.request.contextPath}/js/silder.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.1.js"></script>
<script type="text/javascript">
    /**获得当前日期**/
    $(document).ready()
    {
        function getDate01() {
            var time = new Date();
            var myYear = time.getFullYear();
            var myMonth = time.getMonth() + 1;
            var myDay = time.getDate();
            alert(myDay)
            if (myMonth < 10) {
                myMonth = "0" + myMonth;
            }
            document.getElementById("day_day").innerHTML = myYear + "." + myMonth
                    + "." + myDay;
        }
    }
</script>
</head>
<body>
<header>
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
    <h1 class="t_nav">
<c:forEach items="${pageInfo.list}" var="list" begin="0" end="0">
        <c:if test="${list.categoryId=='1'}">
        <span style="background:url(${pageContext.request.contextPath}/images/pen.png) no-repeat left center; padding-left:20px;">&nbsp;用文字记录心灵点滴，在文字中寻找自己的灵魂。</span>
        </c:if>
        <c:if test="${list.categoryId=='2'}">
            <span style="background:url(${pageContext.request.contextPath}/images/javaicon.png) no-repeat left center; padding-left:20px;">&nbsp;技术要靠点滴积累，不积跬步无以至千里。</span>
        </c:if>
        <c:if test="${list.categoryId=='3'}">
            <span style="background:url(${pageContext.request.contextPath}/images/cup.png) no-repeat left center; padding-left:20px;">&nbsp;工作要快，生活要慢。时间很快，却足够花开花落。</span>
        </c:if>
        <c:if test="${list.categoryId=='4'}">
            <span style="background:url(${pageContext.request.contextPath}/images/5794.png) no-repeat left center; padding-left:20px;">&nbsp;书中自有黄金屋，书中自有颜如玉。读别人的文字，悟自己的人生。</span>
        </c:if>
    </c:forEach>
        <span style="float: right;" id="day_day"></span>
        </h1>
    <div class="newblog left">
        <c:forEach items="${pageInfo.list}" var="list">
        <h2><a href="${pageContext.request.contextPath}/essayDetail/${list.id}">${list.title}</a></h2>
        <p class="dateview"><span>发布时间：<fmt:formatDate pattern="yyyy-MM-dd" value="${list.createdTime }"></fmt:formatDate></span><span>分类：<a href="${pageContext.request.contextPath}/essay/${list.categoryId }/1">【${list.categoryName }】</a></span><span>浏览量：(${list.hits})</span></p>
        <figure><img src="${pageContext.request.contextPath}/images/001.png"></figure>
        <ul class="nlist">
            <div style="width: 520px;max-height:61px; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; word-break: break-all;">
            <p>${list.words}</p>
            </div>
            <a title="阅读全文" href="${pageContext.request.contextPath}/essayDetail/${list.id}" target="_blank" class="readmore">阅读全文>></a>
        </ul>
        <div class="line"></div>
        </c:forEach>
        <div class="blank"></div>

       <%-- <div class="ad">
            <img src="${pageContext.request.contextPath}/images/ad.png">
        </div>--%>

        <div class="page"><%@include file="page.jsp"%></div>
    </div>
    <aside class="right">
       <%-- <div class="rnav">
            <ul>
                <li class="rnav1"><a href="/download/" target="_blank">日记</a></li>
                <li class="rnav2"><a href="/newsfree/" target="_blank">程序人生</a></li>
                <li class="rnav3"><a href="/web/" target="_blank">欣赏</a></li>
                <li class="rnav4"><a href="/newshtml5/" target="_blank">短信祝福</a></li>
            </ul>
        </div>--%>
        <div class="news" style="margin-top: 20px;">
            <h3>
                <p>最新<span>文章</span></p>
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
        <!-- Baidu Button BEGIN -->
        <div id="bdshare" class="bdshare_t bds_tools_32 get-codes-bdshare"><a class="bds_tsina"></a><a class="bds_qzone"></a><a class="bds_tqq"></a><a class="bds_renren"></a><span class="bds_more"></span><a class="shareCount"></a></div>
        <script type="text/javascript" id="bdshare_js" data="type=tools&amp;uid=6574585" ></script>
        <script type="text/javascript" id="bdshell_js"></script>
        <script type="text/javascript">
            document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000)
        </script>
        <!-- Baidu Button END -->
    </aside>
</article>
<footer>
    <p>版权所有 ©&nbsp;桥帮主工作室&nbsp;&nbsp; <a href="http://www.miitbeian.gov.cn/" target="_blank">鄂ICP备15020852号-1</a> <a href="/">网站统计</a></p>
</footer>
</body>
</html>
