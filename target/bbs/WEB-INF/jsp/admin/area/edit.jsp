<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>区域增加</title>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/lib/bootstrap-switch/bootstrap-switch.min.css">
    <script src="../../../../lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="../../../../lib/bootstrap-switch/bootstrap-switch.min.js"></script>
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
            <form:form action="/admin/area" method="post" modelAttribute="area">
                <c:if test="${not empty area.id}">
                    <input type="hidden" name="_method" value="put">
                    <form:hidden path="id"/>
                    <form:hidden path="createTime"/>
                </c:if>
                <div class="row form-group">
                    <div class="col-md-1">
                        <label for="areaTitle">标题</label>
                    </div>
                    <div class="col-md-11">
                        <form:input path="areaTitle" class="form-control" id="areaTitle"/>
                    </div>
                </div>
                <br>
                <div class="row form-group">
                    <div class="col-md-1">
                        <label class="text-left">区域管理者</label>
                    </div>
                    <div class="col-md-11">
                        <form:select cssClass="form-control" path="areaManagerId" items="${users}" itemLabel="username"
                                     itemValue="id"/>
                    </div>
                </div>
                <br>
                <div class="row form-group">
                    <div class="col-md-1">
                        <label class="text-left">添加到板块</label>
                    </div>
                    <div class="col-md-11">
                        <form:select cssClass="form-control" path="boardId" items="${boards}" itemLabel="boardTitle"
                                     itemValue="id"/>
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
        <div id="listarea" class="col-md-offset-2 col-md-5">
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
        var innerValue = ${empty area.id} ? '新增区域' : '修改${area.areaTitle}区';
        $(".container-fluid>h2").html(innerValue);
    })
</script>
</body>
</html>