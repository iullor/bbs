<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>贴子增加</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../../../css/admin/admin_pages.css">
    <script src="../../../../lib/bootstrap/bootstrap.min.js"></script>
    <style>
        .input-group {
            bottom: 40px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <h2 class="text-center">贴子增加</h2>
    <br>
    <div class="row">
        <div class="col-md-4">
            <div>
                <h3>添加分类</h3>
            </div>
            <form action="">
                <div class="form-group">
                    <input type="text" class="form-control">
                    <button type="submit" class="btn btn-info">提交</button>
                    <button type="reset" class="btn btn-default">重置</button>
                </div>
            </form>

        </div>
        <div class="col-md-offset-2 col-md-4">
            <div>
                <h3>现有分类</h3>
            </div>
            <div class="form-group">
                <select name="" class="form-control" multiple>
                    <option value="">a</option>
                    <option value="">a</option>
                    <option value="">a</option>
                    <option value="">a</option>
                    <option value="">a</option>
                    <option value="">a</option>
                </select>
            </div>
        </div>
    </div>
    <hr>

</div>
</body>
</html>