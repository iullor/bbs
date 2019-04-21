<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人管理</title>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <!--top栏样式-->
    <link rel="stylesheet" href="/css/commons/top.css">
    <link rel="stylesheet" href="/css/person/person_manager-left.css">
    <link rel="stylesheet" href="/css/person/basic_info/person_account.css">
    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="/js/person-left.js"></script>
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
                    <a class="navbar-brand" href="/index.jsp">BBS-Student</a>
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
                                <li><a href="/person/apply" class="">申请</a></li>
                                <li><a href="/person/apply/progress" class="">进度</a></li>
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
                                    class="glyphicon glyphicon-cloud"></span><span>话题</span></a>
                        </div>
                    </div>
                    <div id="createMyBoard" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li><a href="/person/topic/input/0" class="">创建</a></li>
                                <li><a href="/person/topic" class="">查看</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-8 container-inner">
            <h3><b>账号信息</b></h3>
            <hr>
            <div class="row">
                <div class="col-md-9">
                    <form:form action="/user/updateAccount" method="post" modelAttribute="user">
                        <input type="hidden" name="_method" value="put"/>
                        <form:hidden path="userBaseInfo.headImage"/>
                        <form:hidden path="id"/>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label for="Username" class="control-label">Username
                                            <small>&nbsp;(可选)</small>
                                        </label>
                                        <form:input id="Username" class="form-control" path="username"
                                                    placeholder="Username"
                                                    data-toggle="tooltip" data-placement="on" title="" readonly="true"/>
                                        <small><a href="#update"><span
                                                class="glyphicon glyphicon-edit pull-right">修改</span></a></small>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="Nickname" class="control-label">Nickname
                                            <small>&nbsp;(必填)</small>
                                        </label>
                                        <form:input type="text" id="Nickname" path="nickName" class="form-control"
                                                    placeholder="Nickname"
                                                    data-toggle="tooltip" data-placement="on" title=""
                                                    readonly="true"/>
                                        <small><a href="#update"><span
                                                class="glyphicon glyphicon-edit pull-right">修改</span></a></small>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <label class="control-label">Email
                                            <small>&nbsp;(必填)</small>
                                        </label>
                                        <form:input type="email" class="form-control input_width" path="email"
                                                    id="Email"
                                                    data-toggle="tooltip" data-placement="on" title=""
                                                    placeholder="abc@gmail.com" readonly="true"/>
                                        <small><a href="#update"><span
                                                class="glyphicon glyphicon-edit pull-right">修改</span></a></small>
                                    </div>
                                </div>
                                <hr>
                                <h6><b>密码修改</b></h6>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Password
                                            <small>&nbsp;(现有密码)</small>
                                        </label>
                                        <input type="password" class="form-control input_width"
                                               id="Password"
                                               data-toggle="tooltip" data-placement="on" title=""
                                               placeholder="password">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <label class="control-label">New Password
                                            <small>&nbsp;(必填)</small>
                                        </label>
                                        <form:password class="form-control input_width" path="password"
                                                       id="Check_Password"
                                                       data-toggle="tooltip" data-placement="on" title=""
                                                       placeholder="password"/>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label class="control-label">Repeat Password
                                            <small>&nbsp;(必填)</small>
                                        </label>
                                        <input type="password" class="form-control input_width"
                                               id="Repeat_Password"
                                               data-toggle="tooltip" data-placement="on" title=""
                                               placeholder="password">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-md-offset-2 col-md-2">
                                <button type="submit" class="btn btn-md btn-success">
                                    提交
                                </button>&nbsp;&nbsp;&nbsp;
                            </div>
                            <div class="col-md-offset-2 col-md-2">
                                <button type="submit" class="btn btn-md btn-success">
                                    取消
                                </button>
                            </div>

                        </div>
                    </form:form>
                </div>
                <div class="col-md-3 image text-center">
                    <!--使用Ajax异步上传-->
                    <form action="/person/basic/accountUploadImg" id="imgForm" enctype="multipart/form-data">
                        <div style="height: 80px;margin-bottom: 10px">
                            <img src="/images/favicon.ico" width="100px" height="100px"
                                 style="margin-top: -50px;margin-right:10px "/>
                            <span class="glyphicon glyphicon-plus" id="uploadImage"></span>
                        </div>
                        <input type="file" name="headImage" id="headImage">
                        <button type="button" id="headImageUpload" style="margin-top: 10px" class="btn btn-info">上传头像
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        var realPath = $("input[name='userBaseInfo.headImage']").val();
        let beginIndex = realPath.lastIndexOf("/webapp/") + 7;
        let endIndex = realPath.length;
        var relativePath = realPath.substring(beginIndex, endIndex);
        $("img").attr("src", relativePath);


        $("a[href='#update']").on("click", function () {
            $(this).parents("small").prev("input").attr("readonly", false);
        })
        $("#uploadImage").click(function () {
            $(":input[type='file']").click();
        })

        //通过ajax 来上传文件
        $("#headImageUpload").on("click", function () {
            var form1 = document.getElementById("imgForm");
            var form = new FormData(form1);
            $.ajax({
                url: "/person/basic/accountUploadImg",
                method: 'post',
                data: form,
                processData: false,
                contentType: false,
                success: function (data) {
                    if (data.status == 200) {
                    }
                },
                error: function (e) {
                    if (e.status == 200) {
                        alert("上传成功")
                        var lastIndex = (e.responseText).search("/webapp/") + 7;
                        var str = (e.responseText).substring(lastIndex, (e.responseText).length)
                        $("img").attr("src", str)
                        $("input[name='userBaseInfo.headImage']").val(e.responseText)
                    }
                }
            })

        })


        /**
         * 表单的判断,看用户名是否注册
         */
        $("#Username").on("change", function () {
            let uname = $(this).val();
            var obj = {
                username: uname
            }
            $.ajax({
                type: "post",
                data: JSON.stringify(obj),
                url: '/person/basic/account/checkUserName',
                contentType: "application/json",
                success: function (data) {
                    if (data.info === '可以使用') {
                        $("#Username").removeClass("input-board-info");
                        $("#Username").removeClass("input-board-danger");
                        $("#Username").attr("title", data.info);
                        $("#Username").addClass("input-board-info");
                    } else {
                        $("#Username").removeClass("input-board-info");
                        $("#Username").removeClass("input-board-danger");
                        $("#Username").attr("title", data.info);
                        $("#Username").addClass("input-board-danger");
                    }
                }
            })
        })
        //验证密码是否正确
        $("#Password").on("change", function () {
            let pwd = $(this).val();
            var obj = {
                password: pwd
            }
            $.ajax({
                type: 'post',
                data: JSON.stringify(obj),
                url: '/person/basic/account/checkPassword',
                contentType: "application/json",
                success: function (data) {
                    if (data.info === '密码错误') {
                        $("#Password").removeClass("input-board-info");
                        $("#Password").removeClass("input-board-danger");
                        $("#Password").attr("title", data.info);
                        $("#Password").addClass("input-board-danger");
                    } else {
                        $("#Password").removeClass("input-board-info");
                        $("#Password").removeClass("input-board-danger");
                        $("#Password").attr("title", "正确");
                        $("#Password").addClass("input-board-info");
                    }
                }
            })

        })

        //新密码是否合规
        $("#Check_Password").on("change", function () {
            var password = $(this).val();
            //验证规则，密码，第一个为字母开头，长度为6-16位
            var regu = "^[a-zA-Z]\\w{5,14}$";
            var re = new RegExp(regu);
            if (!re.test(password)) {
                $("#Check_Password").removeClass("input-board-info");
                $("#Check_Password").removeClass("input-board-danger");
                $("#Check_Password").attr("title", "密码，第一个为字母开头，长度为6-15位");
                $("#Check_Password").addClass("input-board-danger");
            } else {
                $("#Check_Password").removeClass("input-board-info");
                $("#Check_Password").removeClass("input-board-danger");
                $("#Check_Password").attr("title", "密码可用");
                $("#Check_Password").addClass("input-board-info");
            }
        })

        $("#Repeat_Password").on("change", function () {
            var new_password = $("#Check_Password").val();
            var repeat_password = $(this).val();
            if (new_password !== repeat_password) {
                $(this).removeClass("input-board-info");
                $(this).removeClass("input-board-danger");
                $(this).attr("title", "两次密码不一致");
                $(this).addClass("input-board-danger");
            } else {
                $(this).removeClass("input-board-info");
                $(this).removeClass("input-board-danger");
                $(this).attr("title", "正确");
                $(this).addClass("input-board-info");
            }

        })

        //邮箱是否注册
        $("#Email").on("change", function () {
            var email = $(this).val();
            //验证规则,邮箱
            var regu = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
            var re = new RegExp(regu);
            if (!re.test(email)) {
                $("#Email").removeClass("input-board-info");
                $("#Email").removeClass("input-board-danger");
                $("#Email").attr("title", "邮箱地址不合法");
                $("#Email").addClass("input-board-danger");
            } else {
                $("#Email").removeClass("input-board-info");
                $("#Email").removeClass("input-board-danger");
                $("#Email").attr("title", "可用");
                $("#Email").addClass("input-board-info");
            }
        })
        //在表单提交前判断
        $("form[action='/user/updateAccount']").submit(function () {
            if ($(".input-board-danger").size() > 0) {
                alert("请按规定填写信息")
                return false;
            }
            if ($("#Check_Password").val().length > 0) {
                alert("请输入新密码");
                return false;
            }
        });
    })
</script>

</body>
</html>