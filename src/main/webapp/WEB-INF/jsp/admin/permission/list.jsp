<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>权限</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../../../lib/bootstrap-switch/bootstrap-switch.min.css">
    <script src="../../../../lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="../../../../lib/bootstrap/bootstrap.min.js"></script>
    <script src="../../../../../lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <link rel="stylesheet" href="../../../../../css/admin/admin_pages.css">
    <style>
        .input-group {
            bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <h2 class="text-center">权限列表</h2>
    <br>
    <div class="row">
        <div class="col-md-offset-9 col-md-2">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="id/角色/姓名">
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
    <div class="row">
        <div class="col-md-offset-9 col-md-2">
            空位待占，选择框，查询
        </div>
        <div class="col-md-1">
        </div>
    </div>

    <br>
    <div class="panel-group">
        <div class="panel panel-warning">
            <div class="panel-heading">
                <div class="panel-title">
                    权限列表
                </div>
            </div>
            <div class="panel-body">
                <table class="table table-hover table-striped text-left">
                    <thead>
                    <th>id</th>
                    <th>名字</th>
                    <th>角色</th>
                    <th>时间</th>
                    <th>权限显示</th>
                    <th colspan="2">操作--></th>
                    </thead>
                    <tbody>
                    <tr>
                        <td><a href="#">1</a></td>
                        <td><a href="#">啦啦</a></td>
                        <td><a href="#">管理员</a></td>
                        <td><a href="#">1000</a></td>
                        <td><a href="#">修改页面内容</a></td>
                        <td><a href="#">修改</a></td>
                        <td><a href="#">删除</a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="panel-footer panel-default">
                <nav class="Page navigation text-center">
                    <ul class="pagination">
                        <li class="disabled">
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">6</a></li>
                        <li><a href="#">7</a></li>
                        <li><a href="#">8</a></li>
                        <li><a href="#">9</a></li>
                        <li>
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                        <li>
                            <input type="text" class="form-text">&nbsp;/100
                            <input type="button" class="btn btn-success" value="跳转"/>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<script>
</script>
</body>
</html>