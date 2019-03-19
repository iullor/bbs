<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户信息查询</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link href="https://cdn.bootcss.com/bootstrap-switch/3.3.4/css/bootstrap2/bootstrap-switch.css" rel="stylesheet">
    <link rel="stylesheet" href="../../../../css/admin/admin_pages.css">
    <script src="../../../../lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="../../../../lib/bootstrap/bootstrap.min.js"></script>
    <%--<script src="https://cdn.bootcss.com/bootstrap-switch/3.3.4/js/bootstrap-switch.js"></script>--%>
    <script src="/lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <style>
        .options {
            margin-bottom: 20px;
        }
    </style>

</head>
<body>
<div class="container-fluid">
    <h2 class="text-center">违规用户</h2>
    <hr style="margin-top: 70px;margin-bottom:15px">
    <%--操作栏--%>
    <div class="row text-center">

        <div class="col-md-offset-7 col-md-1" style="margin-top: 7px;line-height: 20px;font-size: 15px;">
            时间&nbsp;&nbsp;<a href="#"><span class="glyphicon glyphicon-sort-by-attributes"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="#"><span class="glyphicon glyphicon-sort-by-attributes-alt"></span></a>
        </div>
        <form action="/board/searchByBoardTitle" method="get">
            <div class="col-md-2">
                <div class="form-group">
                    <input type="text" class="form-control" name="inputBoardTitle" placeholder="模块名">
                </div>
            </div>
            <div class="col-md-1">
                <button id="search" type="submit" class="btn btn-default">查找<span
                        class="glyphicon glyphicon-search"></span></button>
            </div>
        </form>
        <div class="col-md-1" style="margin-top: -13px">
            <button type="button" class="btn btn-default" id="searchAll">显示全部 <span
                    class="glyphicon glyphicon-menu-hamburger"></span></button>
        </div>
    </div>
    <br>
    <div class="panel-group">
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="panel-title">
                    列表
                </div>
            </div>
            <div class="panel-body">

                <table class="table table-hover text-left">
                    <thead>
                    <th>id</th>
                    <th>昵称</th>
                    <th>头像</th>
                    <th>贴子数</th>
                    <th>评论数</th>
                    <th>基本信息</th>
                    <th>登录信息</th>
                    <th>操作</th>
                    </thead>
                    <tbody class="parent-tbody">
                    <c:choose>
                        <c:when test="${empty users}">
                            <tr>
                                <td colspan="7">
                                    当前没有一个用户,前去<a href="/register">注册</a>吧
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${users}" var="u" varStatus="i">
                                <tr>
                                    <td>${i.index+1}</td>
                                    <td>${u.nickName}</td>
                                    <td>${u.username}</td>
                                    <td>${u.userBaseInfo.headImage}</td>
                                    <td><a href="#">${u.userAccountStatus.status}</a></td>
                                    <td><a href="#">${u.userAccountStatus.status}</a></td>
                                    <td><a href="/user/userBaseInfo/${u.id}">查看</a></td>
                                    <td><a href="/user/loginStatus/${u.id}">查看</a></td>
                                    <td><a href="/user/options/${u.id}">修改</a></td>
                                </tr>
                                <tr class="options">
                                    <td colspan="12">
                                        <div class="panel  panel-primary">
                                            <div class="panel-heading">
                                                <div class="panel-title">
                                                    操作
                                                </div>
                                            </div>
                                            <div class="panel-body">
                                                <form action="/user/updateUserAccountStatus" method="post">
                                                    <table class="table table-hover">
                                                        <input type="hidden" name="id" value="${u.id}"/>
                                                        <thead>
                                                        <th>禁止发帖</th>
                                                        <th>禁止评论</th>
                                                        <th colspan="2">账户状态</th>
                                                        <th>添加警告</th>
                                                        <th>删除</th>
                                                        </thead>
                                                        <tbody>
                                                        <tr>
                                                            <td>
                                                                <div class="switch switch-large">
                                                                    <input type="checkbox" id="allowPost"
                                                                           name="userAccountStatus.allowPost"
                                                                           value="${u.userAccountStatus.allowPost}"
                                                                           checked/>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <input type="checkbox" id="allowComment"
                                                                       name="userAccountStatus.allowComment"
                                                                       value="${u.userAccountStatus.allowComment}"
                                                                       checked/>
                                                            </td>
                                                            <td colspan="2">
                                                                <select name="userAccountStatus.status"
                                                                        class="form-control">
                                                                    <option value="-1">账户状态</option>
                                                                    <option value="0">待激活</option>
                                                                    <option value="1">冻结</option>
                                                                    <option value="2">正常</option>
                                                                </select>
                                                            </td>
                                                            <td colspan="1">
                                                                <a href="#warning-info" role="button" class="btn"
                                                                   data-toggle="modal">添加</a>
                                                                <input type="hidden"
                                                                       name="userAccountStatus.waringInfo">
                                                            </td>
                                                            <td colspan="1">
                                                                <a id="deleteA" href="/user/${u.id}">删除</a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="7">
                                                                <button type="submit"
                                                                        class="btn btn-sm btn-success pull-right">
                                                                    修改
                                                                </button>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </form>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>

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
        <br>
    </div>
