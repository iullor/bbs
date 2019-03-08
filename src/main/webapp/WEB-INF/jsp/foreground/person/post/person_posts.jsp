<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人管理</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <!--top栏样式-->
    <link rel="stylesheet" href="../../../../../css/commons/top.css">
    <link rel="stylesheet" href="../../../../../css/person/person_manager-left.css">
    <link rel="stylesheet" href="../../../../../css/person/post/person_posts.css">
    <script src="../../../../../lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="../../../../../lib/bootstrap/bootstrap.min.js"></script>
</head>
<body>
<header class="navbar navbar-fixed-top navbar-inverse">
    <nav class="navbar">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 col-sm-4 col-md-4 navbar-header">
                    <button type="button" class="navbar-toggle collapsed glyphicon glyphicon-menu-hamburger"
                            data-toggle="collapse"
                            data-target="#sidebar-wrapper" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <a class="navbar-brand" href="../../../public/index.jsp">BBS-Student</a>
                    <!--
                        搜索框放在导航栏的头，可以在响应式的时候在上面
                    -->
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <form class="navbar-form row">
                        <div class="form-group col-xs-8 col-sm-8 col-md-8">
                            <input type="text" class="form-control" id="search" placeholder="贴子/用户/板块">
                        </div>
                        <button type="submit" class="btn btn-default col-xs-4 col-sm-4 col-md-4"><span
                                class="glyphicon glyphicon-search"></span>Search
                        </button>
                    </form>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-2 row text-center">
                    <a href="#">当前用户</a>
                    <a id="login" href="#" data-toggle="modal" data-target="#loginModal" data-keyboard="true">注销<span
                            class="glyphicon glyphicon-log-out"></span></a>
                </div>
            </div>
        </div>
    </nav>
