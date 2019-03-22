<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>主页</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">

    <!--sidebar-left样式-->
    <link rel="stylesheet" href="../../css/commons/sidebar_left.css">
    <!--每一个板块呈现的样式-->
    <link rel="stylesheet" href="../../css/board/board.css">
    <!--login的模态框-->
    <link rel="stylesheet" href="../../css/modal/modal_login.css">

    <!--主样式，覆盖前面的样式-->
    <link rel="stylesheet" href="../../css/commons/index.css">
    <!--=====================js=============================-->
    <script src="../../lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="../../lib/bootstrap/bootstrap.min.js"></script>

    <!--控制侧栏-->
    <script src="../../js/sidebar-left-control.js"></script>

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

                    <a class="navbar-brand" href="#">BBS-Student</a>

                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <div class="row" style="margin-top: 6px">
                        <form>
                            <div class="form-group col-md-8">
                                <input type="text" class="form-control" id="search" placeholder="Search">
                            </div>
                            <div class="form-group col-xs-4 col-sm-4 col-md-4">
                                <button type="submit" class="btn btn-default"><span
                                        class="glyphicon glyphicon-search"></span>Search
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                <c:choose>
                    <c:when test="${empty sessionScope.CURRENT_USER}">
                        <div class="col-xs-12 col-sm-12 col-md-offset-1 col-md-1"
                             style="margin-top: 8px;font-size: 18px">
                            <a id="login" href="#" data-toggle="modal" data-target="#loginModal" data-keyboard="true">请登录<span
                                    class="glyphicon glyphicon-log-in"></span></a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="col-xs-12 col-sm-12 col-md-offset-1 col-md-1"
                             style="margin-top: 8px;font-size: 18px;">
                            <a id="logout" href="/logout">注销<span class="glyphicon glyphicon-log-in"></span></a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </nav>
