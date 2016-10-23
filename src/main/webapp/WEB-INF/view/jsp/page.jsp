<%@ page import="com.github.pagehelper.PageInfo" %>
<%--
  Created by IntelliJ IDEA.
  User: lhp
  Date: 2015/9/8
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    PageInfo pageInfo=(PageInfo)request.getAttribute("pageInfo");
    int startPage=(int)(pageInfo.getPageNum() -1) / 10 * 10 + 1;
    request.setAttribute("startPage",startPage);
%>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
<div class="page">
        <c:if test="${!pageInfo.isFirstPage}">
            <a href="./1">首页</a>
        </c:if>
        <c:if test="${pageInfo.hasPreviousPage}">
            <a href="./${pageInfo.pageNum - 1}">上一页</a>
        </c:if>

        <c:if test="${startPage>1}">
            <a href="./${startPage - 10}">...</a>
        </c:if>
        <c:forEach begin="${startPage}" end="${startPage + 9>pageInfo.pages? pageInfo.pages:startPage+9}" var="i">
        <%--<c:forEach begin="${startPage}" end="${pageInfo.pages}" var="i">--%>

            <b  <c:if test="${pageInfo.pageNum==i}"> class="active" </c:if> ><a href="./${i}">${i}</a></b>
        </c:forEach>
        <c:if test="${(startPage+9)<pageInfo.pages}">
            <a href="./${startPage+10}">...</a>
        </c:if>
        <c:if test="${pageInfo.hasNextPage}">
            <a href="./${pageInfo.pageNum + 1}">下一页</a>
        </c:if>
        <c:if test="${!pageInfo.isLastPage}">
            <a href="./${pageInfo.pages}">尾页</a>
        </c:if>
</div>
