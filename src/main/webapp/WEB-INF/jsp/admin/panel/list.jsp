<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>模块</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../../lib/bootstrap-switch/bootstrap-switch.min.css">
    <script src="../../../../lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="../../../../lib/bootstrap/bootstrap.min.js"></script>
    <script src="../../../../lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <link rel="stylesheet" href="../../../../css/admin/admin_pages.css">
    <style>
        .input-group {
            bottom: 20px;
        }

        #warning-info {
            margin-top: 150px;
        }
    </style>

</head>
<body>
<div class="container-fluid">
    <h2 class="text-center">模块列表</h2>
    <br>
    <div class="col-md-offset-9 col-md-2">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="id/昵称">
            <span class="input-group-btn">
                    <button class="btn btn-default">查找<span class="glyphicon glyphicon-search"></span></button>
            </span>
        </div>
    </div>
    <div class="col-md-1">
        <div class="input-group">
            <button class="btn btn-default">显示全部 <span class="glyphicon glyphicon-menu-hamburger"></span></button>
        </div>
    </div>

    <br>
    <div class="panel-group">
        <div class="panel panel-warning">
            <div class="panel-heading">
                <div class="panel-title">
                    状态信息
                </div>
            </div>
            <div class="panel-body">
                <table class="table table-hover table-striped text-left">
                    <thead>
                    <th>id</th>
                    <th>logo</th>
                    <th>标题</th>
                    <th>板块简介</th>
                    <th>创建时间</th>
                    <th>修改</th>
                    <th>删除</th>
                    </thead>
                    <tbody>
                    ${panelList}
                    <c:forEach items="${panelList}" var="p" varStatus="i">
                        <tr>
                            <td><a href="#">${p.id}</a></td>
                            <td><a href="#">${p.logoPath}</a></td>
                            <td><a href="#">${p.title}</a></td>
                            <td><a href="#">${p.info}</a></td>
                            <td><a href="#">
                                <f:formatDate value="${p.createTime}" pattern="yyyy-MM-dd HH-mm-ss"/>
                            </a></td>
                            <td><a href="/panel/edit?id=${p.id}">编辑</a></td>
                            <td><a href="/panel/delete?id=${p.id}">删除</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script>
</script>
</body>
</html>