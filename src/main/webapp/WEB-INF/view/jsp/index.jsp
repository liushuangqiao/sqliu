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
    <title>桥帮主|个人博客</title>
    <meta name="keywords" content="刘双桥,博客,技术博客"/>
    <meta name="description" content="刘双桥的个人博客。"/>
    <link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/backtotop.css" rel="stylesheet">
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
        <a href="${pageContext.request.contextPath}/user/login"><span onclick="showLoginBox()">登录</span><span class="en">登录</span></a>
    </nav>
</header>
<div class="banner">
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
       <%-- <h3>
            <p><span>精彩图片</span>Life Style</p>
        </h3>
        <ul>
            <li><a href="/" target="_blank"><img src="${pageContext.request.contextPath}/images/01.jpg"></a><span>仿新浪博客风格·梅——古典个人博客模板</span>
            </li>
            <li><a href="/" target="_blank"><img src="${pageContext.request.contextPath}/images/02.jpg"></a><span>黑色质感时间轴html5个人博客模板</span>
            </li>
            <li><a href="/" target="_blank"><img src="${pageContext.request.contextPath}/images/03.jpg"></a><span>Green绿色小清新的夏天-个人博客模板</span>
            </li>
            <li><a href="/" target="_blank"><img src="${pageContext.request.contextPath}/images/04.jpg"></a><span>女生清新个人博客网站模板</span>
            </li>
            <li><a href="/" target="_blank"><img src="${pageContext.request.contextPath}/images/02.jpg"></a><span>黑色质感时间轴html5个人博客模板</span>
            </li>
            <li><a href="/" target="_blank"><img src="${pageContext.request.contextPath}/images/03.jpg"></a><span>Green绿色小清新的夏天-个人博客模板</span>
            </li>
        </ul>--%>
    </div>
</div>
<article>
    <h2 class="title_tj">
        <p>文章<span>推荐</span></p>
    </h2>
    <div class="bloglist left">
        <c:forEach items="${pageInfo}" var="Article">
            <h3 title="${Article.title }">${Article.title}</h3>
            <figure><img src="${pageContext.request.contextPath}/images/001.png"></figure>
            <ul>
                <div style="width: 520px;max-height:60px; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; word-break: break-all;">
                    <p>
                            ${Article.words}
                            <%--<c:choose>
                             <c:when test="${fn:length(Article.words) > 100}">
                                 <c:out value="${fn:substring(fn:replace(Article.words,'</p><p>' ,'' ), 0, 100)}..." />
                             </c:when>
                             <c:otherwise>
                                 <c:out value="${Article.words}" />
                             </c:otherwise>
                         </c:choose>--%>

                    </p>
                </div>
                <a title="${Article.title }" href="${pageContext.request.contextPath}/essayDetail/${Article.id }"
                   target="_blank" class="readmore">阅读全文>></a>
            </ul>
            <p class="dateview">
            <span>
                <fmt:formatDate pattern="yyyy-MM-dd" value="${Article.createdTime }"></fmt:formatDate>
                &nbsp; &nbsp; &nbsp;分类：<a  href="${pageContext.request.contextPath}/essay/${Article.categoryId}/1">【${Article.categoryName }】</a>
            </span>
            </p>

        </c:forEach>
    </div>

    <aside class="right">
        <div class="weather">
            <iframe width="250" scrolling="no" height="60" frameborder="0" allowtransparency="true"
                    src="http://i.tianqi.com/index.php?c=code&id=12&icon=1&num=1"></iframe>
        </div>
        <div class="news">
            <h3>
                <p>最新<span>文章</span></p>
            </h3>
            <ul class="rank"
                style="overflow: hidden; display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical; word-break: break-all;">
                <c:forEach items="${pageInfo}" var="Article">
                    <li><a href="${pageContext.request.contextPath}/essayDetail/${Article.id }" target="_blank"
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
            <h3 class="links">
                <p>友情<span>链接</span></p>
            </h3>
            <ul class="website">
                <li><a href="http://tieba.baidu.com/f?ie=utf-8&kw=%E5%88%98%E5%8F%8C%E6%A1%A5&fr=search"
                       target="_blank">刘双桥吧</a></li>
                <li><a href="https://zhidao.baidu.com/hangjia/profile/%C1%F5%CB%AB%C7%C5?ie=gbk" target="_blank">刘双桥|百度知道行家</a>
                </li>
                <li><a href="https://www.iyu.pub" target="_blank">且听风吟</a></li>
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
        <div class="guanzhu">扫描二维码，关注<span style="color: #65B020;">桥帮主</span>微信号</div>
        <span href="#" class="weixin"> </span></aside>
</article>
<footer>
    <p>版权所有 ©&nbsp;桥帮主工作室&nbsp;&nbsp; <a href="http://www.miitbeian.gov.cn/" target="_blank">鄂ICP备15020852号-1</a> <a
            href="/">网站统计</a></p>
</footer>
<div id="contentWarning" class="service_box warning" style="display: none;">
    <div class="service_project" style="float: left; margin-top: -7px;">温馨提示</div>
    <div class="close_button" style="margin-left: 90%;">
        <a href="javascript:void(0);" onclick="hideContentWarning(this)"></a>
    </div>
    <div class="clear"></div>
    <div class="">
        <div class="">
            <div id="msg_err" class="" style="font-size: 20px; margin-top: 12%; float: left; margin-left: 5%;">所投放代码位已被其他广告占用，无法重复投放！</div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<script type="text/javascript">
    function hideContentWarning() {
        $("#contentWarning").css("display","none");
    }
    function showLoginBox(){
        $('#contentWarning').css("display","block");
    }
</script>
</body>
</html>