</div>
<!--弹出模态框-->
<div id="warning-info" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
    <div class="modal-dialog" role="document">
        <form action="">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="gridSystemModalLabel">添加警告信息</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <textarea id="warninginfo" cols="30" rows="10" class="form-control"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <button type="submit" id="addWaringInfoBtn" class="btn btn-primary">添加</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script>

    $(function () {
        //禁止info，logon，options显示
       /* $(".options").hide();
*/
        //点击显示，显示指定的
        $(".parent-tbody>tr:even>td:last-child>a").on("click", function () {

            $(this).parent("td").parent("tr").next("tr").slideToggle(0, function () {
                if ($(this).is(":hidden")) {
                } else {
                    /*$(".parent-tbody>tr:odd").hide(0);
                    $(this).show(0);*/
                    /* $(".parent-tbody>tr:odd").fadeOut();
                     $(this).fadeIn();*/
                    $(".parent-tbody>tr:odd").slideUp("fast");
                    $(this).slideDown();
                }
            });
            return false;
        })

        $("input[type='checkbox']").bootstrapSwitch({
            onText: "ON",      // 设置ON文本  
            offText: "OFF",    // 设置OFF文本

           /* // 当开关状态改变时触发  
            onSwitchChange: function (event, state) {
                let access_comment = event.target.defaultValue;
                if (state === true) {
                    //打开禁止
                    let i = confirm("确定要禁用吗?")
                    if (i) {
                        //使用ajax改变用户状态
                        if (access_comment === '1') {
                            $(this).val("0")

                        } else if (access_comment === '0') {
                            $(this).val("1")
                        }
                        alert(access_comment);
                        return true;
                    }
                    return false;
                } else {
                    let i = confirm("确定要恢复吗?")
                    if (i) {
                        //使用ajax改变用户状态
                        if (access_comment === '1') {
                            $(this).val("0")
                        } else if (access_comment === '0') {
                            $(this).val("1")
                        }
                        return true;
                    }
                    return false;
                }
            }*/
        })
            .bootstrapSwitch('state', true);


        $("#back").click(function () {
            window.history.go(-1)
            return false;
        })

        $("#addWaringInfoBtn").click(function () {
            var tmp = $("#warninginfo").val();
            if (tmp != null && tmp !== '') {
                $("input[name='userAccountStatus.waringInfo']").val(tmp);
            } else {
                alert("输入内容不为空")
            }
            return false;
        })

        //动态修改页面高度
        /* $(".options").each(function () {
             if ($(this).css("display") === 'none') {

             } else if ($(this).css("display") === 'block') {
                 alert(1)
             }
         })*/

    })
</script>
</body>
</html>