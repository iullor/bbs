<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>增加过滤规则</title>

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
    <h2 class="text-center">增加/修改过滤规则</h2>
    <br>
    <div class="row">
        <div id="addModel" class="col-md-4">
            <form action="" method="post" enctype="multipart/form-data">
                <div class="row form-group">
                    <div class="col-md-1">
                        <label for="keyword">关键字</label>
                    </div>
                    <div class="col-md-11">
                        <input type="text" class="form-control" id="keyword" name="keyword" placeholder="词组/短语">
                    </div>
                </div>
                <br>
                <div class="row form-group">
                    <div class="col-md-1">
                        <label for="info">说明</label>
                    </div>
                    <div class="col-md-6">
                        <select name="info" id="info" class="form-control">
                            <option value="1">辱骂脏话言语</option>
                            <option value="2">反社会反科学</option>
                            <option value="3">反党反国家</option>
                            <option value="4">其他</option>
                        </select>
                    </div>
                </div>
                <br>
                <div class="row form-group" id="other-info">
                    <div class="col-md-1">
                        <label for="details">请填写</label>
                    </div>
                    <div class="col-md-11">
                        <input type="text" class="form-control" id="details" name="details">
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
            编辑的时候查询出来的板块信息
            <div class="row">A</div>
            <div class="row">B</div>
            <div class="row">C</div>
            <div class="row">D</div>
        </div>
    </div>

</div>
<script>
    $(function () {
        var initHeight = $("body").css("height");
        //alert(initHeight)
        $("#other-info").hide();
        $("#info").on("change", function () {
            if ($("#info").val() == 4) {
                //$("body").css("height", "1000px");
                $("#other-info").show();
            } else {
                //$("body").height = initHeight;
                $("#other-info").hide();
            }
        })
    });
</script>
</body>
</html>