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
<%--<%@include file="user/login_style.jsp"%>--%>
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
        <c:if test="${sessionScope.get('username')==null || sessionScope.get('username')==''}">
        <a href="${pageContext.request.contextPath}/to_login"><span>登录</span><span class="en">登录</span></a>
        </c:if>
        <c:if test="${sessionScope.get('username')!=null && sessionScope.get('username')!=''}">
        <a><span>${sessionScope.get("username") }</span><span class="en">欢迎您</span></a>
        </c:if>
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
            <figure>
                <c:if test="${Article.categoryId=='1' }">
                <img src="${pageContext.request.contextPath}/images/home/suibi.jpg">
                </c:if>
                <c:if test="${Article.categoryId=='2' }">
                    <img src="${pageContext.request.contextPath}/images/home/java.png">
                </c:if>
                <c:if test="${Article.categoryId=='3' }">
                    <img src="${pageContext.request.contextPath}/images/home/life.jpg">
                </c:if>
                <c:if test="${Article.categoryId=='4' }">
                    <img src="${pageContext.request.contextPath}/images/home/reading.jpg">
                </c:if>
            </figure>
            <ul>
                <div style="width: 520px;max-height:60px; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; word-break: break-all;">
                    <p>${Article.words}</p>
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

<<%--div class="modal fade" id="loginBox" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                <h5 class="modal-title">登录/注册</h5>
            </div>
            <div style="background: rgb(255, 255, 255); margin: -100px auto auto; border: 1px solid rgb(231, 231, 231); border-image: none; width: 400px; height: 200px; text-align: center;">
                <div style="width: 165px; height: 96px; position: absolute;">
                    <div class="tou"></div>
                    <div class="initial_left_hand" id="left_hand"></div>
                    <div class="initial_right_hand" id="right_hand"></div>
                </div>
                <form action="${pageContext.request.contextPath}/login" method="post">
                    <p style="padding: 30px 0px 10px; position: relative;"><span class="u_logo"></span>
                        <input class="ipt" name="username" id="username" type="text" placeholder="请输入用户名或邮箱" value="">
                    </p>
                    <p style="position: relative;"><span class="p_logo"></span>
                        <input class="ipt" name="password" id="password" type="password" placeholder="请输入密码" value="">
                    </p>
                    <div style="height: 50px; line-height: 50px; margin-top: 30px; border-top-color: rgb(231, 231, 231); border-top-width: 1px; border-top-style: solid;">
                        <p style="margin: 0px 35px 20px 45px;"><span style="float: left;"><a style="color: rgb(204, 204, 204);" href="#">忘记密码?</a></span>
               <span style="float: right;"><a style="color: rgb(204, 204, 204); margin-right: 10px;" href="#">注册</a>
                  <input type="submit" value="登录" style="background: rgb(0, 142, 173); padding: 7px 10px; border-radius: 4px; border: 1px solid rgb(26, 117, 152); border-image: none; color: rgb(255, 255, 255); font-weight: bold;">
               </span>
                        </p>
                    </div>
                </form>
            </div>
            <div class="modal_warning_footer">
                <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">关 闭</button>
            </div>
        </div>
    </div>
</div>--%>
<script type="text/javascript">
    function hideContentWarning() {
        $("#contentWarning").css("display","none");
    }
    function showLoginBox(){
        $('#loginBox').modal("show");
    }
</script>
</body>
</html>

