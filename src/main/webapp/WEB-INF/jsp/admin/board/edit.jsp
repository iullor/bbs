<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>模块增加</title>
    <%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">--%>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap-switch/bootstrap-switch.min.css">
    <script src="${pageContext.request.contextPath}/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <link rel="stylesheet" href="../../../../css/admin/admin_pages.css">
    <style>
        body {
            background-color: white;
        }

        #fileClick > span {
            margin-left: 50px;
            font-size: 80px;
        }

        #fileClick > input {
            display: none;
        }

        #showImg {
            width: 100px;
            height: 100px;
        }

        .content {
            margin-top: -50px;
            border-left: 1px solid #f5f5f5;
            border-right: 1px solid #f5f5f5;
            height: 1000px;
            width: 1200px;
            padding-top: 50px;
            padding-left: 80px;
            margin-left: 80px
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div style="margin-top: 10px">
        <a href=""><span class="glyphicon glyphicon-arrow-left" id="back">返回</span></a>
    </div>
    <div class="row">
        <div class="col-md-10">
            <%--文件上传的form表单--%>
            <div style="border: 1px solid white;width: 350px;position: absolute;top:110px;left:820px">
                    <span class="pull-left"
                          style=" writing-mode:vertical-lr; font-size: 30px;margin-top: 30px;margin-left: 20px;">图标</span>
                <form action="" id="uploadForm">
                    <div class="row form-group text-center">
                        <div class="" id="fileClick" style="padding-left: 100px">
                            <span class="glyphicon glyphicon-plus"></span>
                            <input type="file" class="form-control" id="logo" name="img">
                            <button type="button" class="btn btn-default" id="upload">上传</button>
                        </div>
                        <p style="padding: 5px;">
                            <small>大小不过1M,200*200</small>
                        </p>
                    </div>
                    <div class="row text-center">
                        <img src="" value="${pageContext.request.contextPath}/${board.logoPath}" id="showImg">
                    </div>
                </form>
            </div>
            <div class="content">
                <h2 class="text-left"></h2>
                <hr>
                <form:form action="${pageContext.request.contextPath}/admin/board" method="post" modelAttribute="board">
                    <c:if test="${not empty board.id}">
                        <input type="hidden" name="_method" value="put">
                        <form:hidden path="id"/>
                    </c:if>
                    <div class="row form-group">
                        <div class="col-md-2" style="font-size: 17px;">
                            <label for="boardTitle">
                                标题<br>
                                <small>(不超过5个字)</small>
                            </label>
                        </div>
                        <div class="col-md-4">
                            <form:input path="boardTitle" class="form-control" id="boardTitle"/>
                        </div>
                    </div>
                    <input type="hidden" name="logoPath"/>
                    <input type="hidden" name="createTime"/>
                    <br>
                    <div class="row form-group">
                        <div class="col-md-2"  style="font-size: 17px;">
                            <label class="text-left">板块管理者</label>
                        </div>
                        <div class="col-md-4">
                            <form:select cssClass="form-control" path="boardManagerId" items="${users}"
                                         itemLabel="username"
                                         itemValue="id"/>
                        </div>
                    </div>
                    <br>
                    <div class="row form-group">
                        <div class="col-md-2"  style="font-size: 17px;">
                            <label class="text-left">添加到模块</label>
                        </div>
                        <div class="col-md-4">
                            <form:select cssClass="form-control" path="panelId" items="${panels}" itemLabel="title"
                                         itemValue="id"/>
                        </div>
                    </div>
                    <br>
                    <div class="row form-group">
                        <div class="col-md-2"  style="font-size: 17px;">
                            <label class="text-left">
                                板块类型<br>
                                <small>(不超过5字)</small>
                            </label>
                        </div>
                        <div class="col-md-4">
                            <form:input path="boardType" cssClass="form-control"/>
                        </div>
                    </div>
                    <br>
                    <div class="row form-group">
                        <div class="col-md-2"  style="font-size: 17px;">
                            <label for="info">
                                简介<br>
                                <small>(最多150字)</small>
                            </label>
                        </div>
                        <div class="col-md-8">
                            <form:textarea id="info" path="info" cols="40" rows="5" class="form-control"/>
                        </div>
                    </div>
                    <br>
                    <div class="row form-group" >
                        <div class="col-md-2"  style="font-size: 17px;">
                            <label for="details">
                                功能详情<br>
                                <small>(最高300字)</small>
                            </label>
                        </div>
                        <div class="col-md-8">
                            <form:textarea id="details" path="details" cols="40" rows="8" class="form-control"/>
                        </div>
                    </div>
                    <br>
                    <div class="row form-group">
                        <div class="col-md-offset-2  col-md-1">
                            <button type="reset" class="btn btn-default btn-lg">重置</button>
                        </div>
                        <div class="col-md-2">
                            <button type="submit" class="btn btn-info btn-lg">添加</button>
                        </div>
                    </div>
                </form:form>
            </div>
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
            $("h2").html(innerValue);
        })
        $("#fileClick>span").click(function () {
            $(":file").click();
        })
        $("#upload").click(function () {
            var form = new FormData(document.getElementById("uploadForm"));
            $.ajax({
                url: "${pageContext.request.contextPath}/admin/board/fileUpload",
                type: "post",
                data: form,
                processData: false,
                contentType: false,
                error: function (e) {
                    if (e.status == 200) {
                        alert("上传成功")
                        var lastIndex = (e.responseText).search("/webapp/") + 7;
                        var str = (e.responseText).substring(lastIndex, (e.responseText).length)
                        $("#showImg").attr("src", str)
                        $("#showImg").show();
                        $("input[name='logoPath']").val(e.responseText)
                    }
                }
            });
            get();//此处为上传文件的进度条

        })
        if ($("#showImg").attr("src") === '' || $("#showImg").attr("src") == null) {
            $("#showImg").hide();
        }
        //图片回显
        if (${not empty board.id}) {
            var pictruePath = $("#showImg").attr("value");
            var lastIndex = pictruePath.indexOf("/webapp/") + 7;
            var str = (pictruePath).substring(lastIndex, pictruePath.length)
            $("#showImg").attr("src", str)
            $("#showImg").show();
        }
    })


</script>
</body>
</html>