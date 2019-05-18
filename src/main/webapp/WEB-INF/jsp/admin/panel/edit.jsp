<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>模块增加</title>
    <%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">--%>
    <link rel="icon" type="image/x-icon" href="/images/favicon.ico"/>
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/lib/bootstrap-switch/bootstrap-switch.min.css">
    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="/lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <link rel="stylesheet" href="/css/admin/admin_pages.css">
    <style>

        .container-fluid {
            height: auto;
            min-height: 900px;
        }

        #upload_placeholder .glyphicon-plus {
            font-size: 100px;
        }

        #logo {
            margin-top: 30px;
            display: none;
        }

        #showImg {
            width: 100px;
            height: 100px;
        }

        #showImg:hover {
            transition-delay: 200ms;
            height: 150px;
            width: 150px;
        }

        #uploadForm > div:nth-child(2) {
            top: 20px;
        }
    </style>
    <script>
    </script>
</head>
<body>
<div class="container-fluid">
    <div style="margin-top: 0px">
        <a href=""><span class="glyphicon glyphicon-arrow-left" id="back">返回</span></a>
    </div>
    <br>
    <div class="row" style="margin-top: 5px;border: 1px solid #f5f5f5;padding-top: 0px;">
        <h2 class="text-left" style="margin-bottom: 50px"></h2>
        <div id="addModel" class="col-md-offset-1 col-md-6">
            <%--
                modelAttribute="panel"该标签去请求中找一个panel 的对象
                这里判断，是否panel中有值，
                该值在/panel/input/{id} 中获取id，
                    用pid，查询db，有的话，赋值给 panel，传递给页面，页面通过panel.id 是否有值，来判断是否添加隐藏域，给springmvc框架标示为restful 接口风格
            --%>
            <form:form action="/admin/panel" modelAttribute="panel" method="post">
                <c:if test="${not empty panel.id}">
                    <input type="hidden" name="_method" value="put">
                    <form:hidden path="id"/>
                </c:if>
                <div class="row form-group">
                    <div class="col-md-2">
                        <label for="title" style="font-size: 17px">
                            标题<br>
                            <small>(不超过5个字)</small>
                        </label>
                    </div>
                    <div class="col-md-8">
                        <form:input path="title" class="form-control" id="title"/>
                    </div>
                </div>
                <form:hidden path="logoPath"/>
                <form:hidden path="createTime"/>
                <br>
                <div class="row form-group">
                    <div class="col-md-2" style="font-size: 17px">
                        <label class="text-left">模块管理者</label>
                    </div>
                    <div class="col-md-6">
                        <form:select cssClass="form-control" path="panelManagerId" items="${users}" itemLabel="username"
                                     itemValue="id"/>
                    </div>
                </div>
                <br>
                <div class="row form-group">
                    <div class="col-md-2" style="font-size: 17px">
                        <label for="info">
                            简介<br>
                            <small>(50字以内)</small>
                        </label>
                    </div>
                    <div class="col-md-8">
                        <form:textarea path="info" id="info" cols="80" rows="8" placeholder="该模块主要用来..."/>
                    </div>
                </div>
                <br>
                <div class="row form-group">
                    <div class="col-md-2" style="font-size: 17px">
                        <label for="detail">
                            功能详情<br>
                            (200字内)
                        </label>
                    </div>
                    <div class="col-md-8">
                        <form:textarea id="detail" path="detail" cols="80" rows="13" placeholder="该模块详情..."/>
                    </div>
                </div>
                <br>
                <div class="row form-group">
                    <div class="col-md-2">
                        <label>是否可见</label>
                    </div>
                    <div class="col-md-8">
                        <input type="checkbox" name="panelDisabled" value="${panel.panelDisabled}"
                               style="height: 30px;width: 30px;color: #f0ad4e;">
                        <c:if test="${panel.panelDisabled==1}">
                            <span class="text-info panelDisabled-info">（可见）</span>
                        </c:if>
                        <c:if test="${panel.panelDisabled==0}">
                            <span class="text-info panelDisabled-info">（不可见）</span>
                        </c:if>
                    </div>
                </div>
                <br>
                <div class="row form-group">
                    <div class="col-md-offset-2  col-md-2">
                        <button type="submit" class="btn btn-info btn-lg">添加</button>
                    </div>
                    <div class="col-md-2">
                        <button type="reset" class="btn btn-default btn-lg">重置</button>
                    </div>
                </div>
            </form:form>
        </div>
        <div id="addImg" class="col-md-2 ">
            <div style="border: 1px solid #f5f5f5;height: 360px;margin-left: 50px;width: 100%">
                <form action="" id="uploadForm">
                    <div class="row form-group">
        <span class="pull-left"
              style=" writing-mode:vertical-lr; font-size: 30px;margin-top: 30px;margin-left: 20px;">图标</span>
                        <div id="upload_placeholder" class="text-center">
                            <span class="glyphicon glyphicon-plus"></span>
                            <br>
                            <input type="file" formenctype="multipart/form-data" name="img" id="logo"/>
                            <button id="upload" type="button" class="btn btn-success">
                                上传图片
                            </button>
                            <p class="text-center" style="margin-top: 10px">(不超过1M,200*200)</p>
                        </div>
                    </div>
                    <div class="row form-group text-center" style="margin-top: 10px">
                        <img id="showImg" src="">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</div>
