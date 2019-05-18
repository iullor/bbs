<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>申请贴子置顶</title>
    <link rel="icon" type="image/x-icon" href="/images/favicon.ico" />
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <%--左侧栏的样式--%>
    <c:if test="${sessionScope.CURRENT_USER.userLoginInfo.theme==0}">
        <link rel="stylesheet" href="/css/person/person_manager-left.css">
    </c:if>
    <c:if test="${sessionScope.CURRENT_USER.userLoginInfo.theme==1}">
        <link rel="stylesheet" href="/css/person/person_manager-left-pink.css">
    </c:if>
    <link rel="stylesheet" href="/css/person/post/person_posts.css">
    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="/js/person-left.js"></script>
    <script src="/lib/ueditor/ueditor.config.js"></script>
    <script src="/lib/ueditor/ueditor.all.js"></script>
    <script src="/js/sidebar-left-control.js"></script>
    <style>
        #list > form {
            padding-left: 50px;
        }

        .one-line {
            width: 350px;
            height: 50px;
            margin-top: 20px;
            margin-left: 10px;

        }

        .one-line label {
            font-size: 15px;
            padding-top: 10px;
        }

        .one-line select {
            width: 250px;
            height: 40px;
            background-color: white;
            margin-top: 5px;
            margin-left: 20px;
            font-size: 16px;
            border-radius: 5px;
        }

        .reason {
            margin-top: 50px;
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
                    <div id="person_apply" class="panel-collapse  collapse in">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li class="active"><a href="/person/apply" class="">申请</a></li>
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
        <div id="list" class="col-md-8 container-inner">
            <div class="text-left">
                <h3>申请置顶</h3>
                <hr>
            </div>
            <form action="/person/apply" method="post">
                <div class="one-line">
                    <div class="form-group">
                        <label>类型</label>
                        <select id="options" name="applyType">
                            <option value="-1">请选择</option>
                            <option value="1">贴子置顶</option>
                            <option value="2">版主</option>
                            <option value="3">首页显示话题</option>
                        </select>
                    </div>
                </div>
                <div class="one-line">
                    <div class="form-group">
                        <label>选择</label>
                        <select id="waitOptions" name="post">
                            <option value="">请选择</option>
                        </select>
                    </div>
                </div>
                <div class="reason">
                    <label>输入申请理由</label>
                    <script id="content" name="applyReason">
                    </script>
                </div>
                <input type="hidden" name="brief">
                <div class="form-group" style="margin-top: 10px;text-align: center;margin-left: 450px">
                    <span>&nbsp;</span>
                    <button id="apply1" class="btn btn-warning" type="submit">
                        申请
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
</div>
<script>
    var ueditor = UE.getEditor('content', {
        initialFrameHeight: 400,
        initialFrameWidth: 900,
        topOffset: 60,
        toolbars: [
            ['attachment', 'horizontal', 'simpleupload']
        ]
    });
    $(function () {
        //根据option去判断
        $("#options").on("change", function () {
            let op = $(this).val();
            console.log(op)
            $.ajax({
                url: "/person/apply/" + op,
                type: 'get',
                success: function (data) {
                    console.log(data)
                    var option = '<option value="-1">请选择</option>'
                    $("#waitOptions").empty();
                    $("#waitOptions").append(option);
                    $.each(data, function (index, d) {
                        //数组中，放置的是一个一个对象，通过对象.属性的方式来获取每一个属性的值
                        console.log(d.boardTitle)
                        console.log(d.postTitle)
                        console.log(d.topicTitle)
                        if (d.topicTitle !== 'undefined' && d.topicTitle != null) {
                            $("#waitOptions").append("<option value=" + d.id + ">" + d.topicTitle + "</option>");
                        }
                        if (d.postTitle !== 'undefined' && d.postTitle != null) {
                            $("#waitOptions").append("<option value=" + d.id + ">" + d.postTitle + "</option>");
                        }
                        if (d.boardTitle !== 'undefined' && d.boardTitle != null) {
                            $("#waitOptions").append("<option value=" + d.id + ">" + d.boardTitle + "</option>");
                        }
                    })
                }
            })
            if (op === '1') {
                $("#waitOptions").attr("name", "postId")
            } else if (op === '2') {
                $("#waitOptions").attr("name", "boardId")
            } else if (op === '3') {
                $("#waitOptions").attr("name", "topicId")
            }
        })
        $("#waitOptions").on("click", function () {
            if ($(this).children().length < 2) {
                alert("请先选择类别")
            }
        })
        $("#apply1").on("click", function () {
            var realContentTxt = ueditor.getContentTxt();
            $(":hidden[name='brief']").val(realContentTxt);
        })
    })
</script>
</body>
</html>