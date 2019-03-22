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

    <link rel="stylesheet" href="../../../../css/commons/commons.css">
    <link rel="stylesheet" href="../../../../css/post/post_edit.css">
    <link rel="stylesheet" href="../../../../css/commons/top.css">

    <script src="../../../../lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="../../../../lib/bootstrap/bootstrap.min.js"></script>
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
            <div class="col-md-offset-1 col-md-9">
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
                <form action="">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="标题">
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" name="" id="" cols="30" rows="10" placeholder="内容"
                                  style="height: 500px"></textarea>
                    </div>
                    <div class="row">
                        <div class="col-md-1" style="text-align: center;height: 30px;padding-top: 10px">
                            <span>类型</span>
                        </div>
                        <div class="col-md-4">
                            <select name="post_type" class="form-control">
                                <option value="">闲文</option>
                                <option value="">销售</option>
                                <option value="">健身</option>
                                <option value="">学术</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2">
                            是否私密
                        </div>
                        <div class="col-md-1">
                            <input type="checkbox">
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group text-center">
                            <button class="btn btn-success" type="submit">发送</button>
                            <button class="btn btn-default" type="button">取消</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!--&lt;!&ndash;按钮&ndash;&gt;
        <div class="row">
            <div class="text-center">
                <button class="btn btn-info">取消</button>
                <button class="btn btn-success">保存</button>
            </div>
        </div>-->
    </div>
</div>
<script>

</script>
</body>
</html>