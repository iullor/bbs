<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加话题</title>
    <link rel="icon" type="image/x-icon" href="/images/favicon.ico"/>
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <%--左侧栏的样式--%>
    <c:if test="${sessionScope.CURRENT_USER.userLoginInfo.theme==0}">
        <link rel="stylesheet" href="/css/person/person_manager-left.css">
    </c:if>
    <c:if test="${sessionScope.CURRENT_USER.userLoginInfo.theme==1}">
        <link rel="stylesheet" href="/css/person/person_manager-left-pink.css">
    </c:if>
    <link rel="stylesheet" href="/css/person/basic_info/person_account.css">
    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="/js/person-left.js"></script>
    <script src="/js/sidebar-left-control.js"></script>
    <style>
        .col-md-8 label {
            font-size: 17px;
        }
    </style>
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
                    <div id="person-basic-info" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li><a href="/account/${sessionScope.CURRENT_USER.id}" class="">个人主页</a></li>
                                <li><a href="/person/basic/account" class="">账号信息</a></li>
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
                                <li><a href="/person/themes/basic" class="">主题显示</a></li>
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
                            <a href="/person/myCircle"><span
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
                    <div id="createMyBoard" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li class="active"><a href="/person/topic/input/0" class="">创建</a></li>
                                <li><a href="/person/topic" class="">查看</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-8 container-inner">
            <h3><b>创建话题</b></h3>
            <hr>
            <div class="row">
                <div class="col-md-6">
                    <form:form action="/person/topic" method="post" id="topic" modelAttribute="topic">
                        <%--用来隐藏话题配图的路径--%>
                        <form:hidden path="topicPicture"/>
                        <c:if test="${not empty topic.id}">
                            <form:hidden path="id"/>
                        </c:if>
                        <div class="form-group">
                            <label for="topic-title">话题标题
                                <small>(不超过15字)</small>
                            </label>
                            <form:input id="topic-title" path="topicTitle" class="form-control"></form:input>
                        </div>
                        <div class="form-group">
                            <label>添加配图(图片比例16:9,格式(png/jpg))</label>
                            <input type="file" name="topicPicture1">
                        </div>
                        <div class="form-group">
                            <label>关键词</label>
                            <form:input path="topicKeyword"></form:input>
                            <small>(必须2-6词)</small>
                        </div>
                        <div class="form-group">
                            <label for="topic-title">话题详细描述
                            </label>
                            <form:textarea path="topicDescribe" cols="50" rows="15" class="form-control"
                                           style="font-size: 16px;" placeholder="描述"></form:textarea>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-lg btn-primary"
                                    style="margin-top: 20px">创建
                            </button>
                        </div>
                    </form:form>
                </div>
                <div class="col-md-6">
                    <label for="showPicture" style="margin-top: 20px">
                        配图
                    </label>
                    <p style="z-index: -10;margin-left: 50px;margin-top: 30px">
                        <img id="showPicture" class="showUserHeadImg" value="${topic.topicPicture}"
                             src="/images/topic/default-image.png" value="" width="480" height="270"
                             srcset="">
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        //异步提交图片文件
        $(":file").on("change", function () {
            var form = new FormData(document.getElementById("topic"));
            $.ajax({
                url: "/person/topic/uploadPicture",
                type: "post",
                data: form,
                processData: false,
                contentType: false,
                error: function (data) {
                    console.log(data)
                    if (data.status == 200) {
                        alert("上传成功")
                        let path = data.responseText;
                        $(":hidden[name='topicPicture']").val(path);
                        //alert(path)
                        //图片回显
                        let beginIndex = path.indexOf("/webapp/") + 7;
                        let endIndex = path.length;
                        let src = path.substring(beginIndex, endIndex);
                        $("#showPicture").attr("src", src);
                    }
                }
            });
        })

        $("#topic").submit(function () {
            //表单提交,判断是否有照片,没有的话,就提醒先上传照片
            let path = $(":hidden[name='topicPicture']").val();
            if (path !== null && path !== '' && path !== 'undefined') {
                return true;
            }
            alert("请认真填写所有信息")
            return false;
        })

        let topicId = '${topic.id}';
        if (topicId != null && topicId !== '' && topicId !== 'undefined') {
            //修改新增form表单的action
            $("#topic").attr("action", "/person/topic/edit");
        }
        if (${empty topic.topicPicture}) {
            $("#showPicture").attr("src","/images/topic/default-image.png")
        }
    })
</script>
</body>
</html>