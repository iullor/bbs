<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>贴子列表</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/lib/bootstrap-switch/bootstrap-switch.min.css">
    <link rel="stylesheet" href="/css/admin/admin_pages.css">
    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/bootstrap.min.js"></script>
    <script src="/../lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <style>
        .post-sort {
            line-height: 20px;
            font-size: 16px;
            padding-top: 8px;
        }
        .form-text{
            line-height: 25px;
            margin-left: 10px;
            width: 20%;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <h2 class="text-center">贴子列表</h2>
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
    <div>
        贴子总数 <span name="postTotal">11111</span>
    </div>
    <div class="panel panel-warning">
        <div class="panel-heading">
            <div class="panel-title">
                查询结果
            </div>
        </div>
        <div class="panel-body">
            <table class="table table-hover table-striped text-left">
                <thead>
                <th>id</th>
                <th>标题</th>
                <th>作者</th>
                <th>内容简介</th>
                <th>发布时间</th>
                <th>发布板块</th>
                <th>版块内置顶</th>
                <th>评论</th>
                <th>屏蔽</th>
                <th>删除</th>
                </thead>
                <tbody>
                <tr>
                    <td><a href="#">a</a></td>
                    <td><a href="#">a</a></td>
                    <td><a href="#">a</a></td>
                    <td><a href="#">啦啦啦啦啦了</a></td>
                    <td><a href="#">a</a></td>
                    <td><a href="#">a</a></td>
                    <td>
                        <div class="switch switch-large">
                            <input type="checkbox" checked>
                        </div>
                    </td>
                    <td>
                        <div class="switch switch-large">
                            <input type="checkbox" checked>
                        </div>
                    </td>
                    <td>
                        <div class="switch switch-large">
                            <input type="checkbox" checked>
                        </div>
                    </td>
                    <td><a href="#">a</a></td>
                </tr>
                </tbody>
            </table>
            <div id="contentValidity" class="col-md-offset-3 col-md-4">
                内容简介
            </div>
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
    <br>

</div>
<script>
    $(function () {
        $("#contentValidity").hide();
        $(".switch-large>input").bootstrapSwitch({
            onText: 'on',
            offText: 'off'
        })
        $("tbody>tr>td:nth-child(4)").hover(function () {
            $("#contentValidity").show();
        })
        $("tbody>tr>td:nth-child(4)").mouseleave(function () {
            $("#contentValidity").hide();
        })
    })

</script>
</body>
</html>