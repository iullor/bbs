<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">--%>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sidebar-left-control.js"></script>
    <style>
        body {
            margin-top: 50px;
        }

        .col-md-8 label {
            font-size: 17px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row main">
        <div class="col-md-offset-1 col-md-9 container-inner" style="border: 1px solid #f5f5f5">
            <h3><b>创建话题</b></h3>
            <hr>
            <div class="row">
                <div class="col-md-6">
                    <form action="${pageContext.request.contextPath}/person/topic" method="post" id="topic">
                        <%--用来隐藏话题配图的路径--%>
                        <input type="hidden" name="topicPicture"/>
                        <div class="form-group">
                            <label for="topic-title">话题标题
                                <small>(不超过15字)</small>
                            </label>
                            <input id="topic-title" type="text" name="topicTitle" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>添加配图(图片比例16:9,格式(png/jpg))</label>
                            <input type="file" name="topicPicture1">
                        </div>
                        <div class="form-group">
                            <label>关键词</label>
                            <input type="text" name="topicKeyword">
                            <small>(必须2-6词)</small>
                        </div>
                        <div class="form-group">
                            <label for="topic-title">话题详细描述
                            </label>
                            <textarea name="topicDescribe" cols="50" rows="15" class="form-control"
                                      style="font-size: 16px;" placeholder="描述"></textarea>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-lg btn-primary"
                                    style="margin-top: 20px">创建
                            </button>
                        </div>
                    </form>
                </div>
                <div class="col-md-6">
                    <label for="showPicture" style="margin-top: 20px">
                        配图
                    </label>
                    <p style="z-index: -10;margin-left: 50px;margin-top: 30px">
                        <img id="showPicture" src="${pageContext.request.contextPath}/images/topic/default.png" value=""
                             width="480" height="270"
                             path="${pageContext.request.contextPath}"
                             srcset="">
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        //异步提交图片文件
        $(":file").on("change", function () {
            var form = new FormData(document.getElementById("topic"));
            $.ajax({
                url: "${pageContext.request.contextPath}/person/topic/uploadPicture",
                type: "post",
                data: form,
                processData: false,
                contentType: false,
                success: function (data) {
                    console.log(data.file)
                    if (data.status === 200) {
                        alert("上传成功")
                        let realPath = data.file;
                        $(":hidden[name='topicPicture']").val(realPath);
                        let contextPath = $("#showPicture").attr("path")
                        //图片回显
                        $("#showPicture").attr("src", contextPath + realPath);
                    }
                }
                // ,
                // error: function (data) {
                //     console.log(data)
                //     if (data.status === 200) {
                //         alert("上传成功")
                //         let path = data.responseText;
                //         $(":hidden[name='topicPicture']").val(path);
                //         //alert(path)
                //         //图片回显
                //         let beginIndex = path.indexOf("/webapp/") + 7;
                //         let endIndex = path.length;
                //         let src = path.substring(beginIndex, endIndex);
                //         $("#showPicture").attr("src", src);
                //     }
                // }
            });
        })

        $("#topic").submit(function () {
            //表单提交,判断是否有照片,没有的话,就提醒先上传照片
            let path = $(":hidden[name='topicPicture']").val();
            if (path !== null && path !== '' && path !== 'undefined') {
                return true;
            }
            alert("请认真填写所有信息")
            return false;
        })

    })
</script>
</body>
</html>