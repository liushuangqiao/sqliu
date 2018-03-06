<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>用户登录</title>
	<link href="${getPageHost}/css/manage/login_css.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${getPageHost}/js/jquery-1.7.2.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#login_sub").click(function(){
				$("#submitForm").attr("action", "index.html").submit();
			});
		});

		/*回车事件*/
		function EnterPress(e){ //传入 event
			var e = e || window.event;
			if(e.keyCode == 13){
				$("#submitForm").attr("action", "index.html").submit();
			}
		}
	</script>
</head>
<body>
<div id="login_center">
	<div id="login_area">
		<div id="login_box">
			<div id="login_form">
				<form id="submitForm" action="user/login" method="post">
					<div id="login_tip">
						<span id="login_err" class="sty_txt2"></span>
					</div>
					<div>
						用户名：<input type="text" name="username" class="username" id="name">
					</div>
					<div>
						密&nbsp;&nbsp;&nbsp;&nbsp;码：<input type="password" name="password" class="pwd" id="pwd" onkeypress="EnterPress(event)" onkeydown="EnterPress()">
					</div>

					<div id="datesheet_box">
						<input type="checkbox" name="" style="width: 15px;float: left;margin-top:4px;">
						<div id="datesheet_n">&nbsp;记住我的信息
							<div id="forget" style="float:right;">忘记密码?
							</div>
						</div>
					</div>
					<div id="btn_area">
						<input type="submit" class="login_btn" id="login_sub"  value="登  录">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>