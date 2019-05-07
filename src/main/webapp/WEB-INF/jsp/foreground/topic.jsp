<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>话题</title>
    <!--sidebar-left样式-->
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">

    <link rel="stylesheet" href="/css/commons/sidebar_left.css">
    <!--login的模态框-->
    <link rel="stylesheet" href="/css/modal/modal_login.css">
    <link rel="stylesheet" href="/css/commons/sidebar_left.css">
    <link rel="stylesheet" href="/css/topic.css">
    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="https://cdn.bootcss.com/jsrender/1.0.2/jsrender.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <!--控制侧栏-->
    <script src="/js/sidebar-left-control.js"></script>
    <style>
        .glyphicon-thumbs-up-done {
            color: rgba(255, 0, 0, 0.97);
        }
    </style>
</head>
<body>
<header class="navbar navbar-fixed-top navbar-default">
    <nav class="navbar">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 col-sm-4 col-md-4 navbar-header">
                    <button type="button" class="navbar-toggle collapsed glyphicon glyphicon-menu-hamburger"
                            data-toggle="collapse"
                            data-target="#sidebar-wrapper" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/index.jsp"
                       style="background-image: url('/images/bg/1554629378_742229.png');width: 500px">
                    </a>
                </div>
                <div class="col-md-5">
                    <div class="row" style="margin-top: 6px">
                        <form>
                            <div class="form-group col-md-6">
                                <input type="text" class="form-control" id="search" placeholder="Search">
                            </div>
                            <div class="form-group col-md-6">
                                <button type="submit" class="btn btn-default"><span
                                        class="glyphicon glyphicon-search"></span>Search
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-2  nav-addon">
                    <a href="/public"><span class="glyphicon glyphicon-cloud">&nbsp;话题广场</span></a>
                    <c:if test="${not empty sessionScope.CURRENT_USER}">
                        <a href="/person/myCircle/${sessionScope.CURRENT_USER.id}"><span
                                class="glyphicon glyphicon-globe">&nbsp;我的圈子</span></a>
                    </c:if>
                </div>
                <c:choose>
                    <c:when test="${empty sessionScope.CURRENT_USER}">
                        <div class="col-md-1" style="margin-top: 13px;font-size: 18px">
                            <a id="login" href="#" data-toggle="modal" data-target="#loginModal" data-keyboard="true">
                                请登录
                                <span class="glyphicon glyphicon-log-in"></span>
                            </a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="col-md-1">
                            <div class="myAccount img-circle">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                   aria-haspopup="true" aria-expanded="false">
                                    <img src="" width="40" height="40"
                                         value='${sessionScope.CURRENT_USER.userBaseInfo.headImage}'
                                         class="showUserHeadImg"/>
                                    <span class="caret" style="margin-left: 13px;"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="/person/basic/account">账户</a></li>
                                    <li><a href="/person/basic/info">基本信息</a></li>
                                    <li><a href="#">我的创作</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="#">添加</a></li>
                                    <li><a href="#">维修</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li><a href="/person/basic/account">设置</a></li>
                                    <li><a id="logout" href="/logout">注销<span class="glyphicon glyphicon-log-in"></span></a>
                                    </li>
                                </ul>
                                <br>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </nav>
