<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>编辑贴子</title>
    <%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">--%>
    <link rel="icon" type="image/x-icon" href="/images/favicon.ico"/>
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <link href="https://cdn.bootcss.com/bootstrap-switch/4.0.0-alpha.1/css/bootstrap-switch.css" rel="stylesheet">
    <link rel="stylesheet" href="/lib/bootstrap-switch/bootstrap-switch.min.css">
    <link rel="stylesheet" href="/css/commons/commons.css">
    <link rel="stylesheet" href="/css/commons/sidebar_left.css">
    <link rel="stylesheet" href="/css/post/post_edit.css">
    <link rel=”shortcut icon” href=”/images/index/index-favicon.ico” type=”image/x-icon”>
    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="/lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <script src="/lib/ueditor/ueditor.config.js"></script>
    <script src="/lib/ueditor/ueditor.all.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/foreground/commons/top-navbar.jsp"/>
<div class="container">
    <div class="main">
        <div class="row">
            <div style="margin-left: 50px;margin-bottom: -10px;font-size: 18px">
                <ol class="breadcrumb">
                    <li><a href="/index.jsp">首页</a></li>
                    <li class="active">新建</li>
                </ol>
            </div>
            <div class="col-md-offset-1 col-md-6" id="content1">
                <h4><span class="text-grey">编辑新帖子</span></h4>
                <input type="hidden" id="canPostOrNot" value="${canPostOrNot}">
                <form:form action="/post" method="post" id="postForm" modelAttribute="post">
                    <c:choose>
                        <c:when test="${not empty post.id}">
                            <input type="hidden" name="_method" value="put">
                            <form:hidden path="id"/>
                        </c:when>
                    </c:choose>
                    <div class="form-group">
                        <label>标题</label>
                        <form:input type="text" path="postTitle" class="form-control" placeholder="北京的那一夜"/>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <label>类型</label>
                            <select name="postType" class="form-control">
                                <c:forEach items="${types}" var="type">
                                    <option value="${type.id}"
                                        ${post.postType == type.name?'selected':''}>${type.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label>分享到板块</label>
                            <select id="board" name="boardId" class="form-control">
                                <option value="-1">请选择</option>
                                <c:forEach items="${boards}" var="board">
                                    <option value="${board.id}" ${post.boardId==board.id?"selected":''}>${board.boardTitle}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-4">
                            <label>分享到分区</label>
                            <select id="area" name="areaId" class="form-control">
                            </select>
                        </div>
                        <div class="col-md-8" style="height: 30px;margin-bottom: 10px;margin-top: 5px">
                            <label for="view">私密
                                <small>(开启后，您发的贴子，将不会显示在分区中)</small>
                            </label>
                            <div class="switch switch-small">
                                <input id="view" name="code" type="checkbox">
                            </div>
                        </div>
                    </div>
                    <br>
                    <label>贴子内容</label>
                    <script id="content" name="postContent">
                        ${post.postContent}
                    </script>
                    <input type="hidden" name="firstImage">
                    <div class="row" style="margin-top: 50px;">
                        <div class="form-group pull-right" style="padding-left: 30px;">
                            <button class="btn btn-md btn-default" type="button">取消</button>
                            <button class="btn btn-md btn-warning" type="button">暂存</button>
                            <button id="getContent" class="btn btn-md btn-success" type="submit">发送</button>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
<script>
    UE.getEditor('content', {
        initialFrameHeight: 600,
        initialFrameWidth: 900,
        topOffset: 60,
        toolbars: [
            ['fullscreen', 'undo', 'redo', 'attachment', 'autotypeset', 'horizontal', 'inserttable', 'edittable',
                'simpleupload', 'emotion', 'spechars', 'rowspacingtop', 'rowspacingbottom'],
            ['formatmatch', 'indent', 'justifyleft', 'justifyright', 'justifycenter', 'justifyjustify',
                'bold', 'inserttitle', 'fontfamily', 'fontsize', 'forecolor', 'pagebreak', 'edittip', 'preview'],
        ]
    });
    //获取第一张图片的url
    $("#getContent").on("click", function () {
            var ueditorContent = UE.getEditor("content").getContent();
            var imgReg = /<img.*?(?:>|\/>)/g;
            //匹配src属性
            var srcReg = /src=[\'\"]?([^\'\"]*)[\'\"]?/i;

            var imgSuffixReg = /\w+\.(jpg|png|svg|jpeg)$/
            var arr = ueditorContent.match(imgReg);
            var fisrtImgSrc = '';
            //alert('所有已成功匹配图片的数组：' + arr);
            for (var i = 0; i < arr.length; i++) {
                var src = arr[i].match(srcReg);
                //获取图片地址url
                var imgSrc = src[1].match(imgSuffixReg)
                if (imgSrc != null) {
                    //获取富文本框里面的第一张，不是表情的 图片
                    console.log(imgSrc)
                    fisrtImgSrc = imgSrc.input;
                    $(":hidden[name='firstImage']").val(fisrtImgSrc)
                    console.log(fisrtImgSrc)
                    return;
                }
                if (imgSrc == null) {
                    console.log("空")
                }
            }
        }
    )
    $(function () {
        $("#board").on("change", function () {
            //拿到postid ，从数据库再查出来
            var boardId = $(this).val();
            //先移除
            $("#area").empty();
            $.ajax({
                url: '/area/' + boardId,
                type: "post",
                contentType: "application/json",
                success: function (areas) {
                    $("#area").append("<option value=\"-1\">请选择</option>")
                    $.each(areas, function (index, area) {
                        console.log(index)
                        console.log(area)
                        var option = '<option value="' + area.id + '">' + area.areaTitle + '</option>'
                        $("#area").append(option)
                    })
                }
            })
        })

        //级联回显
        var boardId = $("#board").val();
        var areaId = '${post.areaId}'
        $.ajax({
            url: '/area/' + boardId,
            type: "post",
            contentType: "application/json",
            success: function (areas) {
                $("#area").append("<option value=\"-1\">请选择</option>")
                $.each(areas, function (index, area) {
                    console.log(index)
                    console.log(area)
                    var tmp = area.id;
                    if (areaId === tmp) {
                        var option = '<option value="' + area.id + '" selected>' + area.areaTitle + '</option>';

                    } else {
                        var option = '<option value="' + area.id + '">' + area.areaTitle + '</option>';
                    }
                    $("#area").append(option)
                })
            }
        })

        //级联
        $("#area").on("click", function () {
            if ($("#area").children("option").length === 1) {
                alert("请先选择板块")
            }
        })
        //判断用户帐号是否被封
        //来到此页面直接提示，您的显示暂时被禁止发帖
        let postOrNotValue = $("#canPostOrNot").attr("value");
        if (postOrNotValue !== null && postOrNotValue !== '' && postOrNotValue !== 'undefined') {
            alert(postOrNotValue)
            //禁用整个div，form表单return false
            $("#postForm").submit(function () {
                return false;
            })
            $("#content1").css({
                'pointer-events': 'none'
            })
        }
    })
</script>
</body>
</html>