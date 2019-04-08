<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>消息管理</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <!--top栏样式-->
    <link rel="stylesheet" href="/css/commons/top.css">
    <link rel="stylesheet" href="/css/person/message/message.css">

    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="https://cdn.bootcss.com/jsrender/1.0.2/jsrender.js"></script>
    <script src="/lib/bootstrap/bootstrap.min.js"></script>
    <script src="/js/person-left.js"></script>
    <style>

    </style>

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

                    <a class="navbar-brand" href="../../public/index.jsp">BBS-Student</a>
                    <!--
                        搜索框放在导航栏的头，可以在响应式的时候在上面
                    -->
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="row" style="margin-top: 6px">
                        <form>
                            <div class="form-group col-md-8">
                                <input type="text" class="form-control" id="search" placeholder="Search">
                            </div>
                            <div class="form-group col-xs-4 col-sm-4 col-md-4">
                                <button type="submit" class="btn btn-default"><span
                                        class="glyphicon glyphicon-search"></span>Search
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                <c:choose>
                    <c:when test="${empty sessionScope.CURRENT_USER}">
                        <div class="col-xs-12 col-sm-12 col-md-2" style="margin-top: 8px;font-size: 18px">
                            <a id="login" href="#" data-toggle="modal" data-target="#loginModal" data-keyboard="true">请登录<span
                                    class="glyphicon glyphicon-log-in"></span></a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="col-xs-12 col-sm-12 col-md-2"
                             style="margin-top: 8px;font-size: 18px;">
                            <a id="logout" href="/logout">注销<span class="glyphicon glyphicon-log-in"></span></a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </nav>
