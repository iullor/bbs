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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/person/basic_info/person_account.css">
    <script src="${pageContext.request.contextPath}/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/person-left.js"></script>
    <script src="${pageContext.request.contextPath}/js/sidebar-left-control.js"></script>
</head>
<body>
<%--引入顶栏--%>
<jsp:include page="/WEB-INF/jsp/foreground/commons/top-navbar.jsp"/>
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
                                <li><a href="${pageContext.request.contextPath}/account/${sessionScope.CURRENT_USER.id}" class="">个人主页</a></li>
                                <li class="active"><a href="${pageContext.request.contextPath}/person/basic/account" class="">账号信息</a></li>
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
                    <div id="person_themes_setting" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li><a href="${pageContext.request.contextPath}/person/themes/basic" class="">主题显示</a></li>
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
            <h3><b>账号信息</b></h3>
            <hr>
            <div class="row">
                <div class="col-md-9">
                    <form:form action="${pageContext.request.contextPath}/user/updateAccount" id="changeAccount" method="post" modelAttribute="user">
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
                                <button type="reset" class="btn btn-md btn-success">
                                    取消
                                </button>
                            </div>

                        </div>
                    </form:form>
                </div>
                <div class="col-md-3 image text-center">
                    <!--使用Ajax异步上传-->
                    <form action="${pageContext.request.contextPath}/person/basic/accountUploadImg" id="imgForm" enctype="multipart/form-data">
                        <div style="height: 80px;margin-bottom: 10px">
                            <img src="${pageContext.request.contextPath}/images/favicon.ico" width="100px" height="100px"
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
                url: "${pageContext.request.contextPath}/person/basic/accountUploadImg",
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
                        $("img").attr("src", ${pageContext.request.contextPath}+str)
                        $("input[name='userBaseInfo.headImage']").val(e.responseText)
                    }
                }
            })

        })

        /**
         * 表单的判断,看用户名是否注册
         */
        $("#Username").on("change", function () {
            checkNewUser();

        })
        //验证密码是否正确
        $("#Password").blur(function () {
            checkOldPassword();
        })

        //新密码是否合规
        $("#Check_Password").on("change", function () {
            checkNewPassword();
        })

        $("#Repeat_Password").on("change", function () {
            checkRepeatPassword();
        })
        //邮箱是否注册
        $("#Email").on("change", function () {
            checkEmail();
        })
        //在表单提交前判断
        $("#changeAccount").on('submit', function () {
            var checkNewUser1 = checkNewUser();
            var oldPassword = checkOldPassword();
            var newPassword = checkNewPassword();
            var checkRepeatPwd = checkRepeatPassword();
            var checkEmail = checkEmail();
            alert(checkNewUser1)
            alert(oldPassword)
            alert(newPassword)
            alert(checkNewUser1)
            alert(checkRepeatPwd)
            alert(checkEmail)
            /*if (!checkNewUser1 || !oldPassword || !newPassword || !checkRepeatPwd || !checkEmail) {
                return false;
            }*/
            //return checkEmail && oldPassword && newPassword && checkRepeatPwd && checkEmail;
            return false;
        });
    })

    //新用户是否注册
    function checkNewUser() {
        $("#Username").on("change", function () {
            let uname = $("#Username").val();
            var obj = {
                username: uname
            };
            $.ajax({
                type: "post",
                data: JSON.stringify(obj),
                url: '${pageContext.request.contextPath}/person/basic/account/checkUserName',
                contentType: "application/json",
                success: function (data) {
                    if (data.info === '可以使用') {
                        $("#Username").removeClass("input-board-info");
                        $("#Username").removeClass("input-board-danger");
                        $("#Username").attr("title", data.info);
                        $("#Username").addClass("input-board-info");
                        return true;
                    } else {
                        $("#Username").removeClass("input-board-info");
                        $("#Username").removeClass("input-board-danger");
                        $("#Username").attr("title", data.info);
                        $("#Username").addClass("input-board-danger");
                        alert(data.info)
                        return false;
                    }
                }
            })
        })

    }

    //检查新密码的正确性
    function checkOldPassword() {
        let pwd = $("#Password").val();
        if (pwd != null && pwd !== '' && pwd !== 'undefined') {
            var obj = {
                password: pwd
            };
            $.ajax({
                type: 'post',
                data: JSON.stringify(obj),
                url: '${pageContext.request.contextPath}/person/basic/account/checkPassword',
                contentType: "application/json",
                success: function (data) {
                    if (data.info === '密码错误') {
                        $("#Password").removeClass("input-board-info");
                        $("#Password").removeClass("input-board-danger");
                        $("#Password").attr("title", data.info);
                        $("#Password").addClass("input-board-danger");
                        alert("密码错误")
                        return false;
                    } else {
                        $("#Password").removeClass("input-board-info");
                        $("#Password").removeClass("input-board-danger");
                        $("#Password").attr("title", "正确");
                        $("#Password").addClass("input-board-info");
                        return true;
                    }
                }
            })
        }
        return false;
    }

    //检查新密码
    function checkNewPassword() {
        var password = $("#Check_Password").val();
        //验证规则，密码，第一个为字母开头，长度为6-16位
        var regu = "^[a-zA-Z]\\w{5,14}$";
        var re = new RegExp(regu);
        if (!re.test(password)) {
            $("#Check_Password").removeClass("input-board-info");
            $("#Check_Password").removeClass("input-board-danger");
            $("#Check_Password").attr("title", "密码，第一个为字母开头，长度为6-15位");
            alert("密码，第一个为字母开头，长度为6-15位")
            $("#Check_Password").addClass("input-board-danger");
            return false;
        } else {
            $("#Check_Password").removeClass("input-board-info");
            $("#Check_Password").removeClass("input-board-danger");
            $("#Check_Password").attr("title", "密码可用");
            $("#Check_Password").addClass("input-board-info");
            return true;
        }
    }

    //重复检查密码
    function checkRepeatPassword() {
        var new_password = $("#Check_Password").val();
        var repeat_password = $("#Repeat_Password").val();
        if (new_password !== repeat_password) {
            $("#Repeat_Password").removeClass("input-board-info");
            $("#Repeat_Password").removeClass("input-board-danger");
            $("#Repeat_Password").attr("title", "两次密码不一致");
            $("#Repeat_Password").addClass("input-board-danger");
            alert("两次密码不一致")
            return false;
        } else {
            $("#Repeat_Password").removeClass("input-board-info");
            $("#Repeat_Password").removeClass("input-board-danger");
            $("#Repeat_Password").attr("title", "正确");
            $("#Repeat_Password").addClass("input-board-info");
            return true;
        }
    }

    //检查邮箱
    function checkEmail() {
        var email = $("#Email").val();
        //验证规则,邮箱
        var regu = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
        var re = new RegExp(regu);
        if (!re.test(email)) {
            $("#Email").removeClass("input-board-info");
            $("#Email").removeClass("input-board-danger");
            $("#Email").attr("title", "邮箱地址不合法");
            $("#Email").addClass("input-board-danger");
            alert("邮箱地址不合法")
            return false;
        } else {
            $("#Email").removeClass("input-board-info");
            $("#Email").removeClass("input-board-danger");
            $("#Email").attr("title", "可用");
            $("#Email").addClass("input-board-info");
            return true;
        }
    }
</script>
<script>

</script>
</body>
</html>