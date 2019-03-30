<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>编辑贴子</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <!--top栏样式-->
    <link href="https://cdn.bootcss.com/bootstrap-switch/4.0.0-alpha.1/css/bootstrap-switch.css" rel="stylesheet">
    <link rel="stylesheet" href="../../../../css/commons/commons.css">
    <link rel="stylesheet" href="../../../../css/post/post_edit.css">
    <link rel="stylesheet" href="../../../../css/commons/top.css">
    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/bootstrap.min.js"></script>
    <script src="/lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <script src="/lib/ueditor/ueditor.config.js"></script>
    <script src="/lib/ueditor/ueditor.all.js"></script>

</head>
<body>
<header class="navbar navbar-fixed-top navbar-inverse">
    <nav class="navbar">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 col-sm-4 col-md-4 navbar-header">
                    <button type="button" class="navbar-toggle collapsed glyphicon glyphicon-menu-hamburger"
                            data-toggle="collapse"
                            data-target="#sidebar-wrapper" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <a class="navbar-brand" href="#">BBS-Student</a>
                    <!--
                        搜索框放在导航栏的头，可以在响应式的时候在上面
                    -->
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <form class="navbar-form row">
                        <div class="form-group col-xs-8 col-sm-8 col-md-8">
                            <input type="text" class="form-control" id="search" placeholder="Search">
                        </div>
                        <button type="submit" class="btn btn-default col-xs-4 col-sm-4 col-md-4"><span
                                class="glyphicon glyphicon-search"></span>Search
                        </button>
                    </form>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-2 row text-center">
                    <a href="#">当前用户</a>
                    <a id="login" href="#" data-toggle="modal" data-target="#loginModal" data-keyboard="true">注销<span
                            class="glyphicon glyphicon-log-out"></span></a>
                </div>
            </div>
        </div>
    </nav>
</header>
<div class="container">
    <div class="main">
        <div class="row">
            <div class="col-md-offset-1 col-md-5">
                <div class="row">
                    <ol class="breadcrumb">
                        <li><a href="../../public/index.jsp">Home</a></li>
                        <li><a href="../panel/panel.jsp">Panel</a></li>
                        <li><a href="../board/board.jsp">School</a></li>
                        <li><a href="../area/area.jsp">Computer Science</a></li>
                        <li class="active">new</li>
                    </ol>
                </div>
                <p><span class="text-grey text-md">编辑新帖子</span></p>
                <form:form action="/post" method="post" modelAttribute="post">
                    <c:choose>
                        <c:when test="${not empty post.id}">
                            <input type="hidden" name="_method" value="put">
                            <form:hidden path="id"/>
                            <input type="hidden" name="areaId" value="${post.areaId}"/>
                            <input type="hidden" name="boardId" value="${post.boardId}"/>
                        </c:when>
                        <c:otherwise>
                            <input type="hidden" name="areaId" value="${sessionScope.area.id}"/>
                            <input type="hidden" name="boardId" value="${sessionScope.area.boardId}"/>
                        </c:otherwise>
                    </c:choose>
                    <div class="form-group">
                        <label>标题</label>
                        <form:input type="text" path="postTitle" class="form-control" placeholder="北京的那一夜"/>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label>类型</label>
                                <%--<form:select cssClass="form-control" path="postType" items="${types}" itemLabel="name"
                                             itemValue="id">
                                </form:select>--%>
                            <select name="postType" class="form-control">
                                <c:forEach items="${types}" var="type">
                                    <option value="${type.id}"
                                        ${post.postType == type.name?'selected':''}>${type.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label>分享到，关注的区</label>
                                <%--<form:select name="collection" class="form-control">
                                    <option value="">闲文</option>
                                    <option value="">销售</option>
                                    <option value="">健身</option>
                                    <option value="">学术</option>
                                </form:select>--%>
                        </div>
                    </div>
                    <br>
                    <label>贴子内容</label>
                    <script id="content" name="postContent">
                        ${post.postContent}
                    </script>
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-md-4">
                            <label for="view">私密</label>
                            <input id="view" type="checkbox"/>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px;margin-bottom:80px">
                        <div class="form-group text-center">
                            <button class="btn btn-md btn-default" type="button">取消</button>
                            <button class="btn btn-md btn-warning" type="button">暂存</button>
                            <button class="btn btn-md btn-success" type="submit">发送</button>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
<script>
    UE.getEditor('content', {
        initialFrameHeight: 600,
        initialFrameWidth: 900,
        topOffset: 60,
        toolbars: [
            ['fullscreen', 'undo', 'redo', 'attachment', 'autotypeset', 'horizontal', 'inserttable', 'edittable',
                'simpleupload', 'emotion', 'spechars', 'rowspacingtop', 'rowspacingbottom'],
            ['formatmatch', 'indent', 'justifyleft', 'justifyright', 'justifycenter', 'justifyjustify',
                'bold', 'inserttitle', 'fontfamily', 'fontsize', 'forecolor', 'pagebreak', 'edittip', 'preview'],
        ]
    });
</script>
</body>
</html>