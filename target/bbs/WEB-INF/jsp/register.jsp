<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>新用户注册</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/commons/register.css">
    <link rel="stylesheet" href="../../css/commons/index.css">
    <script src="../../lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="../../lib/bootstrap/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-1">
            <p>注册</p>
        </div>
        <div class="col-md-8">
            <form action="/user/save" method="post" role="form" enctype="multipart/form-data">
                <p>
                    请认真填写如下信息
                </p>
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
                    <div class="form-group col-md-12">
                        <label class="control-label">Password
                            <small>&nbsp;(必填)</small>
                        </label>
                        <input type="password" class="form-control input_width" name="password" id="Password"
                               placeholder="password">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="control-label">Check Password
                            <small>&nbsp;(必填)</small>
                        </label>
                        <input type="password" class="form-control input_width"
                               id="Check_Password"
                               placeholder="Check_Password">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <label class="control-label">Email
                            <small>&nbsp;(必填)</small>
                        </label>
                        <input type="email" class="form-control input_width" name="email" id="Email"
                               placeholder="abc@gmail.com">
                    </div>
                </div>

                <%--<p style="margin-top: 30px;">基本信息>非必须，建议完善</p>
                <hr style="background-color: grey;height: 1px; border: none;width: 92%;margin-left: 0px">
                <div class="row" style="width: 92%">
                    <div class="form-group col-md-4">
                        <label class="control-label">姓名
                            <small>&nbsp;(必填)</small>
                        </label>
                        <input type="text" class="form-control" name="name" id="Name"
                               placeholder="zhangsan">
                    </div>
                    <div class="form-group col-md-4">
                        <label class="control-label">age
                            <small>&nbsp;(必填)</small>
                        </label>
                        <input type="number" class="form-control" name="age" id="Age"
                               placeholder="18">
                    </div>
                    <div class="form-group col-md-4">
                        <label class="control-label">Birthday
                            <small>&nbsp;(必填)</small>
                        </label>
                        <input type="date" class="form-control" name="b" id="Date">
                    </div>
                </div>
                <div class="row" style="width: 92%">
                    <div class="form-group col-md-12">
                        <label class="control-label">QQ
                        </label>
                        <input type="number" class="form-control" name="qqNumber" id="qqNumber"
                               placeholder="100000">
                    </div>
                </div>
                <div class="row" style="width: 92%">
                    <div class="form-group col-md-12">
                        <label class="control-label">Phone Number
                            <small>&nbsp;(必填)</small>
                        </label>
                        <input type="number" class="form-control" name="phoneNumber" id="phoneNumber"
                               placeholder="13781100219">
                    </div>
                </div>
                <div class="row" style="width: 92%">
                    <div class="form-group col-md-4">
                        <label class="control-label">省份
                            <small>&nbsp;(必填)</small>
                        </label>
                        <input type="text" class="form-control" name="province" id="province" placeholder="河南">
                    </div>
                    <div class="form-group col-md-4">
                        <label class="control-label">城市
                            <small>&nbsp;(必填)</small>
                        </label>
                        <input type="text" class="form-control" name="city" id="city" placeholder="郑州市">
                    </div>
                    <div class="form-group col-md-4">
                        <label class="control-label">街道
                            <small>&nbsp;(必填)</small>
                        </label>
                        <input type="text" class="form-control" name="street" id="street" placeholder="金水区">
                    </div>
                </div>
                <div class="row" style="width: 92%">
                    <div class="form-group col-md-12">
                        <label class="control-label">详细地址
                            <small>&nbsp;(必填)</small>
                        </label>
                        <input type="text" class="form-control" name="detail" id="detail">
                    </div>
                </div>--%>
                <hr style="background-color: wheat;height: 1px; border: none;width: 92%;margin-left: 0px">
                <div class="form-group">
                    <div class="col-md-offset-1 col-md-2">
                        <button type="reset" class="btn btn-lg btn-default">取消</button>
                    </div>
                    <div class="col-md-offset-1 col-md-2">
                        <button type="reset" class="btn btn-lg btn-warning">重置</button>
                    </div>
                    <div class="col-md-offset-1 col-md-2">
                        <button type="submit" class="btn btn-lg btn-success">注册</button>
                    </div>
                </div>
            </form>
        </div>
        <%--<div class="col-md-3 image">
            <p> 不超过1M</p>
            <img src="../../images/favicon.ico" width="135px" height="135px"/><br>
            <input type="file" name="headImage">

        </div>--%>
    </div>


</div>
</body>
</html>