<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户信息查询</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../../lib/bootstrap-switch/bootstrap-switch.min.css">
    <script src="../../../../lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="../../../../lib/bootstrap/bootstrap.min.js"></script>
    <script src="../../../../lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <link rel="stylesheet" href="../../../../css/admin/admin_pages.css">
    <style>
        .options {
            /*border: 2px solid grey;*/
            margin-bottom: 20px;
        }

        .panel-group {
            height: 1000px;
        }

        td > .panel {
            width: 103%;
            margin-left: -22px;
            margin-top: -3px;
            height: 430px;
        }
    </style>

</head>
<body>
<div class="container-fluid">
    <h2 class="text-center">用户信息</h2>
    <hr style="margin-top: 70px;margin-bottom:15px">
    <%--操作栏--%>
    <div class="row text-center">

        <div class="col-md-offset-5 col-md-1">
            <a href="/admin/user/toAdd">
                <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-plus"></span> 增加管理员
                </button>
            </a>
        </div>
        <div class="col-md-1" style="margin-top: 7px;line-height: 20px;font-size: 15px;">
            时间&nbsp;&nbsp;<a href="#"><span class="glyphicon glyphicon-sort-by-attributes"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="#"><span class="glyphicon glyphicon-sort-by-attributes-alt"></span></a>
        </div>
        <div class="col-md-1" style="margin-top: 7px;line-height: 20px;font-size: 15px;">
            热度&nbsp;&nbsp;<a href="#"><span class="glyphicon glyphicon-sort-by-attributes"></span></a>&nbsp;&nbsp;&nbsp;&nbsp;
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
                    <th>用户名</th>
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
                                    <td>
                                        <a href="" target="_Blank">
                                            <img src="" value='${u.userBaseInfo.headImage}'
                                                 width="50"
                                                 height="50" alt="点击查看大图">
                                        </a>
                                    </td>
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
                                                <form action="/admin/user/updateUserAccountStatus" method="post">
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
                                                            <td colspan="1">
                                                                    <%-- <div class="bootstrap-switch bootstrap-switch-on">
                                                                         <input type="checkbox" class="checkbox"
                                                                                name="userAccountStatus.allowPost"
                                                                                value="${u.userAccountStatus.allowPost}"/>
                                                                     </div>--%>
                                                                <input type="checkbox" class="checkbox"
                                                                       name="allowPost"
                                                                    ${u.userAccountStatus.allowPost==1?'checked':''}/>
                                                            </td>
                                                            <td colspan="1">
                                                                    <%-- <div class="bootstrap-switch bootstrap-switch-on">
                                                                         <input type="checkbox" class="checkbox"
                                                                                name="userAccountStatus.allowComment"
                                                                                value="${u.userAccountStatus.allowComment}"/>
                                                                     </div>--%>
                                                                <input type="checkbox" class="checkbox"
                                                                       name="allowComment"
                                                                    ${u.userAccountStatus.allowComment==1?'checked':''}/>
                                                            </td>
                                                            <td colspan="2">
                                                                <select name="status"
                                                                        class="form-control">
                                                                    <option value="-1" ${u.userAccountStatus.status == -1?'selected':''}>
                                                                        冻结
                                                                    </option>
                                                                    <option value="0" ${u.userAccountStatus.status == 0?'selected':''}>
                                                                        待激活
                                                                    </option>
                                                                    <option value="1" ${u.userAccountStatus.status == 1?'selected':''}>
                                                                        正常
                                                                    </option>
                                                                </select>
                                                            </td>
                                                            <td colspan="1">
                                                                <a href="#warning-info">添加</a>
                                                            </td>
                                                            <td colspan="1">
                                                                <a class="delete" href="/admin/user/${u.id}">删除</a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="4">
                                                                <span>历史</span>
                                                                <div class="well" style="width: 550px">
                                                                    <blockquote>
                                                                        <p>${u.userAccountStatus.warningInfo}</p>
                                                                    </blockquote>
                                                                </div>
                                                            </td>
                                                            <td colspan="2">
                                                                <p>警告信息</p>
                                                                <textarea cols="80" rows="8"
                                                                          name="warningInfo" readonly></textarea>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="7">
                                                                <button type="submit"
                                                                        class="btn btn-sm btn-success pull-right update-option">
                                                                    提交
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
<script>

    $(function () {
        //禁止info，logon，options显示

        //点击显示，显示指定的
        $(".parent-tbody>tr:even>td:last-child>a").on("click", function () {
            $(this).parent("td").parent("tr").next("tr").slideToggle(0, function () {
                if ($(this).is(":hidden")) {
                } else {
                    $(".parent-tbody>tr:odd").slideUp();
                    $(this).slideDown();
                }
            });
            return false;
        })

        /*$(".checkbox").bootstrapSwitch({
            onText: "ON",      // 设置ON文本  
            offText: "OFF",    // 设置OFF文本  
            onColor: 'success',
            offColor: 'warning',
            reverse: true,
            size: 'mini',
            // 当开关状态改变时触发  
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
            }
        });*/

        /*//默认全局启用，在渲染页面之前，就去改变状态，允许发帖
        $("input[name='userAccountStatus.allowPost']").bootstrapSwitch({
            onText: 'ON',
            OffText: 'OFF',
            onColor: 'warning',
            onSwitchChange: function (event, state) {
                let defaultValue = event.target.defaultValue;
                alert(defaultValue)
                //1 0 0 1 1
                //0 表示不禁止
                //1 表示禁止

            }
        }).bootstrapSwitch('state', false);

        //默认全局启用，在渲染页面之前，就去改变状态，允许评论
        $("input[name='userAccountStatus.allowComment']").bootstrapSwitch({
            onText: 'ON',
            OffText: 'OFF',
            onColor: 'success',
            onSwitchChange: function (event, state) {
                let defaultValue = event.target.defaultValue;
                //alert(defaultValue)
                //1 0 0 1 1
                //0 表示不禁止
                //1 表示禁止
                if (defaultValue === '0') {
                    //状态不变
                    if (state) {
                        //alert("即将改变状态，屏蔽贴子")
                        $(this).bootstrapSwitch("state", true);
                        $(this).val("1")
                    }
                }
                //后台数据为1
                if (defaultValue === '1') {
                    //如果状态发生改变,手动点击
                    if (state) {
                        //alert("即将改变状态，不禁止贴子")
                        $(this).bootstrapSwitch("state", false);
                        $(this).val("0");
                    }
                }
            }
        }).bootstrapSwitch('state', true);*/
        /*
            $("input[type='checkbox']").each(function (a, b, c) {
                console.log(a)
                console.log(b)
                console.log(c)
                if ($(b).attr("checked") === 'checked') {
                    $(b).val('1');
                } else {
                    $(b).val('0');
                }
                //console.log($(b).val());
            })

            $("input[type='checkbox']").on("change", function () {
                if ($(this).val() == '1') {
                    $(this).val("0")
                } else {
                    $(this).val("1")
                }
            })*/

        $("img").each(function () {
            let tmp = $(this).attr("value");
            let beginIndex = tmp.lastIndexOf("/webapp/") + 7;
            let endIndex = tmp.length;
            var realPath = tmp.substring(beginIndex, endIndex);
            $(this).attr("src", realPath);
            $(this).parent("a").attr("href", realPath);
        });

        //再渲染完页面之后，将一些模块隐藏
        $(".options").hide();

        $("#back").click(function () {
            window.history.go(-1)
            return false;
        })

        //设置textarea可以添加信息
        $("a[href='#warning-info']").click(function () {
            $(this).parents("td").parents("tr").next("tr").children("td").children("textarea").attr("readonly", false);
            return false;
        })

        $("tr textarea").click(function () {
            if ($(this).attr("readonly") === 'readonly') {
                alert("请点击添加，解除封印")
            }
        })


        //删除用户
       /* $(".delete").on("click", function () {
            let tmp = confirm("您确认删除该用户吗？");
            var url = $(this).attr("href");
            alert(url)
            $.ajax({
                async: false,
                url: "https://www.baidu.com",
                type: 'get'
            })

        })*/
    })
</script>
</body>
</html>