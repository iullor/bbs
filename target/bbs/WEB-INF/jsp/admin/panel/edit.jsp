<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>模块增加</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../../lib/bootstrap-switch/bootstrap-switch.min.css">
    <script src="../../../../lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="../../../../lib/bootstrap/bootstrap.min.js"></script>
    <script src="../../../../lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <link rel="stylesheet" href="../../../../css/admin/admin_pages.css">
    <style>
        #logo {
            display: none;
        }

        #upload_placeholder > .glyphicon-plus {
            font-size: 70px;
        }

        #upload_placeholder {
            margin-top: 20px;
        }

        #upload_placeholder > .glyphicon-plus:hover {
            width: 80px;
            background-color: rgba(255, 255, 0, 0.18);
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <h2 class="text-center">模块增加/编辑</h2>
    <br>
    <div class="row">
        <div id="addModel" class="col-md-4">
            <c:if test="${not empty pid}">
            <form action="/panel/update" method="post" enctype="multipart/form-data">
                <input type="hidden" name="_method" value="PUT"/>
                <input type="hidden" name="pid" value="${pid}"/>
                </c:if>
                <c:if test="${empty pid}">
                <form action="/panel/add" method="post" enctype="multipart/form-data">
                    </c:if>
                    <div class="row form-group">
                        <div class="col-md-1">
                            <label for="title">标题</label>
                        </div>
                        <div class="col-md-11">
                            <input type="text" class="form-control" id="title" name="title" value="${panelEdit.title}">
                        </div>
                    </div>
                    <br>
                    <div class="row form-group">
                        <div class="col-md-1">
                            <label for="logo" class="text-left">Logo</label>
                        </div>
                        <div id="upload_placeholder" class="col-md-offset-1 col-md-4  text-center">
                            <span class="glyphicon glyphicon-plus"></span>
                            <br>
                            <input type="file" formenctype="multipart/form-data" name="logo" id="logo">
                            <button type="button" class="btn btn-success">
                                上传图片
                            </button>
                        </div>
                        <div class="col-md-4">
                            <img id="showImg" src="../../../img/superman.png" width="150" height="150">
                        </div>
                    </div>
                    <br>
                    <div class="row form-group">
                        <div class="col-md-1">
                            <label class="text-left">模块管理者</label>
                        </div>
                        <div class="col-md-11">
                            <select name="panelManagerId" class="form-control">
                                <option value="-1">请选择</option>
                                <c:if test="${not empty panelEdit.panelManagerId}">
                                    <c:forEach items="${users}" var="user">
                                        <option value="${user.id}"
                                                selected=${user.id==panelEdit.panelManagerId?"selected":""}>${user.username}</option>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty panelEdit.panelManagerId}">
                                    <c:forEach items="${users}" var="user">
                                        <option value="${user.id}">${user.username}</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </div>
                    </div>
                    <br>
                    <div class="row form-group">
                        <div class="col-md-1">
                            <label for="info">简介</label>
                        </div>
                        <div class="col-md-11">
                            <textarea id="info" name="info" cols="40" rows="10">${panelEdit.info}</textarea>
                        </div>
                    </div>
                    <br>
                    <div class="row form-group">
                        <div class="col-md-1">
                            <label for="detail">功能详情</label>
                        </div>
                        <div class="col-md-11">
                            <textarea id="detail" name="detail" cols="40" rows="10"
                            >${panelEdit.detail}</textarea>
                        </div>
                    </div>
                    <br>
                    <div class="row form-group">
                        <div class="col-md-1">
                            <label for="detail">设置可见</label>
                        </div>
                        <div class="col-md-11">
                            <div class="switch switch-large">
                                <input type="checkbox" checked>
                            </div>
                        </div>
                    </div>
                    <br>
                    <div class="row form-group">
                        <div class="col-md-offset-4  col-md-2">
                            <button type="submit" class="btn btn-info">添加</button>
                        </div>
                        <div class="col-md-2">
                            <button type="reset" class="btn btn-info">重置</button>
                        </div>
                    </div>
                </form>
        </div>
        <div id="listBoard" class="col-md-offset-2 col-md-6">
            编辑的时候查询出来的板块信息
            <div class="row">A</div>
            <div class="row">B</div>
            <div class="row">C</div>
            <div class="row">D</div>
        </div>
    </div>

</div>
<script>
    $(function () {
        $(".switch-large>input").bootstrapSwitch({
            onText: 'on',
            offText: 'off'
        })

        $("#upload_placeholder>span").click(function () {
            $(":file").click()
            $(":file").on("change", function () {
                var filePath = $(":file").val()
                var src = window.URL.createObjectURL(this.files[0]);
                var fileFormat = filePath.split(".")
                var fileSuffix = fileFormat[fileFormat.length - 1].toLowerCase()
                if (!fileSuffix.match("png|jpg|jpeg")) {
                    return;
                }
                $("#showImg").attr("src", src)
            })
        })
    })
</script>
</body>
</html>