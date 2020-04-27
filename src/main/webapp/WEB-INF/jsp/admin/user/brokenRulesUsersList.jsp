<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>违规用户</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/admin_pages.css">
    <script src="${pageContext.request.contextPath}/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap/b/bootstrap.min.js"></script>
    <style>
    </style>
</head>
<body>
<div class="container">
    <h3>违规用户</h3>
    <table class="table table-hover table-striped">
        <thead>
        <th>序号</th>
        <th>名字</th>
        <th>次数</th>
        <th>信息</th>
        </thead>
        <tbody>
        <c:forEach items="${brokenRulesUsers}" var="brokenRule" varStatus="i">
            <tr>
                <td>${i.index+1}</td>
                <td>${brokenRule.user.nickName}</td>
                <td>${brokenRule.times}</td>
                <td>${brokenRule.info}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>