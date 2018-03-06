<%--
  Created by IntelliJ IDEA.
  User: shuangqiao
  Date: 2016/7/9
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<head>
    <link href="${getPageHost}/css/base.css" rel="stylesheet">
    <link href="${getPageHost}/css/index.css" rel="stylesheet">
</head>
<aside class="right">
    <div class="weather"><iframe width="250" scrolling="no" height="60" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=12&icon=1&num=1"></iframe></div>
    <div class="news">
        <h3>
            <p>最新<span>文章</span></p>
        </h3>
        <ul class="rank">
            <c:forEach items="${pageInfo}" var="Article">
                <li><a href="${getPageHost}/essayDetail/${Article.id }" target="_blank" title="${Article.title}" target="_blank">${Article.title}</a></li>
            </c:forEach>
        </ul>
        <h3 class="ph">
            <p>点击<span>排行</span></p>
        </h3>
        <ul class="paih">
            <c:forEach items="${articleRight}" var="hitsList">
                <li><a href="${getPageHost}/essayDetail/${hitsList.id }" title="${hitsList.title}" target="_blank">${hitsList.title}</a></li>
            </c:forEach>
        </ul>
        <h3 class="links">
            <p>友情<span>链接</span></p>
        </h3>
        <ul class="website">
            <li><a href="http://tieba.baidu.com/f?ie=utf-8&kw=%E5%88%98%E5%8F%8C%E6%A1%A5&fr=search" target="_blank">刘双桥吧</a></li>
            <li><a href="https://zhidao.baidu.com/hangjia/profile/%C1%F5%CB%AB%C7%C5?ie=gbk" target="_blank">刘双桥|百度知道行家</a></li>
            <li><a href="https://www.iyu.pub" target="_blank">且听风吟</a></li>
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
    <a href="/" class="weixin"> </a></aside>
