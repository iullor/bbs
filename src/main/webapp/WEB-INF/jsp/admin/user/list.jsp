<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户信息查询</title>

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

        #warning-info {
            margin-top: 150px;
        }
    </style>

</head>
<body>
<div class="container-fluid">
    <h2 class="text-center">用户信息</h2>
    <br>
    <div class="col-md-offset-8 col-md-4">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="id/昵称">
            <span class="input-group-btn">
                    <button class="btn btn-default">查找<span class="glyphicon glyphicon-search"></span></button>
            </span>
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
                    <th>昵称</th>
                    <th>最近上线时间</th>
                    <th>最近下线时间</th>
                    <th>历史登录次数</th>
                    <th>IP地址</th>
                    <th>用户状态</th>
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
        </div>
        <br>
        <div class="panel panel-info">

            <div class="panel-heading">
                <div class="panel-title">
                    基本信息
                </div>
            </div>
            <div class="panel-body">
                <table class="table table-hover text-left">
                    <thead>
                    <th>id</th>
                    <th>昵称</th>
                    <th>名字</th>
                    <th>城市</th>
                    <th>电话</th>
                    <th>邮箱</th>
                    <th>年龄</th>
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
        <br>
        <div class="panel  panel-danger">
            <div class="panel-heading">
                <div class="panel-title">
                    操作
                </div>
            </div>
            <div class="panel-body">
                <table class="table table-hover text-left">
                    <thead>
                    <th>id</th>
                    <th>昵称</th>
                    <th>禁止发帖</th>
                    <th>禁止评论</th>
                    <th>账户状态</th>
                    <th>添加警告</th>
                    <th>删除</th>
                    </thead>
                    <tbody>
                    <tr>
                        <td><a href="#">a</a></td>
                        <td><a href="#">a</a></td>
                        <td>
                            <div id="banPost" class="switch switch-large">
                                <input type="checkbox" checked>
                            </div>
                        </td>
                        <td>
                            <div id="banComment" class="switch switch-large">
                                <input type="checkbox" checked>
                            </div>
                        </td>
                        <td><a href="#">a</a></td>
                        <td><a href="#warning-info" role="button" class="btn" data-toggle="modal">添加</a></td>
                        <td><a id="deleteA" href="#">删除</a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!--弹出模态框-->
<div id="warning-info" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <form action="" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="gridSystemModalLabel">添加警告信息</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <textarea name="warningInfo" id="" cols="30" rows="10" class="form-control"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary">发送</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    $(function () {
        $("#banComment>input").bootstrapSwitch({
            onText: 'on',
            offText: 'off'
        })
        $("#banPost>input").bootstrapSwitch({
            onText: 'On',
            offText: 'Off'
        });

    })

</script>
</body>
</html>