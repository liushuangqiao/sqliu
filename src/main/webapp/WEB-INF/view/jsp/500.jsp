<%--
  Created by IntelliJ IDEA.
  User: shuangqiao
  Date: 2017/2/23
  Time: 23:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="author" content="www.sqliu.cn">
<meta name="copyright" content="桥帮主个人博客模板，优雅、稳重、大气,低调">
<title>桥帮主博客|可能有错误</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/error_styles.css" />
 <script src="http://ajax.microsoft.com/ajax/jQuery/jquery-1.7.2.min.js"></script>
<style>
body{
	background:url('${pageContext.request.contextPath}/images/errorpage/bg.png') no-repeat center center #1d1d1d;
	color:#eee;
	font-family:Corbel,Arial,Helvetica,sans-serif;
	font-size:18px;
	
}

#rocket{
	width:275px;
	height:375px;
	background:url('${pageContext.request.contextPath}/images/errorpage/rocket.png') no-repeat;
	margin:60px auto 10px;
	position:relative;
}

/*	Two steam classes. */

.steam1,
.steam2{
	position:absolute;
	bottom:78px;
	left:50px;
	width:80px;
	height:80px;
	background:url('${pageContext.request.contextPath}/images/errorpage/steam.png') no-repeat;
	opacity:0.8;
}
</style>

</head>

<body style="text-align: center">
	<div id="rocket"></div>

	<hgroup>
	<h1>500 &nbsp;&nbsp;&nbsp;&nbsp; Something Wrong</h1>
	<h2>We couldn't find what you were looking for.</h2>
	</hgroup>

	<script
		src="http://www.16sucai.com/uploadfile/show/jQuerycss3muen1/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/script.js"></script>

	<div style="padding: 20px 0; margin-top: 30px;">

		<div style="margin-bottom: 30px; text-align: center;">
			<a style="color:#EEEEEE;" href="${pageContext.request.contextPath}/">苦海无涯回头是岸，返回首页吧</a>
		</div>
	</div>

	<p>
		<p>理想与现实，可能只差一个页面的距离！！</p>
	</p>
	<p></p> 
	
</body>
</html>
