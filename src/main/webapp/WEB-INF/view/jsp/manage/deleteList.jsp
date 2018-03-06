<%--
  Created by IntelliJ IDEA.
  User: shuangqiao
  Date: 2016/7/23
  Time: 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${getPageHost}/css/bootstrap.css" rel="stylesheet">
    <script src="${getPageHost}/js/jquery-1.12.1.min.js"></script>
    <title>文章列表管理</title>

</head>
<body>
<form id="form1" name="form1" action="" method="post" action="">
   <table class="table">
       <tr class="success">
           <th style="text-align: left;">序号</th>
           <th style="text-align: left;">id</th>
           <th style="text-align: left;">标题</th>
           <th style="text-align: left;">作者</th>
           <th style="text-align: left;">浏览量</th>
           <th style="text-align: left;">分类</th>
           <th style="text-align: left;">操作</th>
       </tr>
       <c:forEach items="${pageInfo.list}" var="alist" varStatus="a">
       <tr class="success" id="tr_${alist.id}">
           <td>${a.index+1}</td>
           <td class="success">${alist.id}</td>
           <td>${alist.title}</td>
           <td>${alist.author}</td>
           <td>${alist.hits}</td>
           <td>${alist.categoryName}</td>
           <td>
               <button type="button" ><a href="${getPageHost}/manage/updateArticle/${alist.id}" target="_blank">修改</a></button>
               <button type="button" onclick="resolve(${alist.id})">还原</button>
           </td>
       </tr>
       </c:forEach>
   </table>
    <div class="page"><%@include file="../page.jsp"%></div>
</form>
<div style="display:none"></div>
</body>
<script type="text/javascript">
    function resolve(id){
        $.ajax({
            type : 'POST',
            url : '${getPageHost}/manage/resolve',
            data : {
                id : id,
            },
            success : function(data) {
                if(data=='1') {
                    $("#tr_"+id).empty();
                }
            },
            error : function() {
                console.log("错了");
            }
        })
    }
</script>
</html>