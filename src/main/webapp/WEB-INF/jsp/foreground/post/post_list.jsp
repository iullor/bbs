<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>一个panel</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../../css/panel/panel.css">

    <!--引入一些样式-->
    <link rel="stylesheet" href="../../../../css/commons/sidebar_left.css">
    <link rel="stylesheet" href="../../../../css/commons/top.css">
    <link rel="stylesheet" href="../../../../css/modal/modal_login.css">
    <link rel="stylesheet" href="../../../../css/board/board.css">
    <link rel="stylesheet" href="../../../../css/commons/commons.css">
    <link rel="stylesheet" href="../../../../css/post/post_list.css">


    <script src="../../../../lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="../../../../lib/bootstrap/bootstrap.min.js"></script>
    <script src="../../../../js/sidebar-left-control.js"></script>

    <!--动态添加留言的对话框-->
    <script src="../../../../js/comment/addComment.js"></script>
    <script src="../../../../js/commons.js"></script>

</head>
<body>
<a href="../area/area.jsp">进入该版</a>
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
                    <!--
                        搜索框放在导航栏的头，可以在响应式的时候在上面
                    -->
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6">
                    <form class="navbar-form row">
                        <div class="form-group col-xs-8 col-sm-8 col-md-8">
                            <input type="text" class="form-control" id="search" placeholder="Search">
                        </div>
                        <button type="submit" class="btn btn-default col-xs-4 col-sm-4 col-md-4"><span
                                class="glyphicon glyphicon-search"></span>Search
                        </button>
                    </form>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-2 row">
                    <a id="login" href="#" data-toggle="modal" data-target="#loginModal" data-keyboard="true">请登录<span
                            class="glyphicon glyphicon-log-in"></span></a>
                </div>
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
                        <img src="../../../../images/favicon.ico" class="img-circle" width="100" height="100"/>
                    </li>
                    <li role="presentation">
                        <span class="text-danger">金彪</span>
                    </li>
                    <li role="presentation"><a href="#"><span
                            class="text-left glyphicon glyphicon-home">&nbsp</span>首页</a>
                    </li>
                    <li role="presentation"><a href="#"><span
                            class="text-left glyphicon glyphicon-user">&nbsp</span>基本信息</a></li>
                    <li role="  presentation"><a href="#"><span
                            class="text-left glyphicon glyphicon-comment">&nbsp</span>消息</a></li>
                    <li role="presentation"><a href="#"><span
                            class="text-left glyphicon glyphicon-star">&nbsp</span>收藏夹</a>
                    </li>
                    <li role="presentation"><a href="#"><span
                            class="text-left glyphicon glyphicon-user">&nbsp</span>我的贴子</a></li>
                    <li role="presentation"><a href="#"><span
                            class="text-left glyphicon glyphicon-question-sign">&nbsp</span>帮助</a></li>
                    <li role="presentation"><a href="#"><span
                            class="text-left glyphicon glyphicon-calendar">&nbsp</span>日期</a>
                    </li>
                    <li role="presentation"><a href="#"><span
                            class="text-left glyphicon glyphicon-time">&nbsp</span>时间</a>
                    </li>
                    <li role="presentation"><a href="#"><span
                            class="text-left glyphicon glyphicon-cog">&nbsp</span>设置</a>
                    </li>
                    <li role="presentation" class="mt-5 mb-3 text-muted">&copy; 学生论坛版权所有</li>
                </ul>
            </nav>
        </div>
        <div id="content" class="col-xs-12 col-sm-11 col-md-11">
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
                            <form action="/login" method="post">
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
                                    <input type="text" class="form-control" id="password">
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
                    <!--路径导航栏-->
                    <div class="row">
                        <ol class="breadcrumb">
                            <li><a href="../../public/index.jsp">Home</a></li>
                            <li><a href="../panel/panel.jsp">Panel</a></li>
                            <li><a href="../board/board.jsp">School</a></li>
                            <li><a href="../area/area.jsp">Computer Science</a></li>
                            <li class="active">计算机发展</li>
                        </ol>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <div class="panel panel-default">
                                <div class="panel-heading text-center">
                                    <a href="#"><img src="../../../../images/路飞.jpg"/></a>
                                    <p><a href="#">海贼王</a></p>
                                </div>
                                <div class="panel-border panel-default">
                                    <p class="text-center"><a href="#"><span class="text-grey">发帖：100</span></a></p>
                                    <p class="text-center">
                                            <span class="glyphicon glyphicon-heart-empty btn btn-info"
                                                  onclick="changeUpDown(event,this)"
                                                  tempClass="glyphicon glyphicon-heart btn btn-success">&nbsp;关注</span>
                                    </p>
                                    <p class="text-center">
                                        <span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;
                                        <span class="glyphicon glyphicon-envelope"></span>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div class="post-content">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <!--<button type="button" class="btn btn-info pull-right">-->
                                        <span class="glyphicon glyphicon-star-empty btn btn-info pull-right"
                                              onclick="changeUpDown(event,this)"
                                              tempClass="glyphicon glyphicon-star btn btn-success pull-right ">&nbsp;收藏</span>
                                        <!--</button>-->
                                        <div class="panel-title">
                                            <h2>计算机</h2>
                                        </div>
                                        <p class="post-content-part">&nbsp;&nbsp;计算机（computer）俗称电脑，是现代一种用于高速计算的电子计算机器，可以进行数值计算，又可以进行逻辑计算，还具有存储记忆功能。是能够按照程序运行，自动、高速处理海量数据的现代化智能电子设备。
                                            由硬件系统和软件系统所组成，没有安装任何软件的计算机称为裸机。可分为超级计算机、工业控制计算机、网络计算机、个人计算机、嵌入式计算机五类，较先进的计算机有生物计算机、光子计算机、量子计算机等。
                                            计算机发明者约翰·冯·诺依曼。
                                        </p>
                                    </div>
                                    <div id="post-content" class="panel-collapse collapse in">
                                        <div class="panel-body">
                                            <p class="post-content-p">
                                                &nbsp;&nbsp;计算机是20世纪最先进的科学技术发明之一，对人类的生产活动和社会活动产生了极其重要的影响，并以强大的生命力飞速发展。它的应用领域从最初的军事科研应用扩展到社会的各个领域，已形成了规模巨大的计算机产业，带动了全球范围的技术进步，由此引发了深刻的社会变革，计算机已遍及一般学校、企事业单位，进入寻常百姓家，成为信息社会中必不可少的工具。
                                                计算机的应用在中国越来越普遍，改革开放以后，中国计算机用户的数量不断攀升，应用水平不断提高，特别是互联网、通信、多媒体等领域的应用取得了不错的成绩。1996年至2009
                                                年，计算机用户数量从原来的630万增长至6710 万台，联网计算机台数由原来的2.9万台上升至5940万台。互联网用户已经达到3.16
                                                亿，无线互联网有6.7
                                                亿移动用户，其中手机上网用户达1.17 亿，为全球第一位。
                                            </p>
                                            <p class="post-content-p">
                                                &nbsp;&nbsp;计算机是20世纪最先进的科学技术发明之一，对人类的生产活动和社会活动产生了极其重要的影响，并以强大的生命力飞速发展。它的应用领域从最初的军事科研应用扩展到社会的各个领域，已形成了规模巨大的计算机产业，带动了全球范围的技术进步，由此引发了深刻的社会变革，计算机已遍及一般学校、企事业单位，进入寻常百姓家，成为信息社会中必不可少的工具。
                                                计算机的应用在中国越来越普遍，改革开放以后，中国计算机用户的数量不断攀升，应用水平不断提高，特别是互联网、通信、多媒体等领域的应用取得了不错的成绩。1996年至2009
                                                年，计算机用户数量从原来的630万增长至6710 万台，联网计算机台数由原来的2.9万台上升至5940万台。互联网用户已经达到3.16
                                                亿，无线互联网有6.7
                                                亿移动用户，其中手机上网用户达1.17 亿，为全球第一位。
                                            </p>
                                            <p class="post-content-p">
                                                &nbsp;&nbsp;计算机是20世纪最先进的科学技术发明之一，对人类的生产活动和社会活动产生了极其重要的影响，并以强大的生命力飞速发展。它的应用领域从最初的军事科研应用扩展到社会的各个领域，已形成了规模巨大的计算机产业，带动了全球范围的技术进步，由此引发了深刻的社会变革，计算机已遍及一般学校、企事业单位，进入寻常百姓家，成为信息社会中必不可少的工具。
                                                计算机的应用在中国越来越普遍，改革开放以后，中国计算机用户的数量不断攀升，应用水平不断提高，特别是互联网、通信、多媒体等领域的应用取得了不错的成绩。1996年至2009
                                                年，计算机用户数量从原来的630万增长至6710 万台，联网计算机台数由原来的2.9万台上升至5940万台。互联网用户已经达到3.16
                                                亿，无线互联网有6.7
                                                亿移动用户，其中手机上网用户达1.17 亿，为全球第一位。
                                            </p>
                                        </div>
                                    </div>
                                    <div class="panel-footer text-center">
                                        <a href="#post-content" data-toggle="collapse" data-target="#post-content"><span
                                                class="glyphicon glyphicon-menu-up"
                                                tempClass="glyphicon glyphicon-menu-down"
                                                onclick="changeUpDown(event,this)"></span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--<hr style="border-top: 1px solid grey;">-->
                    <div class="panel-group">
                        <!--很多panel-->
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="media">
                                    <div class="row">
                                        <div class="col-md-1">
                                            <div class="media-left"><a href="#"> <img
                                                    src="../../../../images/哈士奇.jpg" width="60" height="60"
                                            ></a>
                                            </div>
                                            <p>NickName</p>
                                        </div>
                                        <div class="col-md-11">
                                            <div class="media-body">
                                                <div class="comment-level1">
                                                    <p>我是对文章的评论，也就是第一级评论</p>
                                                </div>
                                                <div class="comment-bar media-bottom">
                                                    <p>
                                                        <span>
                                                                <img src="../../../../images/icons/good-empty.svg"
                                                                     lowsrc="../../images/icons/good-deep.svg"
                                                                     style="width: 20px;height: 20px"
                                                                     onclick="changeImg1(this)"
                                                                     alt="">
                                                        </span>&nbsp;
                                                        <span>
                                                                <img src="../../../../images/icons/bad-empty.svg"
                                                                     lowsrc="../../images/icons/bad-deep.svg"
                                                                     style="width: 20px;height: 20px"
                                                                     onclick="changeImg1(this)"
                                                                     alt="">
                                                        </span>
                                                        <span>
                                                                    <a data-toggle="collapse" href="#comment"><span
                                                                            class="glyphicon glyphicon-comment"></span></a>
                                                                        </span>
                                                        <span style="padding-right: 50px">时间：<em>2018-10-11</em></span>
                                                        <span class="pull-right">
                                                            <a href="#comment-level2-1"
                                                               data-toggle="collapse"
                                                               data-target="#comment-level2-1"><span
                                                                    class="glyphicon glyphicon-menu-up"
                                                                    tempClass="glyphicon glyphicon-menu-down"
                                                                    onclick="changeUpDown(event,this)">收起</span></a>
                                                        </span>
                                                    </p>
                                                </div>
                                                <!--二级评论-->
                                                <div id="comment-level2-1"
                                                     class="panel-collapse collapse in comment-level2">
                                                    <div class="panel-body panel-comment">
                                                        <div class="media">
                                                            <div class="media-left">
                                                                <a href="#"> <img src="../../../../images/favicon.ico"
                                                                                  width="50"
                                                                                  height="50"></a>
                                                                <small><a href="#">NickName</a></small>
                                                            </div>
                                                            <div class="media-body media-middle">
                                                                真不错，我是第一层
                                                                真不错，我是第一层
                                                                真不错，我是第一层
                                                                真不错，我是第一层
                                                                真不错，我是第一层
                                                                真不错，我是第一层
                                                                真不错，我是第一层
                                                                真不错，我是第一层
                                                                真不错，我是第一层
                                                            </div>
                                                            <div class="media-bottom comment-bar">
                                                                <span style="float: left">
                                                                    <em>1层</em>
                                                                </span>
                                                                <span>
                                                                <img src="../../../../images/icons/good-empty.svg"
                                                                     lowsrc="../../images/icons/good-deep.svg"
                                                                     style="width: 20px;height: 20px"
                                                                     onclick="changeImg1(this)"
                                                                     alt="">
                                                        </span>&nbsp;
                                                                <span>
                                                                <img src="../../../../images/icons/bad-empty.svg"
                                                                     lowsrc="../../images/icons/bad-deep.svg"
                                                                     style="width: 20px;height: 20px"
                                                                     onclick="changeImg1(this)"
                                                                     alt="">
                                                        </span>
                                                                <span> <a href="#">回复</a></span>
                                                            </div>
                                                        </div>
                                                        <div class="media">
                                                            <div class="media-left">
                                                                <a href="#"> <img src="../../../../images/favicon.ico"
                                                                                  width="50"
                                                                                  height="50"></a>
                                                                <small><a href="#">NickName</a></small>
                                                            </div>
                                                            <div class="media-body media-middle">
                                                                真不错，我是第一层
                                                                真不错，我是第一层
                                                                真不错，我是第一层
                                                                真不错，我是第一层
                                                                真不错，我是第一层
                                                                真不错，我是第一层
                                                                真不错，我是第一层
                                                                真不错，我是第一层
                                                                真不错，我是第一层
                                                            </div>
                                                            <div class="media-bottom comment-bar">
                                                                     <span>
                                                                <img src="../../../../images/icons/good-empty.svg"
                                                                     lowsrc="../../images/icons/good-deep.svg"
                                                                     style="width: 20px;height: 20px"
                                                                     onclick="changeImg1(this)"
                                                                     alt="">
                                                        </span>&nbsp;
                                                                <span>
                                                                <img src="../../../../images/icons/bad-empty.svg"
                                                                     lowsrc="../../images/icons/bad-deep.svg"
                                                                     style="width: 20px;height: 20px"
                                                                     onclick="changeImg1(this)"
                                                                     alt="">
                                                        </span>
                                                                <span> <a href="#">回复</a></span>
                                                            </div>
                                                        </div>
                                                        <div class="media">
                                                            <div class="media-left">
                                                                <a href="#"> <img src="../../../../images/favicon.ico"
                                                                                  width="50"
                                                                                  height="50"></a>
                                                                <small><a href="#">NickName</a></small>
                                                            </div>
                                                            <div class="media-body media-middle">
                                                                真不错，我是第一层
                                                                真不错，我是第一层
                                                                真不错，我是第一层
                                                                真不错，我是第一层
                                                                真不错，我是第一层
                                                                真不错，我是第一层
                                                                真不错，我是第一层
                                                                真不错，我是第一层
                                                                真不错，我是第一层
                                                            </div>
                                                            <div class="media-bottom comment-bar">
                                                                     <span>
                                                                <img src="../../../../images/icons/good-empty.svg"
                                                                     lowsrc="../../images/icons/good-deep.svg"
                                                                     style="width: 20px;height: 20px"
                                                                     onclick="changeImg1(this)"
                                                                     alt="">
                                                        </span>&nbsp;
                                                                <span>
                                                                <img src="../../../../images/icons/bad-empty.svg"
                                                                     lowsrc="../../images/icons/bad-deep.svg"
                                                                     style="width: 20px;height: 20px"
                                                                     onclick="changeImg1(this)"
                                                                     alt="">
                                                        </span>
                                                                <span> <a href="#">回复</a></span>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <div class="panel-footer">
                                                        <form action="">
                                                            <div class="form-group">
                                                        <textarea name="" id="" cols="30" class="form-control" rows="5"
                                                                  style="width: 100%"
                                                                  placeholder="comment...."></textarea>
                                                            </div>
                                                            <div class="form-group pull-right">
                                                                <button class="btn btn-success" type="submit">评论
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
                            <div class="panel-footer">

                            </div>
                        </div>
                        <div class="panel-footer panel-default">
                            <nav class="Page navigation text-center">
                                <ul class="pagination">
                                    <li>
                                        <a href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <li><a href="#">1</a></li>
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
                    <form action="">
                        <div class="form-group">
                            <textarea name="" cols="30" rows="10" style="width: 100%"
                                      placeholder="comment.."></textarea>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-success">评论</button>
                        </div>
                    </form>
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
<script>

    //定义一个tempClass属性  点击的时候，交换class 和tempClass的值
    function changeUpDown(event, element) {
        var tempClass = element.getAttribute("class")
        element.setAttribute("class", element.getAttribute("tempClass"))
        element.setAttribute("tempClass", tempClass)
    }

    //点赞
    function changeImg1(temp) {
        var a = temp.src;
        temp.src = temp.lowsrc;
        temp.lowsrc = a;
    }


    $(function () {
        $(".panel-border .row:even").css("border-left", "blue solid 3px")
        $(".panel-border .row:odd").css("border-left", "red solid 3px")
        $(".board-hot-topic .row:even").css("border-top", "black solid 1px")
        $(".board-hot-topic .row:odd").css("border-top", "red solid 1px")
    });
</script>
</body>
</html>