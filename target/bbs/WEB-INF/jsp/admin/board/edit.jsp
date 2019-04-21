<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>模块增加</title>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/lib/bootstrap-switch/bootstrap-switch.min.css">
    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="/lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <link rel="stylesheet" href="../../../../css/admin/admin_pages.css">
    <style>
        #fileClick > span {
            margin-left: 50px;
            font-size: 100px;
        }

        #fileClick > input {
            display: none;
        }

        #showImg {
            width: 100px;
            height: 100px;
        }

        #showImg:hover {
            transition-delay: 200ms;
            width: 120px;
            height: 120px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <h2 class="text-center"></h2>
    <br>
    <div class="row">
        <div class="col-md-1" style="margin-top: 10px">
            <a href=""><span class="glyphicon glyphicon-arrow-left" id="back">返回</span></a>
        </div>
        <div id="addModel" class="col-md-4">
            <%--文件上传的form表单--%>
            <form action="" id="uploadForm">
                <div class="row form-group">
                    <div class="col-md-1">
                        <label for="logo" class="text-left">Logo</label>
                    </div>
                    <div class="col-md-4" id="fileClick">
                        <span class="glyphicon glyphicon-plus"></span>
                        <input type="file" class="form-control" id="logo" name="img">
                    </div>
                    <div class="col-md-offset-2 col-md-5">
                        <img src="/images/superman.png" id="showImg">
                    </div>
                </div>
                <div class="form-group text-center">
                    <button type="button" class="btn btn-default" id="upload">上传</button>
                </div>
            </form>
            <br>
            <form:form action="/admin/board" method="post" modelAttribute="board">
                <c:if test="${not empty board.id}">
                    <input type="hidden" name="_method" value="put">
                    <form:hidden path="id"/>
                </c:if>
                <div class="row form-group">
                    <div class="col-md-1">
                        <label for="boardTitle">标题</label>
                    </div>
                    <div class="col-md-11">
                        <form:input path="boardTitle" class="form-control" id="boardTitle"/>
                    </div>
                </div>
                <input type="hidden" name="logoPath"/>
                <input type="hidden" name="createTime"/>
                <br>
                <div class="row form-group">
                    <div class="col-md-1">
                        <label class="text-left">板块管理者</label>
                    </div>
                    <div class="col-md-11">
                        <form:select cssClass="form-control" path="boardManagerId" items="${users}" itemLabel="username"
                                     itemValue="id"/>
                    </div>
                </div>
                <br>
                <div class="row form-group">
                    <div class="col-md-1">
                        <label class="text-left">添加到模块</label>
                    </div>
                    <div class="col-md-11">
                        <form:select cssClass="form-control" path="panelId" items="${panels}" itemLabel="title"
                                     itemValue="id"/>
                    </div>
                </div>
                <br>
                <div class="row form-group">
                    <div class="col-md-1">
                        <label class="text-left">板块类型</label>
                    </div>
                    <div class="col-md-11">
                        <form:input path="boardType" cssClass="form-control"/>
                            <%--<form:select cssClass="form-control" path="boardType" items="${board}" itemLabel="title"
                                         itemValue="id"/>--%>
                    </div>
                </div>
                <br>
                <div class="row form-group">
                    <div class="col-md-1">
                        <label for="info">简介</label>
                    </div>
                    <div class="col-md-11">
                        <form:textarea id="info" path="info" cols="40" rows="10"/>
                    </div>
                </div>
                <br>
                <div class="row form-group">
                    <div class="col-md-1">
                        <label for="details">功能详情</label>
                    </div>
                    <div class="col-md-11">
                        <form:textarea id="details" path="details" cols="40" rows="10"/>
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
            </form:form>
        </div>
        <div id="listBoard" class="col-md-offset-2 col-md-5">
            编辑的时候查询所有该区的信息
            <div class="row">A</div>
            <div class="row">B</div>
            <div class="row">C</div>
            <div class="row">D</div>
        </div>
    </div>

</div>
<script>
    $(function () {
        $("#back").click(function () {
            window.history.go(-1)
            return false;
        })
        $(function () {
            var innerValue = ${empty board.id} ? '新增板块' : '修改${board.boardTitle}';
            $(".container-fluid>h2").html(innerValue);
        })
        $("#fileClick>span").click(function () {
            $(":file").click();
        })
        $("#upload").click(function () {
            var form = new FormData(document.getElementById("uploadForm"));
            $.ajax({
                url: "/admin/board/fileUpload",
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

    })


</script>
</body>
</html>