<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>操作</title>

<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/lib/bootstrap-switch/bootstrap-switch.min.css">
    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="/lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <link rel="stylesheet" href="/css/admin/admin_pages.css">
    <style>
        #warning-info {
            margin-top: 150px;
        }
    </style>

</head>
<body>
<div class="container-fluid">
    <h2 class="text-center">操作用户</h2>
    <br>
    <div class="col-md-1" style="margin-top: 10px">
        <a href=""><span class="glyphicon glyphicon-arrow-left" id="back">返回</span></a>
    </div>
    <div class="panel-group">
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
        $("#back").click(function () {
            window.history.go(-1)
            return false;
        })
    })

</script>
</body>
</html>