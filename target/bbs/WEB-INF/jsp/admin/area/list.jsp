<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>区</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../../../lib/bootstrap-switch/bootstrap-switch.min.css">
    <script src="../../../../lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="../../../../lib/bootstrap/bootstrap.min.js"></script>
    <script src="../../../../../lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <link rel="stylesheet" href="../../../../../css/admin/admin_pages.css">
    <style>
        .post-sort {
            line-height: 20px;
            font-size: 16px;
            padding-top: 8px;
        }
    </style>

</head>
<body>
<div class="container-fluid">
    <h2 class="text-center">区列表</h2>
    <br>
    <div class="row">
        <div class="col-md-offset-7 col-md-1 text-md post-sort">
            时间&nbsp;&nbsp;<a href="#"><span class="glyphicon glyphicon-sort-by-attributes"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="#"><span class="glyphicon glyphicon-sort-by-attributes-alt"></span></a>
        </div>
        <div class="col-md-1 post-sort">
            热度 <span class="glyphicon glyphicon-sort-by-attributes"></span>&nbsp;&nbsp;<span
                class="glyphicon glyphicon-sort-by-attributes-alt"></span>
        </div>
        <div class="col-md-2">
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
                    <th>标题</th>
                    <th>区简介</th>
                    <th>创建时间</th>
                    <th>贴子数</th>
                    <th>修改</th>
                    <th>删除</th>
                    </thead>
                    <tbody>
                    <tr>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                    </tr>
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