<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加新用户</title>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">--%>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap-switch/bootstrap-switch.min.css">
    <script src="${pageContext.request.contextPath}/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap/jd/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/admin_pages.css">
    <style>
        body {
            font-size: 18px;
        }

        h2 {
            margin-top: 100px;
            margin-left: 350px;
        }

    </style>
</head>
<body>
<div class="container-fluid">
    <h2>
        注册新用户
    </h2>
    <div class="col-md-1" style="margin-top: 10px">
        <a href=""><span class="glyphicon glyphicon-arrow-left" id="back">返回</span></a>
    </div>
    <div class="row" style="margin-top: 100px;">
        <div class="col-md-offset-3 col-md-6">
            <form action="${pageContext.request.contextPath}/admin/user/add" method="post" role="form">
                <input type="hidden" name="userAccountStatus.status" value="1"/>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label for="Username" class="control-label">Username
                            <small>&nbsp;(必填)</small>
                        </label>
                        <input type="text" id="Username" class="form-control" placeholder="Username" name="username">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="Nickname" class="control-label">Nickname
                            <small>&nbsp;(必填)</small>
                        </label>
                        <input type="text" id="Nickname" class="form-control" placeholder="Nickname" name="nickName">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-10">
                        <label class="control-label">Password
                            <small>&nbsp;(必填)</small>
                        </label>
                        <input type="password" class="form-control input_width" name="password" id="Password"
                               placeholder="password">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-10">
                        <label class="control-label">Check Password
                            <small>&nbsp;(必填)</small>
                        </label>
                        <input type="password" class="form-control input_width"
                               id="Check_Password"
                               placeholder="Check_Password">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-11">
                        <label class="control-label">Email
                            <small>&nbsp;(必填)</small>
                        </label>
                        <input type="email" class="form-control input_width" name="email" id="Email"
                               placeholder="abc@gmail.com">
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-md-2">
                        <label for="panelDisabled">设置到管理员组</label>
                    </div>
                    <div class="col-md-10">
                        <div class="switch switch-large">
                            <input name="panel.panelDisabled" id="panelDisabled" type="checkbox"
                                   checked="${panel.panelDisabled}"/>
                        </div>
                    </div>
                </div>
                <hr style="margin-top: 60px;">
                <div class="form-group">
                    <div class="col-md-offset-2 col-md-4">
                        <button type="reset" class="btn btn-lg btn-primary">重置</button>
                    </div>
                    <div class="col-md-4">
                        <button type="submit" class="btn btn-lg btn-success">注册</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    $(function () {
        $(".switch-large>input").bootstrapSwitch({
            onText: 'on',
            offText: 'off',
        })


        $("input").css({
            "line-height": "25px",
            "height": "50px"
        })

        $("#back").click(function () {
            window.history.go(-1)
            return false;
        })
    })
</script>

</body>
</html>