<script>
    $(function () {
        //默认是0
        //如果选中，将值变为1，回显
        var tmpValue = $(":checkbox[name='panelDisabled']").attr("value");
        if (tmpValue == 1) {
            $(":checkbox[name='panelDisabled']").attr("checked", "checked")
        }
        $(":checkbox[name='panelDisabled']").on("change", function () {
            let checkedOrNot = $(this).attr("value")
            if (checkedOrNot == 1) {
                $(this).attr("value", 0)
                $(this).removeAttr("checked")
                $(".panelDisabled-info").html("(不可见)")
            } else {
                $(this).attr("checked", "checked")
                $(this).attr("value", 1)
                $(".panelDisabled-info").html("(可见)")
            }
            //alert(checkedOrNot);
        });


        $("#back").click(function () {
            window.history.go(-1);
            return false;
        })
        var str = ${not empty panel.id} ? '模块修改' : '模块增加';
        var str1 = ${not empty panel.id} ? '提交修改' : '新增';
        $("h2").html(str)
        $("button[type='submit']").html(str1);
        //文件上传
        $("#upload_placeholder>span").click(function () {
            $(":file").click()
        })
        $("#upload").click(function () {
            var form = new FormData(document.getElementById("uploadForm"));
            $.ajax({
                url: "/admin/panel/fileUpload",
                type: "post",
                data: form,
                processData: false,
                contentType: false,
                success: function (data) {
                    if (data.status == 200) {
                    }
                },
                error: function (e) {
                    if (e.status == 200) {
                        alert("上传成功")
                        /**
                         * 找到相对位置
                         * @type {number}
                         */
                        var lastIndex = (e.responseText).search("/webapp/") + 7;
                        var str = (e.responseText).substring(lastIndex, (e.responseText).length)
                        $("#showImg").attr("src", str)
                        $("input[name='logoPath']").val(e.responseText)
                    }
                }
            });
            get();//此处为上传文件的进度条
        })

        //表单判断
        $("form:first-child").submit(function () {
            var title = $(":input[name='title']").val();
            var info = $(":input[name='info']").val();
            var detail = $(":input[name='detail']").val();
            var logoPath = $(":input[name='logoPath']").val();
            if (title == null || title === '') {
                alert("请填写标题")
                return false;
            }
            if (info == null || info === '') {
                alert("请填写简介")
                return false;
            }
            if (detail == null || detail === '') {
                alert("请填写详情信息")
                return false;
            }
            if (logoPath == null || logoPath === '') {
                alert("请先上传文件")
                return false;
            }
            return true;
        })
        //图片回显
        if (${not empty panel.id}) {
            var pictruePath = $("#logoPath").val();
            var lastIndex = pictruePath.search("/webapp/") + 7;
            var str = (pictruePath).substring(lastIndex, pictruePath.length)
            $("#showImg").attr("src", str)
        }
    })

</script>
</body>
</html>