</header>
<div class="container">
    <div style="position: fixed;bottom: 200px;right: 50px;background-color: white;height: 80px;width: 80px;text-align: center;padding-top: 15px;">
        <div>
            <img src="/images/nav/discussion.png" class="join-discuss" width="30" height="30"><br>
            <label>加入讨论</label>
        </div>
    </div>
    <div class="row" style="padding-left: 10px;padding-bottom: 10px;background-color: #f5f5f5;border-radius: 5px;">
        <h3>
            <a href="#" style="color: red;">#####${topic.topicTitle}#####</a>
            <span class="pull-right">
                <img src="/images/public/hot1.png" width="50" height="50" alt="">
            </span>
        </h3>
    </div>
    <div class="row text-left topic-show">
        <div class="col-md-8" style="height: 300px;padding-top: 10px;">
            <p style="padding-left: 50px">
                <img src="/images/topic/default.png" class="showUserHeadImg" value="${topic.topicPicture}" alt=""
                     width="480" height="270">
            </p>
        </div>
        <div class="col-md-4" style="height: 300px;margin-top:-8px;background-color: white;border-bottom: 2px solid #f5f5f5;padding-top: -10px;">
            <div class="text-center" style=" width:105%;margin-left: 0px;margin-top: -5px;border-radius: 10px">
                <a href="#">
                    <img src="/images/路飞.jpg" class="showUserHeadImg" width="150" height="150"
                         value="${topic.user.userBaseInfo.headImage}" style="margin-top: 20px;margin-left: -30px;"/></a>
                <p style="margin-top: 10px;margin-left: -20px;"><a href="#">${topic.user.nickName}</a></p>
            </div>
            <div class="text-center" style="height: 90px;padding-top: 20px;">
                <span id="collectUser" class="glyphicon glyphicon-heart-empty btn btn-info"
                      tempClass="glyphicon glyphicon-heart btn btn-success">&nbsp;关注</span>
                <span><input type="hidden" id="topicUserId" value="${topic.userId}"/></span>
            </div>
        </div>
    </div>
    <div class="row" style="padding-left: 10px">
        <h4 style="font-size: 20px;padding-top: 5px;">详情介绍</h4>
        <p style="font-size: 18px;padding-left: 5px;padding-top: 5px;text-indent: 2em;">
            ${topic.topicDescribe}
        </p>
    </div>
    <div class="row topic-option">
        <p class="text-right">
            <span>浏览数&nbsp;</span>
            <span class="glyphicon glyphicon-eye-open"
                  style="margin-right: 20px;font-size: 18px;">&nbsp;${topic.topicSeen}</span>
            <span style="margin-right: 50px;">
             创建时间
              <f:formatDate value="${topic.createTime}"
                            pattern="yyyy-MM-dd HH:mm:ss"/>
            </span>
        </p>
    </div>
    <div class="panel">
        <div class="panel-heading panel-info text-right">
            <h3>讨论区</h3>
        </div>
        <div class="panel-body">
            <c:forEach items="${discusses}" var="discuss">
                <div class="row discuss">
                    <div class="col-md-2 text-center" style="padding-top: 20px">
                        <a href="/account/${discuss.userId}">
                            <img src="/images/路飞.jpg" class="img-circle showUserHeadImg"
                                 value="${discuss.user.userBaseInfo.headImage}" width="100" height="100" alt="">
                        </a>
                        <p>
                                ${discuss.user.nickName}
                        </p>
                    </div>
                    <div class="col-md-10">
                        <div style="border: 1px solid rgba(157,157,157,0.62);height: 150px;border-radius: 3px">
                            <p style="margin-top: 10px;text-indent: 2em;font-size: 17px;">
                                    ${discuss.discussContent}
                            </p>
                        </div>
                        <div style="padding-top: 30px;">
                            <p class="text-right">
                                <span class="glyphicon glyphicon-thumbs-up good-discuss"
                                      style="font-size: 16px;"
                                      disId="${discuss.id}">
                                </span>
                                <span style="font-size: 16px;margin-right: 20px;">${discuss.praises}</span>
                                <span style="font-size: 16px;padding-right: 50px;">
                                    时间<f:formatDate value="${discuss.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                </span>

                                <c:if test="${discuss.replies.size()>0}">
                                    <a href="#" data-toggle="modal" data-target="#comment-input-list"
                                       discussid="${discuss.id}" tousernickname="${discuss.user.nickName}"
                                       touserId="${discuss.userId}">
                                        <span class="glyphicon glyphicon-comment"
                                              style="font-size: 16px;padding-right: 50px;">&nbsp;${discuss.replies.size()}</span>
                                    </a>
                                </c:if>
                                <c:if test="${discuss.replies.size()==0}">
                                    <a href="#" data-toggle="modal" data-target="#comment-input"
                                       discussId="${discuss.id}" tousernickname="${discuss.user.nickName}"
                                       touserId="${discuss.userId}">
                                        <span class="glyphicon glyphicon-comment"
                                              style="font-size: 16px;padding-right: 50px;">&nbsp;<small>回复</small></span>
                                    </a>
                                </c:if>
                                <span>
                                    <c:choose>
                                        <c:when test="${discuss.discussPictures!=null and discuss.discussPictures!=''}">
                                            <a href="#" class="showPicture">查看图片</a>
                                        </c:when>
                                        <c:otherwise>
                                            &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </c:otherwise>
                                    </c:choose>
                                </span>
                            </p>
                        </div>
                    </div>
                        <%--显示多张图片--%>
                    <div class="col-md-12 discuss-picture" pics="${discuss.discussPictures}">
                    </div>
                </div>
            </c:forEach>
        </div>

        <div id="footPage" class="row panel-footer panel-default">
            <div class="col-md-offset-3 col-md-4">
                <nav class="Page navigation">
                    <ul class="pagination">
                        <li id="firstPage" style="margin-right: 20px">
                            <a href="javascript:goPage(1)" aria-label="Previous">
                                <span aria-hidden="true">首页</span>
                            </a>
                        </li>
                        <%--class="${pageResult.currentPage==1?'disabled':''}"--%>
                        <li id="prevPage">
                            <a href="javascript:goPage(1)" aria-label="Previous">
                                上一页
                            </a>
                        </li>
                        <c:forEach begin="${pageResult.beginIndex}" end="${pageResult.endIndex}"
                                   var="pageNumber">
                            <li class="${pageNumber==pageResult.currentPage?'active':''}">
                                <a href="javascript:goPage(${pageNumber})">${pageNumber}</a>
                            </li>
                        </c:forEach>
                        <%--class="${pageResult.endIndex==pageResult.totalPage?'disabled':''}"--%>
                        <li id="nextPage">
                            <a href="javascript:goPage(${pageResult.nextPage})" aria-label="Previous">
                                下一页
                            </a>
                        </li>
                        <li id="lastPage"
                            class="${pageResult.endIndex==pageResult.totalPage?'disabled':''}">
                            <a href="javascript:goPage(${pageResult.totalPage})">
                                末页
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="col-md-4" style="margin-left:0px;height: 78px;padding-top: 10px;">
                <%--跳转的框--%>
                <form id="goPage" action="/public/${topic.id}" method="get">
                    <input type="hidden" name="currentPage">
                    <input type="hidden" name="pageSize">
                </form>
                <div id="toPage" style="margin-left: -50px">
                    <input type="text" name="toPage"
                           class="form-text">&nbsp;/&nbsp;${pageResult.totalPage}
                    <button type="button" class="btn btn-success">跳转</button>
                </div>
            </div>
        </div>
    </div>
    <%--输入框--%>
    <div class="row form-input">
        <label>请输入</label>
        <form action="/discuss" id="discuss" method="post">
            <div class="form-group text-right" style="margin-bottom: 2px">
                <input type="hidden" name="discussPictures">
                <input type="hidden" name="topicId" value="${topic.id}">
                <%--给话题的发起者--%>
                <input type="hidden" name="toUserId" value="${topic.user.id}">
                <button type="button" class="btn btn-default uploadImages">添加图</button>
                <input type="file" name="discussPerPicture">
            </div>
            <div class="showUploadImages">
                <%--占位符，显示所有的上传的图片--%>
            </div>
            <div class="form-group">
                        <textarea name="discussContent" cols="100" rows="10" class="form-control"
                                  style="resize: none;"></textarea>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-lg">发送</button>
            </div>
        </form>
    </div>
