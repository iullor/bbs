<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>模块信息展示</title>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">--%>
    <link rel="icon" type="image/x-icon" href="/images/favicon.ico" />
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <script src="/lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="/lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <link rel="stylesheet" href="/css/admin/admin_pages.css">
    <style>
        #upload_placeholder .glyphicon-plus {
            font-size: 100px;
        }

        #logo {
            display: none;
        }

        #showImg {
            width: 100px;
            height: 100px;
        }

        #showImg:hover {
            transition-delay: 200ms;
            height: 150px;
            width: 150px;
        }

        #uploadForm > div:nth-child(2) {
            top: 20px;
        }
    </style>
    <script>
    </script>
</head>
<body>
<div class="container-fluid">
    <h2 class="text-center"></h2>
    <br>
    <div class="row" style="margin-top: 70px;">
        <div class="col-md-1" style="margin-top: 10px">
            <a href=""><span class="glyphicon glyphicon-arrow-left" id="back">返回</span></a>
        </div>
        <div id="addModel" class="col-md-4">
            <%--
                modelAttribute="panel"该标签去请求中找一个panel 的对象
                这里判断，是否panel中有值，
                该值在/panel/input/{id} 中获取id，
                    用pid，查询db，有的话，赋值给 panel，传递给页面，页面通过panel.id 是否有值，来判断是否添加隐藏域，给springmvc框架标示为restful 接口风格
            --%>
            <form:form action="/admin/panel" modelAttribute="panel" method="post">
                <c:if test="${not empty panel.id}">
                    <input type="hidden" name="_method" value="put">
                    <form:hidden path="id"/>
                </c:if>
                <div class="row form-group">
                    <div class="col-md-1">
                        <label for="title">标题</label>
                    </div>
                    <div class="col-md-11">
                        <form:input path="title" class="form-control" id="title"/>
                    </div>
                </div>
                <form:hidden path="logoPath"/>
                <form:hidden path="createTime"/>
                <br>
                <div class="row form-group">
                    <div class="col-md-1">
                        <label class="text-left">模块管理者</label>
                    </div>
                    <div class="col-md-11">
                        <form:select cssClass="form-control" path="panelManagerId" items="${users}" itemLabel="username"
                                     itemValue="id"/>
                    </div>
                </div>
                <br>
                <div class="row form-group">
                    <div class="col-md-1">
                        <label for="info">简介</label>
                    </div>
                    <div class="col-md-11">
                        <form:textarea path="info" id="info" cols="60" rows="10"/>
                    </div>
                </div>
                <br>
                <div class="row form-group">
                    <div class="col-md-1">
                        <label for="detail">功能详情</label>
                    </div>
                    <div class="col-md-11">
                        <form:textarea id="detail" path="detail" cols="60" rows="10"/>
                    </div>
                </div>
                <br>
                <div class="row form-group">
                    <div class="col-md-1">
                        <label for="panelDisabled">设置可见</label>
                    </div>
                    <div class="col-md-11">
                        <div class="switch switch-large">
                            <input name="panel.panelDisabled" id="panelDisabled" type="checkbox"
                                   checked="${panel.panelDisabled}"/>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row form-group">
                    <div class="col-md-offset-4  col-md-2">
                        <button type="submit" class="btn btn-info btn-lg">添加</button>
                    </div>
                    <div class="col-md-2">
                        <button type="reset" class="btn btn-default btn-lg">重置</button>
                    </div>
                </div>
            </form:form>
        </div>
        <div id="addImg" class=" col-md-offset-1 col-md-6">
            <form action="" id="uploadForm">
                <div class="row form-group">
                    <div class="col-md-2">
                        <label for="logo" class="text-left"
                               style=" writing-mode:vertical-lr; font-size: 30px;margin-top: 30px;margin-left: 30px">Logo</label>
                    </div>
                    <div class="col-md-offset-1 col-md-4">
                        <img id="showImg" src="/images/superman.png">
                    </div>
                </div>
                <div class="row form-group">
                    <div id="upload_placeholder" class="col-md-4 text-center">
                        <span class="glyphicon glyphicon-plus"></span>
                        <br>
                        <input type="file" formenctype="multipart/form-data" name="img" id="logo"/>
                        <button id="upload" type="button" class="btn btn-success">
                            上传图片
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</div>
<script>
    $(function () {
        $("#back").click(function () {
            window.history.go(-1);
            return false;
        })
        var str = ${not empty panel.id} ? '模块修改' : '模块增加';
        $("h2").html(str)

        $(".switch-large>input").bootstrapSwitch({
            onText: 'on',
            offText: 'off',
        })

        //文件上传
        $("#upload_placeholder>span").click(function () {
            $(":file").click()
        })
        $("#upload").click(function () {
            var form = new FormData(document.getElementById("uploadForm"));
            $.ajax({
                url: "/admin/panel/fileUpload",
                type: "post",
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
                        /**
                         * 找到相对位置
                         * @type {number}
                         */
                        var lastIndex = (e.responseText).search("/webapp/") + 7;
                        var str = (e.responseText).substring(lastIndex, (e.responseText).length)
                        $("#showImg").attr("src", str)
                        $("input[name='logoPath']").val(e.responseText)
                    }
                }
            });
            get();//此处为上传文件的进度条
        })

        //表单判断
        $("form:first-child").submit(function () {
            var title = $(":input[name='title']").val();
            var info = $(":input[name='info']").val();
            var detail = $(":input[name='detail']").val();
            var logoPath = $(":input[name='logoPath']").val();
            if (title == null || title === '') {
                alert("请填写标题")
                return false;
            }
            if (info == null || info === '') {
                alert("请填写简介")
                return false;
            }
            if (detail == null || detail === '') {
                alert("请填写详情信息")
                return false;
            }
            if (logoPath == null || logoPath === '') {
                alert("请先上传文件")
                return false;
            }
            return true;
        })

        //图片回显
        if (${not empty panel.id}) {
            var pictruePath = $("#logoPath").val();
            var lastIndex = pictruePath.search("/webapp/") + 7;
            var str = (pictruePath).substring(lastIndex, pictruePath.length)
            $("#showImg").attr("src", str)
        }
    })

</script>
</body>
</html>