</header>
<div class="container-fluid">
    <div class="row">
        <div id="left-navbar" class="col-xs-12 col-sm-1 col-md-1">
            <nav id="sidebar-wrapper" class="collapse navbar-fixed-top navbar-collapse"
                 role="navigation">
                <ul class="nav sidebar-nav">
                    <li class="sidebar-brand">
                        <span id="close" class="glyphicon glyphicon-menu-hamburger"></span>
                    </li>
                    <li role="presentation">
                        <img id="myHeadImg" src="/images/路飞.jpg"
                             value='${sessionScope.CURRENT_USER.userBaseInfo.headImage}'
                             class="img-circle"/>
                    </li>
                    <li role="presentation">
                        <span class="text-danger">${sessionScope.CURRENT_USER.nickName}</span>
                    </li>
                    <li role="presentation"><a href="./index.jsp"><span
                            class="text-left glyphicon glyphicon-home">&nbsp;</span>首页</a>
                    </li>
                    <li role="presentation"><a href="/person/basic/info"><span
                            class="text-left glyphicon glyphicon-user">&nbsp;</span>基本信息</a></li>
                    <li role="presentation"><a href="/person/basic/account"><span
                            class="text-left glyphicon glyphicon-user">&nbsp;</span>账户信息</a></li>
                    <li role="presentation"><a href="/person/message"><span
                            class="text-left glyphicon glyphicon-comment">&nbsp;</span>消息</a></li>
                    <li role="presentation"><a href="/person/collection/boards"><span
                            class="text-left glyphicon glyphicon-star">&nbsp;</span>收藏夹</a>
                    </li>
                    <li role="presentation"><a href="/person/mypost"><span
                            class="text-left glyphicon glyphicon-user">&nbsp;</span>我的贴子</a></li>
                    <li role="presentation"><a href="/system/help"><span
                            class="text-left glyphicon glyphicon-question-sign">&nbsp;</span>帮助</a></li>
                    <li role="presentation"><a href="/person/themes/basic"><span
                            class="text-left glyphicon glyphicon-cog">&nbsp;</span>设置</a>
                    </li>
                    <li class="mt-5 mb-3 text-muted" style="margin-top: 200px">&copy; 学生论坛版权所有</li>
                </ul>
            </nav>
        </div>
        <div id="content" class="col-xs-12 col-sm-11 col-md-10">
            <!--游客用户登录的模态框-->
            <div class="modal fade" id="loginModal" tabindex="0" role="dialog" aria-labelledby="loginModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content modal-sm">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title text-center" id="loginModalLabel">
                                <small>请您先登录，再操作</small>
                            </h4>
                        </div>
                        <div class="modal-body">
                            <form action="/checkLogon" method="get">
                                <div class="form-group">
                                    <label for="username" class="control-label">
                                        <small>用户名</small>
                                    </label>
                                    <input type="text" class="form-control has-feedback" name="username" id="username">
                                </div>
                                <div class="form-group">
                                    <label for="password" class="control-label">
                                        <small>密码</small>
                                    </label>
                                    <input type="password" class="form-control" name="password" id="password">
                                </div>
                                <div class="form-group">
                                    <button type="button" class="btn btn-md btn-default" data-dismiss="modal">Quit
                                    </button>
                                    <button type="submit" class="btn btn-md btn-primary">Login</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
            <div class="content-inner">
                <span id="open" class="glyphicon glyphicon-menu-hamburger"></span>
                <div id="main" class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-8 col-md-8">
                            <div id="column1-left">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6 col-md-6">
                                        <div class="school-hot">
                                            <label>学校热点</label>
                                            <ul class="list-unstyled">
                                                <li><a href="#">今天学校放假了</a></li>
                                                <li><a href="#">今天学校放假了</a></li>
                                                <li><a href="#">今天学校放假了</a></li>
                                                <li><a href="#">今天学校放假了</a></li>
                                                <li><a href="#">今天学校放假了</a></li>
                                                <li><a href="#">今天学校放假了</a></li>
                                                <li><a href="#">今天学校放假了</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6">
                                        <div class="board-hot">
                                            <label>站内热点</label>
                                            <ul class="list-unstyled">
                                                <li><a href="#">今天学校放假了</a></li>
                                                <li><a href="#">今天学校放假了</a></li>
                                                <li><a href="#">今天学校放假了</a></li>
                                                <li><a href="#">今天学校放假了</a></li>
                                                <li><a href="#">今天学校放假了</a></li>
                                                <li><a href="#">今天学校放假了</a></li>
                                                <li><a href="#">今天学校放假了</a></li>
                                                ;
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <hr style="border-color: #2e6da4;margin-top: 0px;margin-bottom: 0px">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-8 col-md-8">
                                        <p>我的圈子</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4">
                            <div class="row">
                                <div id="column1-right">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <span style="margin-left: 20px;color: red;">热门话题</span>
                                            <div class="hotTopic">
                                                <ul class="list-unstyled" style="margin-left: 20px;">
                                                    <li><a href="#">校园春招</a></li>
                                                    <li><a href="#">医学健康</a></li>
                                                    <li><a href="#">健身锻炼</a></li>
                                                    <li><a href="#">求职</a></li>
                                                    <li><a href="#">跳蚤市场</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <span style="margin-left: 20px;color: red;">失物公示</span>
                                            <div class="hotTopic">
                                                <div class="well">
                                                    <p>小红丢了1w$... </p>
                                                    <p><a href="#">联系</a></p>
                                                </div>
                                                <div class="well">
                                                    <p>小红丢了1w$... </p>
                                                    <p><a href="#">联系</a></p>
                                                </div>
                                                <button class="btn btn-default pull-right" data-toggle="modal"
                                                        data-target="#addLostModal"
                                                        style="margin-top: 20px">发布公告
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <!--查找业务modal框-->
                                    <div class="modal fade" id="addLostModal" tabindex="-1" role="dialog"
                                         aria-labelledby="loginModalLabel">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content modal-sm">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close"><span
                                                            aria-hidden="true">&times;</span></button>
                                                    <h4 class="modal-title text-center" id="addLostModalLabel">
                                                        <small>请认真填写以下信息</small>
                                                    </h4>
                                                </div>
                                                <div class="modal-body">
                                                    <form action="/login" method="post" enctype="multipart/form-data">
                                                        <div class="form-group">
                                                            <label for="username" class="control-label">
                                                                <small>用户名</small>
                                                            </label>
                                                            <input type="text" class="form-control has-feedback"
                                                                   name="username">
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="password" class="control-label">
                                                                <small>邮箱</small>
                                                            </label>
                                                            <input type="email" class="form-control" name="email">
                                                        </div>
                                                        <div class="form-group">
                                                            <label>请选择情况</label>
                                                            <select name="situation" class="form-control">
                                                                <option value="-1">请选择</option>
                                                                <option value="0">捡到</option>
                                                                <option value="1">遗失</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group">
                                                            详细描述
                                                            <textarea class="form-control" rows="5"></textarea>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>上传合适的图片</label>
                                                            <input type="file" class="form-control" name="picture">
                                                        </div>
                                                        <div class="form-group">
                                                            <button type="button" class="btn btn-md btn-default"
                                                                    data-dismiss="modal">
                                                                Quit
                                                            </button>
                                                            <button type="submit" class="btn btn-md btn-primary">Submit
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                    <div id="column2">
                        <c:forEach items="${panels}" var="p">
                            <div class="col-sm-6 col-md-6 column2 each_top">
                                <div class="col-sm-12 container-board">
                                    <div class="board-title">
                                        <a href="/panel/${p.id}"><span><span class="text-center"><img
                                                src="/images/board/school.svg" width="25"
                                                height="25"></span>&nbsp;&nbsp;&nbsp;${p.title}</span></a>
                                        <p>
                                            <c:forEach items="${p.boards}" var="b">
                                                <span><small><a href="/board/${b.id}">${b.boardTitle}</a></small></span>
                                            </c:forEach>
                                            <span><small><a href="/panel/${p.id}"><span
                                                    class="pull-right">更多</span></a></small></span>
                                        </p>
                                    </div>
                                    <hr>
                                    <div class="board-content">
                                        <c:forEach items="${p.boards}" var="b">
                                            <p><span><a href="#">[${b.boardTitle}]</a>&nbsp;<a href="#">贴子${b.posts}</a></span>
                                            </p>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                    <hr>
                </div>
                <div id="foot" class="container">
                    <p class="text-center"><span><a href="#">联系我们</a>&nbsp;&nbsp;<small>--</small></span>友情连接&nbsp;<a
                            href="https://www.baidu.com">百度</a>&nbsp;<a
                            href="https://www.google.com">Google</a>&nbsp;<a
                            href="https://www.github.com">GitHub</a></p>
                    <div class="text-center">
                        <p>© 学生论坛版权所有</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--button组-->