</header>
<div class="container-fluid">
    <div class="row main">
        <div class=" col-md-offset-1 col-md-2">
            <!--侧边栏信息-->
            <div id="panel-parent" class="panel-group">
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="#person-basic-info" data-toggle="collapse" data-parent="#panel-parent">
                                <span class="glyphicon glyphicon-user"></span><span>个人信息</span>
                            </a>
                        </div>
                    </div>
                    <div id="person-basic-info" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li class="active"><a href="/person/basic/account" class="">账号信息</a>
                                </li>
                                <li><a href="/person/basic/info" class="">基本信息</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="#person_posts" data-toggle="collapse" data-parent="#panel-parent">
                                <span class="glyphicon glyphicon-flag"></span><span>贴子</span>
                            </a>
                        </div>
                    </div>
                    <div id="person_posts" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li><a href="/person/mypost">我的贴子</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="/person/message/0">
                                <span class="glyphicon glyphicon-comment"></span><span>消息</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="#person_collections" data-toggle="collapse" data-parent="#panel-parent">
                                <span class="glyphicon glyphicon-star"></span><span>收藏夹</span>
                            </a>
                        </div>
                    </div>
                    <div id="person_collections" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li><a href="/person/collection/myPosts" class="">贴子</a></li>
                                <li><a href="/person/collection/myAreas" class="">分区</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="/person/myfocus" class="">
                                <span class="glyphicon glyphicon-heart"></span><span>关注</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="#person_themes_setting" data-toggle="collapse"
                               data-parent="#panel-parent"><span
                                    class="glyphicon glyphicon-certificate"></span><span>系统主题</span></a>
                        </div>
                    </div>
                    <div id="person_themes_setting" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li><a href="/person/themes/basic" class="">基本样式</a></li>
                                <li><a href="#" class="">颜色搭配</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="#person_apply" data-toggle="collapse"
                               data-parent="#panel-parent"><span
                                    class="glyphicon glyphicon-send"></span><span>我的申请</span></a>
                        </div>
                    </div>
                    <div id="person_apply" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li><a href="/person/apply" class="">申请版主</a></li>
                                <li><a href="#" class="">申请区主</a></li>
                                <li><a href="#" class="">申请贴子置顶</a></li>
                                <li><a href="#" class="">申请公版展示</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="#friends_circle" data-toggle="collapse"
                               data-parent="#panel-parent"><span
                                    class="glyphicon glyphicon-globe"></span><span>朋友圈</span></a>
                        </div>
                    </div>
                    <div id="friends_circle" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li><a href="#" class="">我的分享</a></li>
                                <li><a href="#" class="">他人</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="#createMyBoard" data-toggle="collapse"
                               data-parent="#panel-parent"><span
                                    class="glyphicon glyphicon-cloud"></span><span>我的公版</span></a>
                        </div>
                    </div>
                    <div id="createMyBoard" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li><a href="#" class="">创造</a></li>
                                <li><a href="#" class="">维修</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="container-message" class="col-md-8">
            <div class="row">
                <div class="row">
                    <ul class="nav nav-tabs" style="margin-left: 15px">
                        <li class="active">
                            <a href="#unRead" data-toggle="tab" target="/person/message/0">
                                未读&nbsp;<span class="badge" style="background-color: red">${messages.size()}</span>
                            </a>
                        </li>
                        <li>
                            <a href="#hasRead" target="/person/message/1" data-toggle="tab">
                                已读
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="row" style="margin-left:5px;margin-bottom: -20px;padding-top: 10px">
                    <div class="col-md-2">
                        <input type="checkbox" class="checkAll">
                        <label>全选</label>
                    </div>
                    <div class="col-md-1 pull-right" style="margin-bottom: 5px">
                        <button id="markHadRead" class="btn btn-sm btn-primary">标记已读</button>
                    </div>
                </div>
                <hr>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="unRead">
                        <c:if test="${not empty messages}">
                            <c:forEach items="${messages}" var="message" varStatus="i">
                                <div class="row">
                                    <div class="col-md-1">
                                        <span style="padding-left: 15px;font-size: 18px" mid="${message.id}">
                                                <input type="checkbox">
                                        </span>
                                    </div>
                                    <div class="col-md-1">
                                        <span style="font-size: 18px">
                                                ${i.index+1}
                                        </span>
                                    </div>
                                    <div class="col-md-1"><a href="#">${message.user.nickName}&nbsp;&nbsp;@你</a></div>
                                    <div class="col-md-3">
                                    </div>
                                    <div class="col-md-5" style="line-height: 10px;">
                                            ${message.message}
                                    </div>
                                    <div class="col-md-1"><a href="#">查看回复</a></div>
                                </div>
                                <hr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty messages}">
                            <div class="row" style="margin-top: 150px;text-align: center;">
                                <h4>暂无新消息</h4>
                            </div>
                        </c:if>
                    </div>
                    <div class="tab-pane fade" id="hasRead">
                        <%--渲染json结果--%>
                        <script type="text/x-jsrender" id="msg">
                            <%--
                                先做判断
                                如果messages.size 大于0 显示
                            --%>
                            {{for messages}}
                                {{:messages}}
                             {{else}}
                                    <div class="row">
                                        <div class="col-md-1">
                                            <span style="margin-left:18px;">{{:#getIndex()+1}}</span>
                                        </div>
                                        <div class="col-md-1"><a href="/account/{{:user.id}}">{{:user.nickName}}</a></div>
                                        <div class="col-md-3">
                                            在 <a href="#">什么地方</a>&nbsp;&nbsp;@你
                                        </div>
                                        <div class="col-md-6" style="line-height: 10px;">
                                                {{:message}}
                                        </div>
                                        <div class="col-md-1"><a href="#">查看回复</a></div>
                                    </div>
                                 <hr>
                             {{/for}}
                        </script>
                        <div class="row" style="margin-top: 150px;text-align: center;">
                            <h4>暂无新消息</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    /* var ueditor = UE.getEditor('showMessage');
     ueditor.getContentTxt()*/

    $("a[href='#hasRead']").click(function () {
        $.ajax({
            url: '/person/message/hasRead/1',
            type: "get",
            contentType: "application/json",
            success: function (messages) {
                console.log(messages)
                //渲染结果
                var html = $("#msg").render(messages);
                $("#hasRead").html(html);
            }
        })
    })

    $(function () {
        $("#markHadRead").on("click", function () {
            $("#unRead input[type='checkbox']").each(function (k, v) {
                //如果标记，就发送请求，标记为已读
                console.log(v)
                console.log($(v).is(":checked"))
                if ($(v).is(":checked")) {
                    var messageId = $(this).parent("span").attr("mid")
                    alert(messageId)
                    $.ajax({
                        url: "/person/message/update/" + messageId,
                        type: "post",
                        contentType: "application/json",
                        success: function () {
                            window.location.href = "/person/message/0";
                        }
                    })
                }
            })
        })
        var numbersNoRead = '${messages.size()}'
        let numbers = parseInt(numbersNoRead);
        if (numbers <= 0) {
            $(".badge").hide();
        }

        $(".checkAll").on("change", function () {
            //如果全选选中，它下面所有的checkbox 都选中
            if ($(this).is(":checked")) {
                $("#unRead input[type='checkbox']").attr("checked",true);
            }else {
                $("#unRead input[type='checkbox']").attr("checked",false);
            }

        })
    })
</script>
</body>
</html>