</header>
<div class="container-fluid">
    <div class="row main">
        <div class=" col-md-offset-1 col-md-2">
            <!--侧边栏信息-->
            <div id="panel-parent" class="panel-group">
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="#person-basic-info" data-toggle="collapse" data-parent="#panel-parent">
                                <span class="glyphicon glyphicon-user"></span><span>个人信息</span>
                            </a>
                        </div>
                    </div>
                    <div id="person-basic-info" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li><a href="person_account.jsp" class="">账号信息</a>
                                </li>
                                <li class="active"><a href="#" class="">基本信息</a></li>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="#person_posts" data-toggle="collapse" data-parent="#panel-parent">
                                <span class="glyphicon glyphicon-flag"></span><span>贴子</span>
                            </a>
                        </div>
                    </div>
                    <div id="person_posts" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li><a href="post/person_posts.jsp">我的贴子</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="../message/message.jsp">
                                <span class="glyphicon glyphicon-comment"></span><span>消息</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="#person_collections" data-toggle="collapse" data-parent="#panel-parent">
                                <span class="glyphicon glyphicon-star"></span><span>收藏夹</span>
                            </a>
                        </div>
                    </div>
                    <div id="person_collections" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li><a href="#" class="">贴子</a></li>
                                <li><a href="#" class="">板块</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="../focus/focus_person.jsp" class="">
                                <span class="glyphicon glyphicon-heart"></span><span>关注</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <a href="#person_themes_setting" data-toggle="collapse"
                               data-parent="#panel-parent"><span
                                    class="glyphicon glyphicon-certificate"></span><span>系统主题</span></a>
                        </div>
                    </div>
                    <div id="person_themes_setting" class="panel-collapse collapse">
                        <div class="panel-body">
                            <ul class="list-unstyled">
                                <li><a href="#" class="">基本样式</a></li>
                                <li><a href="#" class="">颜色搭配</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="list" class="col-md-8">
            <div class="sort-search">
                <div class="row">
                    <div class="col-md-1">
                        <p><b>查询</b></p>
                    </div>
                    <div class="col-md-3 text-center">
                        <b>时间</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="#">升序 <span class="glyphicon glyphicon-sort-by-order"></span></a>&nbsp;&nbsp;
                        <a href="#">降序 <span class="glyphicon glyphicon-sort-by-order-alt"></span></a>
                    </div>
                    <div class="col-md-1">
                        <b>分类</b>
                    </div>
                    <div class="col-md-2">
                        <select name="choose" id="" class="form-control">
                            <option value="">娱乐</option>
                            <option value="">求助</option>
                            <option value="">学术</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="关键字">
                        </div>
                    </div>
                    <div class="col-md-1">
                        <button class="btn btn-default" type="button"><span
                                class="glyphicon glyphicon-search">查找</span></button>
                    </div>
                </div>
            </div>
            <div id="post-list" class="panel-group">
                <div class="panel">
                    <div class="panel-body">
                        <a href="#"><h4>BAT缩招，AI跻身2019年最赚钱职业榜首！（附薪酬表）</h4></a>
                    </div>
                    <div class="footer">
                        <div class="row">
                            <div class="col-md-2">
                                <span>&nbsp;&nbsp;&nbsp;<i>学术</i></span>
                            </div>
                            <div class="col-md-4">
                                <span><small>2018年12月10日&nbsp;&nbsp;21:00</small></span>
                            </div>
                            <div class="col-md-offset-3 col-md-1">
                                <a href="../../post/post_list.jsp">查看</a>
                            </div>
                            <div class="col-md-1">
                                <span><a href="../../post/post_edit.jsp">编辑</a></span>
                            </div>
                            <div class="col-md-1">
                                <span><a href="#" class="text-danger">删除</a></span>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="panel">
                    <div class="panel-body">
                        <p>post-title</p>

                    </div>
                    <div class="footer">
                        <div class="row">
                            <div class="col-md-2">
                                <span>&nbsp;&nbsp;&nbsp;<i>学术</i></span>
                            </div>
                            <div class="col-md-4">
                                <span><small>2018年12月10日&nbsp;&nbsp;21:00</small></span>
                            </div>
                            <div class="col-md-offset-3 col-md-1">
                                <a href="../../post/post_list.jsp">查看</a>
                            </div>
                            <div class="col-md-1">
                                <a href="#">编辑</a>
                            </div>
                            <div class="col-md-1">
                                <a href="#">删除</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel">
                    <div class="panel-body">
                        <p>post-title</p>

                    </div>
                    <div class="footer">
                        <div class="row">
                            <div class="col-md-2">
                                <span>&nbsp;&nbsp;&nbsp;<i>学术</i></span>
                            </div>
                            <div class="col-md-4">
                                <span><small>2018年12月10日&nbsp;&nbsp;21:00</small></span>
                            </div>
                            <div class="col-md-offset-3 col-md-1">
                                <a href="../../post/post_list.jsp">查看</a>
                            </div>
                            <div class="col-md-1">
                                <a href="#">编辑</a>
                            </div>
                            <div class="col-md-1">
                                <a href="#">删除</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script>

    /**
     * 改变NickName，email的可选状态
     */
    $(function () {
        $(".glyphicon-edit").on("click", function () {
            $(this).parent().parent().prev().attr("disabled", false)
        })
    })

    /**
     *
     * 页面头像显示
     */
    $(function () {
        $("#uploadImage").on("click", function () {
            $("#headImage").click()
            $("#headImage").on("change", function () {
                var filePath = $(this).val()
                var src = window.URL.createObjectURL(this.files[0]);
                //alert(src)
                var fileFormat = filePath.split(".")
                var fileSuffix = fileFormat[fileFormat.length - 1].toLowerCase()
                //alert(fileSuffix)
                if (!fileSuffix.match("png|jpg|jpeg")) {
                    alert("格式错误")
                    return;
                }
                $("img").attr("src", src)

            })
        })

    })
</script>
</body>
</html>