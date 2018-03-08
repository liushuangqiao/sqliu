<%--
  Created by IntelliJ IDEA.
  User: shuangqiao
  Date: 2017/1/11
  Time: 0:15
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

<body>
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
</body>
</html>
