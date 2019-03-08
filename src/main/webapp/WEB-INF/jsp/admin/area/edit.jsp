<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>区增加</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../../../lib/bootstrap-switch/bootstrap-switch.min.css">
    <script src="../../../../lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="../../../../lib/bootstrap/bootstrap.min.js"></script>
    <script src="../../../../../lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <link rel="stylesheet" href="../../../../../css/admin/admin_pages.css">
    <style>

    </style>

</head>
<body>
<div class="container-fluid">
    <h2 class="text-center">区增加/编辑</h2>
    <br>

    <div class="row">
        <div id="addModel" class="col-md-4">
            <form action="" method="post">
                <div class="row form-group">
                    <div class="col-md-1">
                        <label for="title">标题</label>
                    </div>
                    <div class="col-md-11">
                        <input type="text" class="form-control" id="title" name="title">
                    </div>
                </div>
                <br>
                <div class="row form-group">
                    <div class="col-md-1">
                        <label for="areaManager" class="text-left">区主</label>
                    </div>
                    <div class="col-md-11">
                        <input type="text" class="form-control" id="areaManager" name="areaManager" placeholder="ID">
                    </div>
                </div>
                <br>
                <div class="row form-group">
                    <div class="col-md-1">
                        <label for="info">简介</label>
                    </div>
                    <div class="col-md-11">
                        <textarea id="info" name="info" cols="40" rows="10"></textarea>
                    </div>
                </div>
                <br>
                <div class="row form-group">
                    <div class="col-md-1">
                        <label for="details">功能详情</label>
                    </div>
                    <div class="col-md-11">
                        <textarea id="details" name="details" cols="40" rows="10"></textarea>
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
            </form>
        </div>
        <div id="listBoard" class="col-md-offset-2 col-md-6">
            编辑的时候查询出来的贴子信息列表
            <div class="row">A</div>
            <div class="row">B</div>
            <div class="row">C</div>
            <div class="row">D</div>
        </div>
    </div>

</div>
<script>
</script>
</body>
</html>