<div id="goTop" class="btn-group-vertical dropup">
    <button type="button" class="btn btn-primary" onclick="writePost()">
        <span class="glyphicon glyphicon-comment"></span>
        发帖
    </button>
    <button type="button" data-toggle="dropup" class="btn btn-success">
        <span class="caret"></span>
        Home
    </button>
</div>

<script>
    //头像的显示
    $(function () {
        let myHeadImg = $("#myHeadImg").attr("value");
        if (myHeadImg !== '') {
            let beginIndex = myHeadImg.lastIndexOf("/webapp/") + 7;
            let endIndex = myHeadImg.length;
            let src = myHeadImg.substring(beginIndex, endIndex);
            $("#myHeadImg").attr("src", src);
        }

    })

    //修改默认的跳转方式 /person/manager
    /* $(".sidebar-nav>li>a").on("click", function () {
         let currentHref = $(this).attr("href");

         let beginIndex = currentHref.lastIndexOf("/person/") + 8;
         let endIndex = currentHref.length;
         let href = currentHref.substring(beginIndex, endIndex);
         $.ajax({
             type: "post",
             href: '/person',
             data: "href",
             success: function () {
                 window.location.href = "/person";
             }
         })
         return false
     })*/


    /*快速发帖*/
    function writePost() {
        window.location = "/post/quickInput/{0}";
    }

    /*
    * 点击回顶部
    * */
    $(function () {
        $("#goTop button").click(function () {
            window.scrollTo(0, 0, 0, 0);
        })
        if ($(window).width() > 750) {
            $(".school-hot").css({"border-right": "2px solid blue"});
            $(".board-hot").css({"border-left": "2px solid blue"})
        }
    })

</script>
</body>
</html>