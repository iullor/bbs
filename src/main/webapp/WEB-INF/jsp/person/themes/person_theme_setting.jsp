<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人管理</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.css">
    <%--左侧栏的样式--%>
    <c:if test="${sessionScope.CURRENT_USER.userLoginInfo.theme==0}">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/person/person_manager-left.css">
    </c:if>
    <c:if test="${sessionScope.CURRENT_USER.userLoginInfo.theme==1}">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/person/person_manager-left-pink.css">
    </c:if>
    <script src="${pageContext.request.contextPath}/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/person-left.js"></script>
    <script src="${pageContext.request.contextPath}/js/sidebar-left-control.js"></script>
    <style>
        .default-preview {
            border: 1px solid #f5f5f5;
            pointer-events: none;
        }

        .default-preview nav {
            background-color: rgba(31, 7, 114, 0.54);
        }

        .default-preview nav a {
            color: white;
        }

        .default-preview-show {
            width: 250px;
            height: 120px;
            margin-top: 10px;
            margin-bottom: 15px;
            border: 1px solid blue;
            border-top-left-radius: 20px;
            border-bottom-right-radius: 20px;
            box-shadow: blue 1px 1px;
        }

        .pink-preview {
            border: 1px solid #f5f5f5;
            pointer-events: none;
        }

        .pink-preview nav {
            background-color: rgba(255, 204, 204, 0.61);
        }

        .pink-preview nav a {
            color: #993333;
        }

        .pink-preview-show {
            width: 250px;
            height: 120px;
            margin-top: 10px;
            margin-bottom: 15px;
            border: 1px solid #FFFFCC;
            border-top-left-radius: 20px;
            border-bottom-right-radius: 20px;
            box-shadow: #FFFFCC 1px 1px;
        }

        .container-inner {
            margin-top: 10px;
            margin-bottom: 150px;
            height: auto !important;
            min-height: 900px;
            background-color: white;
        }
    </style>
