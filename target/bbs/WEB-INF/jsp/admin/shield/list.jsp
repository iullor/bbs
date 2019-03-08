<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>关键词过滤</title>

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

        .form-text {
            line-height: 25px;
            margin-left: 10px;
            width: 20%;
        }
    </style>

</head>
<body>
<div class="container-fluid">
    <h2 class="text-center">关键词过滤</h2>
    <br>
    <div class="col-md-offset-8  col-md-1">
        <div class="input-group">
            <button class="btn btn-default" id="addInterceptorWords"><span class="glyphicon glyphicon-plus"></span> 增加
            </button>
        </div>
    </div>

    <div class="col-md-2">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="词组">
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
                    <th>词语</th>
                    <th>创建时间</th>
                    <th>修改</th>
                    <th>删除</th>
                    <th>添加人员</th>
                    </thead>
                    <tbody>
                    <tr>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">Tom</a></td>
                    </tr>
                    <tr>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">Jone</a></td>
                    </tr>
                    <tr>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">Peter</a></td>
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
    $(function () {
        $("#addInterceptorWords").on("click", function () {
            window.location = "edit.jsp"
        })
    })
</script>
</body>
</html>