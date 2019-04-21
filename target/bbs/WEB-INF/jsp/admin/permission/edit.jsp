<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>模块增加</title>

<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">--%>
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/lib/bootstrap-switch/bootstrap-switch.min.css">
    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="/lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <link rel="stylesheet" href="./css/admin/admin_pages.css">
    <style>
        .col-md-11 > .well {
            height: 250px;
        }
        #potions{
            margin-top: 100px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <h2 class="text-center">权限的设置</h2>
    <br>
    <div class="row">
        <div id="editUser" class="col-md-3">
            <h4><i>编辑用户</i></h4>
            <div class="row">
                <div class="col-md-1">
                    <label>id</label>
                </div>
                <div class="col-md-11">
                    <input type="text" class="form-control" id="id" name="id" placeholder="id">
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-md-1">
                    <label class="text-left">信息预览</label>
                </div>
                <div class="col-md-11">
                    <div class="well">
                        哈哈哈哈
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-1">
            <button type="button" class="btn btn-info" id="setRoles">设置角色<span
                    class="glyphicon glyphicon-menu-right"></span>
            </button>
            <button type="button" class="btn btn-default" id="returnUsers"><span
                    class="glyphicon glyphicon-menu-left"></span><span
                    class="glyphicon glyphicon-menu-left"></span>返回
            </button>
        </div>
        <!--用户设置的信息-->
        <form action="">
            <div id="editRoles" class="col-md-2">
                <h4><i>为XXX添加角色</i></h4>
                <div class="form-group">
                    <input type="hidden" name="userId">
                    <select name="role" class="form-control">
                        <option value="-1">请选择</option>
                        <option value="1">超级管理员</option>
                        <option value="2">管理员</option>
                        <option value="3">审核员</option>
                        <option value="4">工作人员</option>
                    </select>
                </div>
            </div>
            <div class="col-md-1">
                <button type="button" class="btn btn-info" id="setPermissions">设置权限<span
                        class="glyphicon glyphicon-menu-right"></span>
                </button>
                <button type="button" class="btn btn-default" id="returnRoles"><span
                        class="glyphicon glyphicon-menu-left"></span><span
                        class="glyphicon glyphicon-menu-left"></span>返回
                </button>
            </div>
            <div id="editPermissions" class="col-md-4">
                <h4><i>为XXX添加权限</i></h4>
                <div class="form-group">
                    <input type="hidden" name="userId">
                    <select name="permissions" class="form-control" multiple>
                        <option value="-1">请选择</option>
                        <option value="0">设置权限</option>
                        <option value="-1">---系统操作-----</option>
                        <option value="1">模块</option>
                        <option value="2">板块</option>
                        <option value="3">分区</option>
                        <option value="4">过滤规则</option>
                        <option value="5">审核</option>
                        <option value="-1">---用户操作-----</option>
                        <option value="6">禁用用户</option>
                        <option value="7">删除用户</option>
                        <option value="8">置顶贴子</option>
                        <option value="9">禁止评论</option>
                        <option value="10">禁止发帖</option>
                    </select>
                </div>
            </div>
        </form>
    </div>
    <div id="potions" class="row text-center">
        <button class="btn btn-info">添加</button>
        <button class="btn btn-default">取消</button>
    </div>
</div>
<script>
    $(function () {
        $("#editUser").next("div").children("button").first().css({"margin-top": "150px"})
        $("#editUser").next("div").children("button").last().css({"margin-top": "50px"})
        $("#editPermissions").prev("div").children("button").first().css({"margin-top": "150px"})
        $("#editPermissions").prev("div").children("button").last().css({"margin-top": "50px"})

        /**
         * 设置按钮
         */
        $("#returnUsers").hide();

        $("form>div").hide();
        $("#setRoles").click(function () {
            $(this).attr("disabled", "disabled");
            $(this).attr("class", "btn btn-default");
            $("#returnUsers").show();
            $("form>div:first-child,div:nth-child(2)").show();
            $("#returnRoles").hide();
        })
        $("#returnUsers").click(function () {
            $(this).hide();
            $("#setRoles").attr("disabled", false);
            $("#setRoles").attr("class", "btn btn-info");
            $("form>div").hide();
        })
        $("#setPermissions").click(function () {
            $(this).attr("disabled", "disabled");
            $(this).attr("class", "btn btn-default");
            $("form>div:last-child").show();
            $("#returnRoles").show();
        })
        $("#returnRoles").click(function () {
            $("form>div:last-child").hide();
            $("#setPermissions").attr("disabled", false);
            $("#setPermissions").attr("class", "btn btn-info");
            $(this).hide();
        })

    })
</script>
</body>
</html>