</head>
<body>
<%--引入顶栏--%>
<jsp:include page="/WEB-INF/jsp/foreground/commons/top-navbar.jsp"/>
<div class="container-fluid">
    <div class="row main">
        <div class="col-md-offset-1 col-md-2">
            <!--侧边栏信息-->
            <div id="panel-parent" class="panel-group" style="width: 14.3%;">
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="#person-basic-info" data-toggle="collapse" data-parent="#panel-parent">
                                <span class="glyphicon glyphicon-user"></span><span>个人信息</span>
                            </a>
                        </div>
                    </div>
                    <div id="person-basic-info" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li><a href="${pageContext.request.contextPath}/account/${sessionScope.CURRENT_USER.id}" class="">个人主页</a></li>
                                <li><a href="${pageContext.request.contextPath}/person/basic/account" class="">账号信息</a></li>
                                <li><a href="${pageContext.request.contextPath}/person/basic/info" class="">基本信息</a></li>
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
                                <li><a href="${pageContext.request.contextPath}/person/mypost">我的贴子</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="${pageContext.request.contextPath}/person/message/0">
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
                                <li><a href="${pageContext.request.contextPath}/person/collection/myPosts" class="">贴子</a></li>
                                <li><a href="${pageContext.request.contextPath}/person/collection/myAreas" class="">分区</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="${pageContext.request.contextPath}/person/myfocus" class="">
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
                    <div id="person_themes_setting" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li class="active"><a href="${pageContext.request.contextPath}/person/themes/basic" class="">主题显示</a></li>
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
                                <li><a href="${pageContext.request.contextPath}/person/apply" class="">申请</a></li>
                                <li><a href="${pageContext.request.contextPath}/person/apply/progress" class="">进度</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="${pageContext.request.contextPath}/person/myCircle"><span
                                    class="glyphicon glyphicon-globe"></span><span>朋友圈</span></a>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="#createMyBoard" data-toggle="collapse"
                               data-parent="#panel-parent"><span
                                    class="glyphicon glyphicon-cloud"></span><span>话题</span></a>
                        </div>
                    </div>
                    <div id="createMyBoard" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li><a href="${pageContext.request.contextPath}/person/topic/input/0" class="">创建</a></li>
                                <li><a href="${pageContext.request.contextPath}/person/topic" class="">查看</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-8 container-inner">
            <h3 class="text-info">样式设置
                <small>(暂时仅提供两种主题)</small>
            </h3>
            <div class="row" style="margin-top: 50px;">
                <input type="hidden" name="userId" value="${sessionScope.CURRENT_USER.id}">
                <input type="hidden" name="currentTheme" value="${sessionScope.CURRENT_USER.userLoginInfo.theme}">
                <h4 class="text-primary" style="margin-left: 20px">
                    默认(深蓝)
                    <span class="pull-right" style="margin-right: 20px">
                        <small>应用</small>&nbsp;<input type="radio" name="theme" info="深蓝" value="0">
                    </span>
                </h4>
                <hr>
                <div class="col-md-offset-2 col-md-8 default-preview" disabled="true">
                    <div class="row">
                        <nav class="navbar">
                            <div class="container-fluid">
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                            data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                        <span class="sr-only">Toggle navigation</span>
                                    </button>
                                    <a class="navbar-brand" href="#">BBSTU</a>
                                </div>
                                <div class="collapse navbar-collapse" id="b1">
                                    <form class="navbar-form navbar-left" style="margin-left: 250px">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Search">
                                        </div>
                                        <button type="submit" class="btn btn-default">搜索</button>
                                    </form>
                                    <ul class="nav navbar-nav navbar-right">
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                               aria-haspopup="true" aria-expanded="false">登录<span
                                                    class="caret"></span></a>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">Action</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </nav>
                    </div>
                    <div class="row">
                        <div class="col-sm-8">
                            <div style="width: 100%;height: 300px">
                                <img src="${pageContext.request.contextPath}/images/topic/default-image.png" width="500" height="270" alt="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="row default-preview-show">
                                <h3>热门话题</h3>
                            </div>
                            <div class="row default-preview-show">
                                <h3>通知</h3>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <nav class="navbar">
                            <div class="container-fluid">
                                <div class="collapse navbar-collapse" id="b2">
                                    <ul class="nav navbar-nav">
                                        <li><a href="#">默认<span
                                                class="sr-only">(current)</span></a></li>
                                        <li><a href="#">默认</a></li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                               aria-haspopup="true" aria-expanded="false">Dropdown <span
                                                    class="caret"></span></a>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">Action</a></li>
                                                <li><a href="#">Another action</a></li>
                                                <li><a href="#">Something else here</a></li>
                                                <li role="separator" class="divider"></li>
                                                <li><a href="#">Separated link</a></li>
                                                <li role="separator" class="divider"></li>
                                                <li><a href="#">One more separated link</a></li>
                                            </ul>
                                        </li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                               aria-haspopup="true" aria-expanded="false">Dropdown <span
                                                    class="caret"></span></a>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">Action</a></li>
                                                <li><a href="#">Another action</a></li>
                                                <li><a href="#">Something else here</a></li>
                                                <li role="separator" class="divider"></li>
                                                <li><a href="#">Separated link</a></li>
                                                <li role="separator" class="divider"></li>
                                                <li><a href="#">One more separated link</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
            <hr>
            <div class="row" style="margin-top: 50px;">
                <h4 class="text-warning" style="margin-left: 20px">
                    可选(少女粉)
                    <span class="pull-right" style="margin-right: 20px">
                        <small>应用</small>&nbsp;<input type="radio" name="theme" info="少女粉" value="1">
                    </span>
                </h4>
                <hr>
                <div class="col-md-offset-2 col-md-8 pink-preview " disabled="true">
                    <div class="row">
                        <nav class="navbar">
                            <div class="container-fluid">
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                            data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                        <span class="sr-only">Toggle navigation</span>
                                    </button>
                                    <a class="navbar-brand" href="#">BBSTU</a>
                                </div>
                                <div class="collapse navbar-collapse" id="b3">
                                    <form class="navbar-form navbar-left" style="margin-left: 250px">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Search">
                                        </div>
                                        <button type="submit" class="btn btn-default">搜索</button>
                                    </form>
                                    <ul class="nav navbar-nav navbar-right">
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                               aria-haspopup="true" aria-expanded="false">登录<span
                                                    class="caret"></span></a>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">Action</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </nav>
                    </div>
                    <div class="row">
                        <div class="col-sm-8">
                            <div style="width: 100%;height: 300px">
                                <img src="${pageContext.request.contextPath}/images/topic/default-image.png" width="500" height="270" alt="">
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="row pink-preview-show">
                                <h3>热门话题</h3>
                            </div>
                            <div class="row pink-preview-show">
                                <h3>通知</h3>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <nav class="navbar">
                            <div class="container-fluid">
                                <div class="collapse navbar-collapse" id="b4">
                                    <ul class="nav navbar-nav">
                                        <li><a href="#">默认<span
                                                class="sr-only">(current)</span></a></li>
                                        <li><a href="#">默认</a></li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                               aria-haspopup="true" aria-expanded="false">Dropdown <span
                                                    class="caret"></span></a>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">Action</a></li>
                                                <li><a href="#">Another action</a></li>
                                                <li><a href="#">Something else here</a></li>
                                                <li role="separator" class="divider"></li>
                                                <li><a href="#">Separated link</a></li>
                                                <li role="separator" class="divider"></li>
                                                <li><a href="#">One more separated link</a></li>
                                            </ul>
                                        </li>
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                               aria-haspopup="true" aria-expanded="false">Dropdown <span
                                                    class="caret"></span></a>
                                            <ul class="dropdown-menu">
                                                <li><a href="#">Action</a></li>
                                                <li><a href="#">Another action</a></li>
                                                <li><a href="#">Something else here</a></li>
                                                <li role="separator" class="divider"></li>
                                                <li><a href="#">Separated link</a></li>
                                                <li role="separator" class="divider"></li>
                                                <li><a href="#">One more separated link</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        let currentTheme = $(":input[name='currentTheme']").attr("value");
        $(":input[name='theme']").each(function () {
            if ($(this).attr("value") === currentTheme) {
                $(this).attr("checked", true);
            }
        })


        $(":input[name='theme']").on("click", function () {
            let info = $(this).attr("info");
            let chooseThemeOrNot = window.confirm("确定选择 " + info + " 主题 ？");
            if (chooseThemeOrNot) {
                //发送一条ajax 请求，给用户保存主题样式在数据
                //当前用户
                let id = $(":input[name='userId']").attr("value");
                //主题样式的值
                let value = $(this).attr("value");
                $.ajax({
                    //用户的id，主题样式的编号
                    url: '/person/themes/changeTheme?id=' + id + '&&value=' + value,
                    type: 'get',
                    success: function (data) {
                        //成功的话，先更换当前页的样式,刷新页面
                        window.location.href = "/person/themes/basic";
                    }
                })
                return true;
            }
            return false;
        })

    })
</script>
</body>
</html>