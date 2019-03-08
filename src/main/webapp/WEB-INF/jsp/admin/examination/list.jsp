<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>审核审查</title>

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
    <h2 class="text-center">审核审查</h2>
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
                    <ul class="nav nav-pills" role="tablist">
                        <li role="presentation"><a href="#">未审核<span class="badge text-warning">42</span></a></li>
                        <li role="presentation"><a href="#">已审核 <span class="badge">3</span></a></li>
                    </ul>
                </div>
            </div>
            <div class="panel-body">
                <table class="table table-hover table-striped table-bordered ">
                    <thead>
                    <th>id</th>
                    <th>用户名</th>
                    <th>事项</th>
                    <th>凭证</th>
                    <th>申请时间</th>
                    <th>说明</th>
                    <th colspan="3">操作</th>
                    </thead>
                    <tbody>
                    <tr>
                        <td><a href="#">a1</a></td>
                        <td><a href="#">a2</a></td>
                        <td><a href="#">a3</a></td>
                        <td>
                            <a href="#" title="点击查看详情">a4</a>
                        </td>
                        <td><a href="#">a5</a></td>
                        <td><a href="#">a6</a></td>
                        <td><a href="#">拒绝</a></td>
                        <td><a href="#">同意</a></td>
                        <td><a href="#">忽略</a></td>
                    </tr>
                    <tr>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                    </tr>
                    <tr>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
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
                    <tr>
                        <td><a href="#">啦啦啦</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                    </tr>
                    <tr>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                    </tr>
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
            <div class="panel-footer">
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
    var arrays = new Array(1, 2, 3);

    $(function () {
        $(".show-evidence").css({"width": "200px", "height": "50px"}).hide();
        $(".nav-pills>li:first-child").attr("class", "active");
        $(".panel-body:last").hide();
        $(".nav-pills>li").click(function () {
            //$(this).siblings() 是dom 元素，需要把他转换为jquery 函数才能使用方法
            $($(this).siblings()).attr("class", "");
            $(this).attr("class", "active");
            var index1 = $(this).index();
            $(".panel-body").hide();
            $(".panel-body").eq(index1).show();
        })

        //先找tr 之后便利
        $("tbody>tr").each(function () {
            //1，显示简介
            var i = $(this).index();
            $(this).children("td").eq(3).on("click", function () {
                confirm("详细请求\n" + arrays[i])
            });
            //2，添加说明

            $(this).children("td").eq(5).on("click", function () {
                var info = prompt("请对" + i + "用户添加说明", "...");
                if (info != null) {
                    alert("添加成功")
                    $(this).jsp(info)
                    // ajax 提交json
                    //window.location = "https://www.baidu.com";
                }

            })

        })
    })
</script>
</body>
</html>