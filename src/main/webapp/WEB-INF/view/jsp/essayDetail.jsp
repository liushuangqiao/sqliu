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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <script src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
    <script src="http://ajax.microsoft.com/ajax/jQuery/jquery-1.7.2.min.js"></script>
    <link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/new.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/backtotop.css" rel="stylesheet">
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
        <a href="${pageContext.request.contextPath}/essay/1/1"><span>生活随笔</span><span class="en">Life</span></a>
        <a href="${pageContext.request.contextPath}/essay/2/1"><span>编程笔记</span><span class="en">Coding</span></a>
        <a href="${pageContext.request.contextPath}/essay/3/1"><span>旅行游记</span><span class="en">Traveling</span></a>
        <a href="${pageContext.request.contextPath}/essay/4/1"><span>读书心得</span><span class="en">Reading</span></a>
        <a href="${pageContext.request.contextPath}/gustBook/list/1"><span>留言版</span><span class="en">Gustbook</span></a>
        <c:if test="${sessionScope.get('username')==null || sessionScope.get('username')==''}">
        <a href="#"><span onclick="setUrlSession()">登录</span><span class="en">登录</span></a>
        </c:if>
        <c:if test="${sessionScope.get('username')!=null && sessionScope.get('username')!=''}">
            <a><span id="userName">${sessionScope.get("username") }</span><span class="en">欢迎您</span></a>
            <a href="#" onclick="userLogout()"><span style="color: blue">退出</span><span class="en">退出</span></a>
        </c:if>
    </nav>
    </nav>
</header>
<%@include file="sqliu_js.jsp"%>
<article class="blogs">
    <h1 class="t_nav"><span>您当前的位置：<a href="${pageContext.request.contextPath}/">首页</a>&nbsp;&gt;&nbsp;<a href="${pageContext.request.contextPath}/essay/${article.categoryId}/1">${article.categoryName}</a>&nbsp;&gt;&nbsp;${article.title}</span></h1>
    <div class="index_about">
            <h2 class="c_titile">${article.title}</h2><span id="essay_id" style="display: none">${article.id}</span>
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
        <div style="margin-top:2%;" id="commenet_target">
            <div style="font-size:15px;background-color:#F8F8F8;width:98%;">
                好友热评
            </div>
            <div style="heiht:10px;">&nbsp;</div>
            <div>
                <table style="line-height: 26px;">
                    <c:forEach items="${commentList}" var="clist" varStatus="vs">
                    <tr>
                        <td rows="2">${clist.words}</td>
                    </tr>
                    <tr>
                        <td width="83%" style="text-align: right">${clist.userName}&nbsp;</td>
                        <td><span><a href="#" onclick="addPraise(${clist.id})">赞</a>（<span id="p_num_${clist.id}">${clist.praise}</span>）&nbsp;</span>
                            <span align="right"><fmt:formatDate pattern="yyyy-MM-dd" value="${clist.createdTime }"></fmt:formatDate></span></td>
                    </tr>
                        <h2 style="border-bottom: #B2BBBB 1px solid;margin-right: 20px;"/>
                    </c:forEach>
                </table>
            </div>

            <div style="margin-top:2%;">
                <p style="font-size:15px;">发表评论
                    <span style="font-size:12px;">
                        <c:if test="${sessionScope.get('username')==''||sessionScope.get('username')==null }">
                            您好，请先<a href="${pageContext.request.contextPath}/to_login">登录</a>
                        </c:if>
                    </span>
                </p>
                <c:choose>
                    <c:when test="${sessionScope.get('username')==''||sessionScope.get('username')==null }">
                        <textarea id="content" disabled style="width:700px;height:80px;resize:none;"></textarea>
                    </c:when>
                    <c:otherwise>
                        <textarea id="content" style="width:700px;height:80px;resize:none;"></textarea>
                    </c:otherwise>
                </c:choose>
            </div>
            <div id="" class="" style="margin-top:1%;">
                <button type="button" style="width:60px;height:25px;" onclick="commit_comment()">发 表</button>
                <span id="warningWords" style="color: red;"></span>
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
                    <li><a href="${pageContext.request.contextPath}essayDetail/${hitsList.id }" title="${hitsList.title}" target="_blank">${hitsList.title}</a></li>
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
    function addPraise(id){
        var praiseNum = $("#p_num_"+id).text();
        $.ajax({
            type : 'POST',
            url : '${pageContext.request.contextPath}/comment/addPraise',
            data : {
                id : id,
                praise : praiseNum,
            },
            success : function(data) {
                if(data=='1') {
                    var sum = parseInt(praiseNum) + 1;
                    $("#p_num_"+id).html("");
                    $("#p_num_"+id).html(sum);
                }
            },
            error : function() {
                console.log("错了");
            }
        })
    }

    function commit_comment(){
        var content = $("#content").val();
        var essayId = $("#essay_id").text();
        var username = $("#userName").text();
        $.ajax({
            type : 'POST',
            url : '${pageContext.request.contextPath}/comment/save',
            data : {
                essayId : essayId,
                words : content,
                username : username,
            },
            success : function(data) {
              if(data=='1'){
                  window.location.href = "/essayDetail/"+${article.id};
              }else if(data=='2'){
                  $("#warningWords").html('');
                  $("#warningWords").html('评论内容为空！');
              }else if(data=='0'){
                  $("#warningWords").html('');
                  $("#warningWords").html('请先<a href="${pageContext.request.contextPath}/to_login">登录</a>！');
              }
            },
            error : function() {
                console.log("错了");
            }
        })
    }
</script>
</html>