</div>
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
<%--显示和二级评论的模态框--%>
<div class="modal fade" id="comment-input-list" tabindex="-1" role="dialog">
    <div class="modal-open modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="discussList">讨论列表</h4>
            </div>
            <div class="modal-body">
                <div class="comment-container" id="repliesPlacehold">

                </div>
            </div>
            <div class="modal-footer">
                <h5 class="text-left" id="replyToWho"></h5>
                <form action="/discuss/reply" method="post">
                    <div class="form-group">
                        <input type="hidden" name="toDiscussId">
                        <input type="hidden" name="toUserId">
                        <input type="hidden" name="topicId">
                        <input type="hidden" name="replyId">
                    </div>
                    <div class="form-group reply-div">
                        <%--输入内容--%>
                        <textarea name="replyContent" cols="80" rows="5" style="resize: none;"
                                  class="form-control"></textarea>
                    </div>
                    <div class="form-group text-right">
                        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">关闭</button>
                        <button type="submit" class="btn btn-sm btn-primary">发送</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%--渲染模板--%>
<script type="text/x-jsrender" id="replies">
                        {{for replies}}
                            {{:replies}}
                        {{else}}
                            <div class="row">
                                <div class="col-sm-2" style="height: 100%;border-right: 1px solid #f5f5f5;">
                                    <div class="pull-left" style="margin-top: 30px">
                                        <span>{{:#getIndex()+1}}</span>
                                    </div>
                                    <div class="text-center" style="margin-top: 5px;border-radius: 10%">
                                        <img src="" class="showUserHeadImg" value="{{:user.userBaseInfo.headImage}}" alt="" width="70" height="70"
                                             style="border: 1px solid #f5f5f5;border-radius: 10px">
                                    </div>
                                    <div class="text-center">
                                        <span style="font-size: 16px;"> {{:user.nickName}}</span>
                                    </div>
                                </div>
                                <div class="col-sm-10" style="height: 100%">
                                    <div>
                                        <p style="text-indent: 2em;padding-top: 5px;">
                                           {{:replyContent}}
                                        </p>
                                    </div>
                                    <div class="text-right">
                                        <a href="#" onclick="replyDiscuss(this)" class="discuss-reply" tousernickname="{{:user.nickName}}" touserid="{{:user.id}}" replyid="{{:id}}"><span class="glyphicon glyphicon-comment"></span>&nbsp;回复</a>
                                    </div>
                                </div>
                            </div>
                        {{/for}}

</script>
<%--一级评论的--%>
<div class="modal fade" id="comment-input" tabindex="-1" role="dialog">
    <div class="modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 id="toWho"></h4>
            </div>
            <div class="modal-body">
                <form action="/discuss/reply" method="post">
                    <div class="form-group">
                        <input type="hidden" name="toDiscussId">
                        <input type="hidden" name="toUserId">
                        <input type="hidden" name="topicId">
                    </div>
                    <div class="form-group reply-div">
                        <%--输入内容--%>
                        <textarea name="replyContent" cols="80" rows="5" style="resize: none;"
                                  class="form-control"></textarea>
                    </div>
                    <div class="form-group text-right">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="submit" class="btn btn-primary">发送</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    //回复的内容，因为jsrender渲染的a标签失效，不能使用jQuery来获取值，只能编写js函数
    function replyDiscuss(a) {
        console.log(a);
        let discussId = $("#comment-input-list input:hidden[name='toDiscussId']").val();
        //当前讨论的id
        let topicId = $("#comment-input-list input:hidden[name='topicId']").val();
        let toUserId = $(a).attr("touserid")
        let toReplyId = $(a).attr("replyid")
        let toUserNickName = $(a).attr("tousernickname");
        alert("discussId:" + discussId)
        alert("topicId:" + topicId)
        alert("toUserId:" + toUserId)
        alert("toReplyId:" + toReplyId)
        $("#comment-input-list input:hidden[name='toUserId']").val(toUserId)
        $("#comment-input-list input:hidden[name='replyId']").val(toReplyId)
        $("#replyToWho").html("回复&nbsp;@"+toUserNickName);
    }


    function goPage(pageNumber) {
        $(":hidden[name='currentPage']").val(pageNumber);
        $(":hidden[name='pageSize']").val(5);
        $("#goPage").submit();
    }

    $(function () {
        $(".discuss-picture").hide();
        $(".showPicture").on("click", function () {
            $(this).parents("div").next("div.discuss-picture").toggle();
            //多张图片的路径
            let pics = $(this).parents("div").next("div.discuss-picture").attr("pics");
            //图片的地址数组
            $(this).parents("div").next("div.discuss-picture").empty();
            var srcArrays = pics.split("|");
            for (let i = 0; i < srcArrays.length - 1; i++) {
                //alert(srcArrays[i])
                //alert(srcArrays[i].lastIndexOf("/upload/"))
                let beginIndex = srcArrays[i].lastIndexOf("/upload/")
                let endIndnx = srcArrays[i].length;
                let src = srcArrays[i].substring(beginIndex, endIndnx);
                //alert(src)
                $(this).parents("div").next("div.discuss-picture").append("<img src=" + src + " width='250' height='250' style='margin-left: 30px;border: 1px silver solid'>")
            }
            return false;
        })
        $(".discuss").hover(function () {
            $(this).parents("div.panel-body").css({
                "background-color": "#f5f5f5"
            })

        }, function () {
            $(this).parents("div.panel-body").css({
                "background-color": "white"
            })
        })
        $(".form-input").hide();
        //join-discuss
        $(".join-discuss").on("click", function () {
            //平滑到底部，显示输入框，在开头拼接，话题标题
            let windowBottom = $(window).height();
            $('body,html').animate({scrollTop: windowBottom}, 1000);
            let topicTitle = '###' + '${topic.topicTitle}' + '###';
            $(".form-input").show();
            $("textarea[name='discussContent']").html(topicTitle + '&nbsp;&nbsp;&nbsp;')

        })

        //隐藏默认的样式
        $(":file").hide();
        $(".showUploadImages").hide();
        $(".uploadImages").on("click", function () {
            $(this).next().click();
        })
        $(":file").on("change", function () {
            $(".showUploadImages").show();

        })

        //多张照片的异步上传
        //思路，每次上传成功，拼接一次字符串 以 | 分割一张图片的位置，之后把拼接好的所有的字符串赋值为 discussPictures
        //异步提交图片文件
        var discussPictures = $(":hidden[name='discussPictures']").val();
        $(":file").on("change", function () {
            var form = new FormData(document.getElementById("discuss"));
            $.ajax({
                url: "/discuss/uploadImages/",
                type: "post",
                data: form,
                processData: false,
                contentType: false,
                error: function (data) {
                    console.log(data)
                    if (data.status == 200) {
                        alert("上传成功")
                        let path = data.responseText;
                        //图片回显
                        let beginIndex = path.indexOf("/webapp/") + 7;
                        let endIndex = path.length;
                        let src = path.substring(beginIndex, endIndex);
                        $(".showUploadImages").append("<img src=" + src + " width='150' height='150'>")
                        //拼接多张字符串给属性
                        discussPictures = discussPictures + path + "|";
                        alert(discussPictures)
                        $(":hidden[name='discussPictures']").val(discussPictures);
                    }
                }
            });
        })

        //激活分页
        //分页一些东西的隐藏与显示
        let search = ${pageResult.totalPage};
        //如果只有一页,隐藏所有
        if (search < 2) {
            $("#footPage").hide();
        }
        //如果当前页等于第一页,那么隐藏上一页的按钮
        let currentPage = ${pageResult.currentPage};
        if (currentPage === 1) {
            $("#prevPage").hide();
        }
        //如果当前页,等于最后一页,那么隐藏下一页
        let endPages = ${pageResult.endIndex};
        if (endPages === currentPage) {
            $("#nextPage").hide();
        }
        $("#toPage>button").on("click", function () {
            let toPage = $("input[name='toPage']").val();
            if (toPage !== null && toPage !== '' && toPage !== 'undefined') {
                let endPage =  ${pageResult.totalPage};
                if (endPage + 1 > toPage) {
                    goPage(toPage);
                } else {
                    alert("请输入正确的页码");
                }
            } else {
                alert("请输入页码");
            }
        })
    });
    //添加取消关注,回显
    $(function () {
        $("#collectUser").on("click", function () {
            let userId = '${topic.userId}'
            let obj = {
                userId: userId
            };
            let currentClass = $(this).attr("class");
            //判断当前的状态,未关注是蓝色，已经关注是绿色
            //如果当前的样式没有绿色，就发送关注
            if (currentClass.match("btn-success") == null) {
                $.ajax({
                    url: "/collection/user/" + 1,
                    type: "post",
                    data: JSON.stringify(obj),
                    contentType: "application/json",
                    success: function (data) {
                        console.log(data)
                        if (data.status === '3000') {
                            alert("关注成功")
                        } else {
                            alert("网络问题")
                        }
                    }
                })
                $(this).removeClass("glyphicon-heart-empty").removeClass("btn-info");
                $(this).addClass("glyphicon-heart").addClass("btn-success");
                $(this).html("已关注")
            } else {
                //取消关注
                $.ajax({
                    url: "/collection/user/" + 0,
                    type: "post",
                    data: JSON.stringify(obj),
                    contentType: "application/json",
                    success: function (data) {
                        console.log(data)
                        if (data.status === '3001') {
                            alert("已取消")
                        } else {
                            alert("网络问题")
                        }
                    }
                })
                $(this).removeClass("glyphicon-heart").removeClass("btn-success");
                $(this).addClass("glyphicon-heart-empty").addClass("btn-info");
                $(this).html(" 关注")
            }
        })
        //显示关注
        //当准备刷新页面的时候,获取当前的用户id,贴子id
        let curUserId = '${sessionScope.CURRENT_USER.id}'
        console.log(curUserId);
        let curPostUserId = '${topic.userId}'
        console.log(curPostUserId)
        let curPostId = '${topic.id}';
        console.log(curPostId);
        //根据用户名和贴子的作者去找
        if (curUserId != null && curPostUserId != null) {
            var obj1 = {
                currentUserId: curUserId,
                userId: curPostUserId
            }
            $.ajax({
                url: '/collection/user',
                type: 'post',
                data: JSON.stringify(obj1),
                contentType: "application/json",
                success: function (data) {
                    //表明数据库中有值
                    if (data.collectedUser === '1') {
                        $("#collectUser").removeClass("glyphicon glyphicon-heart-empty btn btn-info");
                        $("#collectUser").addClass("glyphicon glyphicon-heart btn btn-success");
                        $("#collectUser").html("已关注")
                    }
                }
            })
        }


    })
    //点赞
    $(function () {

        $(".good-discuss").on("click", function () {
            //两种状态
            var curDiscussId = $(this).attr("disId");
            var id = {
                id: curDiscussId
            }
            var parten = $(this).attr("class");
            let num = 0;
            //alert(parten)
            var tmpSpan = $(this);
            if (parten.match("glyphicon-thumbs-up-done") == null) {
                //给一个标志位，将该对象保存，在ajax调用
                $.ajax({
                    url: "/discuss/update/praise/" + 1,
                    type: "post",
                    contentType: "application/json",
                    data: JSON.stringify(id),
                    success: function (data) {
                        //赋值,修改样式
                        //alert("data:" + data)
                        //alert("flag:" + flag)
                        //console.log(tmpSpan)
                        $(tmpSpan).next("span").html(data)
                        $(tmpSpan).addClass("glyphicon-thumbs-up-done");
                    }
                });

            } else {
                //取消点赞
                $.ajax({
                    url: "/discuss/update/praise/" + 0,
                    type: "post",
                    contentType: "application/json",
                    data: JSON.stringify(id),
                    success: function (data) {
                        //赋值,修改样式
                        $(tmpSpan).next("span").html(data)
                        $(tmpSpan).removeClass("glyphicon-thumbs-up-done");
                    }
                    //添加样式
                });
            }
        })

        //回显点赞
        $(".good-discuss").each(function () {
            let discussId = $(this).attr("disId");
            var currentSpan = $(this);
            $.ajax({
                url: '/discuss/praise/' + discussId,
                type: 'get',
                success: function (data) {
                    if (data === 1) {
                        $(currentSpan).addClass("glyphicon-thumbs-up-done");
                    }
                }
            })
        })
    })

    //添加回复
    $("a[data-target='#comment-input']").on("click", function () {
        console.log(this)
        let topicId = '${topic.id}';
        let discussId = $(this).attr("discussId")
        let toUserId = $(this).attr("touserId")
        let toUserNickName = $(this).attr("tousernickname")
        //alert(topicId)
        $("#toWho").html("回复@&nbsp;" + toUserNickName);
        $("#comment-input input:hidden:first-child").val(discussId)
        $("#comment-input input:hidden:nth-child(2)").val(toUserId)
        $("#comment-input input:hidden:last-child").val(topicId)

    })

    //查看回复列表，添加或者回复回复
    $(function () {
        $("a[data-target='#comment-input-list']").on("click", function () {
            //$(".comment-container").empty();
            //查出来所有的回复
            let discussId = $(this).attr("discussid")
            //当前讨论的id
            let topicId = '${topic.id}';
            let toUserId = $(this).attr("touserid")
            let toUserNickName = $(this).attr("tousernickname")
            //alert("discussId:" + discussId)
            //alert("topicId:" + topicId)
            //alert("toUserId:" + toUserId)
            //alert(toUserNickName)
            $("#replyToWho").html("回复@&nbsp;" + toUserNickName);
            $("#comment-input-list input:hidden:first-child").val(discussId)
            $("#comment-input-list input:hidden:nth-child(2)").val(toUserId)
            $("#comment-input-list input:hidden:nth-child(3)").val(topicId)
            $.ajax({
                url: '/discuss/reply/list/' + discussId,
                type: 'get',
                success: function (data) {
                    //返回的是一个回复的集合
                    console.log(data)
                    //交给jsrender渲染，到modal中
                    var html = $("#replies").render(data);
                    $("#repliesPlacehold").html(html);
                    //让css生效
                    $(".comment-container .showUserHeadImg").each(function () {
                        //alert(1)
                        //console.log($(this))
                        let originSrc = $(this).attr("value");
                        //alert(originSrc)
                        let beginIndex = originSrc.lastIndexOf("/upload");
                        let endIndex = originSrc.length;
                        let src = originSrc.substring(beginIndex, endIndex);
                        $(this).attr("src", src);
                    });
                }
            })
        })
    })
</script>
</body>
</html>
