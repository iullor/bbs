<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台管理页面首页</title>
    <link rel="stylesheet" href="../../../lib/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../css/admin/admin.css">

    <!--js-->
    <script src="../../../lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="../../../lib/bootstrap/bootstrap.min.js"></script>
    <style>
        #pageContainer {
            top: 50px;
        }
    </style>
</head>
<body>
<div>
    <!--顶栏-->
    <div class="navbar-fixed-top">
        <nav class="navbar navbar-default navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Brand</a>
                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
                        <li><a href="#">Link</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">Separated link</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">One more separated link</a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"><img src="../../../images/路飞.jpg" alt="" width="30" height="30"
                                             style="border-radius: 50%"></a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true" aria-expanded="false">操作<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">切换用户</a></li>
                                <li><a href="#">Something else here</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="#">退出</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-right">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search">
                        </div>
                        <button type="submit" class="btn btn-default">Submit</button>
                    </form>

                </div>
            </div>
        </nav>
    </div>
    <!--侧栏-->
    <div class="col-md-2">
        <div id="navbar-left" class="navbar-fixed-left">
            <ul>
                <li>
                    <h3>欢迎</h3>
                </li>
                <li>
                    <a href="/admin/info">
                        <span class="glyphicon glyphicon-cog"></span>系统<span></span>
                    </a>
                </li>
                <li>
                    <a href="/admin/public">
                        <span class="glyphicon glyphicon-list-alt"></span>广场<span></span>
                    </a>
                </li>

                <li>
                    <a href="#userManager">
                        <span class="glyphicon glyphicon-user"></span>用户管理<span class="caret"></span>
                    </a>
                    <div id="userManager">
                        <ul>
                            <li><a href="/admin/user">用户列表</a></li>
                            <li><a href="/admin/user">违规用户</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#postManager">
                        <span class="glyphicon glyphicon-flag"></span>贴子管理<span class="caret"></span>
                    </a>
                    <div id="postManager">
                        <ul>
                            <li><a href="/admin/post">列表</a></li>
                            <li><a href="/admin/post/input/0">添加</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#">
                        <span class="glyphicon glyphicon-th"></span>区管理<span class="caret"></span>
                    </a>
                    <div>
                        <ul>
                            <li><a href="/admin/area">列表</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#">
                        <span class="glyphicon glyphicon-equalizer"></span>板块管理<span class="caret"></span>
                    </a>
                    <div>
                        <ul>
                            <li><a href="/admin/board">列表</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#">
                        <span class="glyphicon glyphicon-th-large"></span>模块管理<span class="caret"></span>
                    </a>
                    <div>
                        <ul>
                            <li><a href="/admin/panel">列表</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#">
                        <span class="glyphicon glyphicon-eye-close"></span>屏蔽设置<span class="caret"></span>
                    </a>
                    <div>
                        <ul>
                            <li><a href="/admin/shield/list">现有</a></li>
                            <li><a href="/admin/shield/edit">新增</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="/admin/examination/list">
                        <span class="glyphicon glyphicon-retweet"></span>审核审查<span></span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span class="glyphicon glyphicon-lock"></span>权限管理<span class="caret"></span>
                    </a>
                    <div>
                        <ul>
                            <li><a href="/admin/permission/list">列表</a></li>
                            <li><a href="/admin/permission/edit">设置权限</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#">
                        <span class="glyphicon glyphicon-share"></span>系统反馈<span class="caret"></span>
                    </a>
                    <div>
                        <ul>
                            <li><a href="/admin/feedback/list">反馈列表</a></li>
                            <li><a href="/admin/feedback/edit">回复</a></li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#blankManager">
                        空位待占<span class="caret"></span>
                    </a>
                    <div id="blankManager">
                        <ul>
                            <li><a href="#">a</a></li>
                            <li><a href="#">a</a></li>
                            <li><a href="#">a</a></li>
                        </ul>
                    </div>
                </li>
                <li class="mt-5 mb-3">
                    <p class="text-center">bbs管理页面</p>
                </li>
            </ul>
        </div>
    </div>


    <!--内容-->

    <div id="pageContainer" class="col-md-10  pull-right">
        <iframe src="/admin/info" frameborder="0" scrolling="no" id="external-frame" width="100%"
                onload="setIframeHeight(this)"></iframe>
    </div>
</div>

<script>
    $(function () {
        var $perents = $("#navbar-left>ul>li>a");
        var $childen = $("#navbar-left>ul>li>div");
        var $links = $("#navbar-left>ul>li>div>ul>li");

        $childen.hide();//隐藏所有的子
        $childen.first().show();//显示第一个
        $perents.on("click", function () {
            if ($(this).next("div").is(":hidden")) {
                $childen.hide(200);
                $(this).next("div").show(200);
            } else {
                $(this).next("div").hide(200);
            }
        })

        $perents.on("click", function () {
            var hrefs = $(this).next("div").children("ul").children("li:first-child").children("a").attr("href");
            $("iframe").attr("src", hrefs);
        })

        //点击切换页面
        $links.on("click", function () {
            var tmp = $(this).children("a").attr("href")
            $("iframe").attr("src", tmp);
            return false;
        })

        //对于那些单个的li
        $("#navbar-left>ul>li:nth-child(2)").on("click", function () {
            var tmp = $(this).children("a").attr("href")
            $("iframe").attr("src", tmp);
            return false;
        })
        $("#navbar-left>ul>li:nth-child(3)").on("click", function () {
            var tmp = $(this).children("a").attr("href")
            $("iframe").attr("src", tmp);
            return false;
        })
        //对于那些单个的li
        $("#navbar-left>ul>li:nth-child(10)").on("click", function () {
            var tmp = $(this).children("a").attr("href")
            $("iframe").attr("src", tmp);
            return false;
        })

    })

    //切换页面动态跳针iframe 的高
    function setIframeHeight(iframe) {
        if (iframe) {
            var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
            if (iframeWin.document.body) {
                iframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
            }
        }
    };
    window.onload = function () {
        setIframeHeight(document.getElementById('external-frame'));
    };
</script>
</body>

</html>