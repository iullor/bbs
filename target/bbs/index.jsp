<%--
  Created by IntelliJ IDEA.
  User: gyl
  Date: 19-3-7
  Time: 下午4:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--仅做跳转处理--%>
<%
    request.getRequestDispatcher("/index").forward(request, response);
%>