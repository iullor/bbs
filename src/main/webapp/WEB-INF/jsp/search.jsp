<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>搜索结果</title>
    <link rel="icon" type="image/x-icon" href="/images/favicon.ico" />
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <!--sidebar-left样式-->
    <link rel="stylesheet" href="/css/commons/sidebar_left.css">
    <!--login的模态框-->
    <link rel="stylesheet" href="/css/modal/modal_login.css">
    <!--主样式，覆盖前面的样式-->
    <link rel="stylesheet" href="/css/commons/index.css">
    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <!--控制侧栏-->
    <script src="/js/sidebar-left-control.js"></script>
    <style>
        .content {
            margin-top: 50px;
        }

    </style>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/foreground/commons/top-navbar.jsp"/>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-8 col-sm-8 col-md-offset-2 col-md-8 content">
            <h3>搜索结果如下</h3>
            <div class="row">
                <div class="panel-group">
                    <c:if test="${not empty searchResults}">
                        <div class="panel panel-success">
                            <div class="panel-heading">
                                <h4>用户</h4>
                            </div>
                            <c:if test="${searchResults.users.size()>0}">
                                <div class="panel-body">
                                    <table class="table table-striped  table-hover">
                                        <c:forEach items="${searchResults.users}" var="user">
                                            <tr>
                                                <td>
                                                    <a href="/account/${user.id}">
                                                        <img src="" class="showUserHeadImg"
                                                             value="${user.userBaseInfo.headImage}" width="50"
                                                             height="50" alt="">
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="/account/${user.id}">
                                                            ${user.nickName}
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </c:if>
                            <c:if test="${searchResults.users.size()==0}">
                                <div class="text-warning text-center">
                                    <h3>无查询用户</h3>
                                </div>
                            </c:if>
                        </div>
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <h4>分区</h4>
                            </div>
                            <c:if test="${searchResults.areas.size()>0}">
                                <div class="panel-body">
                                    <table class="table table-striped  table-hover">
                                        <c:forEach items="${searchResults.areas}" var="area">
                                            <tr>
                                                <td>
                                                    <a href="/area/${area.id}">${area.areaTitle}</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </c:if>
                            <c:if test="${searchResults.areas.size()==0}">
                                <div class="text-warning text-center">
                                    <h3>没有搜到分区</h3>
                                </div>
                            </c:if>
                        </div>
                        <div class="panel panel-warning">
                            <div class="panel-heading">
                                <h4>话题</h4>
                            </div>
                            <c:if test="${searchResults.topics.size()>0}">
                                <div class="panel-body">
                                    <table class="table table-striped  table-hover">
                                        <c:forEach items="${searchResults.topics}" var="topic">
                                            <tr>
                                                <td><a href="/public/${topic.id}">${topic.topicTitle}</a></td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </c:if>
                            <c:if test="${searchResults.topics.size()==0}">
                                <div class="text-warning text-center">
                                    <h3>暂无相关话题</h3>
                                </div>
                            </c:if>

                        </div>
                        <div class="panel panel-danger">
                            <div class="panel-heading">
                                <h4>贴子</h4>
                            </div>
                            <c:if test="${searchResults.posts.size()>0}">
                                <div class="panel-body">
                                    <table class="table table-striped  table-hover">
                                        <c:forEach items="${searchResults.posts}" var="post">
                                            <tr>
                                                <td><a href="/post/${post.id}">${post.postTitle}</a></td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </c:if>
                            <c:if test="${searchResults.posts.size()==0}">
                                <div class="text-warning text-center">
                                    <h3>没暂无相关贴子</h3>
                                </div>
                            </c:if>

                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script>
    $(function () {
        $("td").click(function () {
            $(this).children("a").click();
        })
        $(".dropdown-toggle").on("click",function () {
            $(".dropdown-menu").toggle();

        })
    })
</script>
</body>
</html>