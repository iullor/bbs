<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户基本信息</title>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">--%>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap-switch/bootstrap-switch.min.css">
    <script src="${pageContext.request.contextPath}/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/admin_pages.css">
    <style>
    </style>

</head>
<body>
<div class="container-fluid">
    <h2 class="text-center">基本信息</h2>
    <br>
    <div class=" row col-md-1" style="margin-top: 10px">
        <a href=""><span class="glyphicon glyphicon-arrow-left" id="back">返回</span></a>
    </div>
    <div class="row">
        <div class="col-md-8">
            <h3 style="margin-top: 30px;">${user.username}</h3>
            <hr style="background-color: grey;height: 1px; border: none;width: 92%;margin-left: 0px">
            <div class="row" style="width: 92%">
                <div class="form-group col-md-4">
                    <label class="control-label">姓名
                    </label>
                    <div class="well">
                        <blockquote>
                            ${user.userBaseInfo.realName}
                        </blockquote>
                    </div>
                </div>
                <div class="form-group col-md-4">
                    <label class="control-label">age
                    </label>
                    <div class="well">
                        <blockquote>
                            ${user.userBaseInfo.age}
                        </blockquote>
                    </div>
                </div>
                <div class="form-group col-md-4">
                    <label class="control-label">Birthday</label>
                    <div class="well">
                        <blockquote>
                            <f:formatDate value="${user.userBaseInfo.birthday}" pattern="yyyy-MM-dd"/>
                        </blockquote>
                    </div>
                </div>
            </div>
            <div class="row" style="width: 92%">
                <div class="form-group col-md-12">
                    <label class="control-label">QQ
                    </label>
                    <div class="well">
                        <blockquote>
                            ${user.userBaseInfo.qqNumber}
                        </blockquote>
                    </div>
                </div>
            </div>
            <div class="row" style="width: 92%">
                <div class="form-group col-md-12">
                    <label class="control-label">Phone Number
                    </label>
                    <div class="well">
                        <blockquote>
                            ${user.userBaseInfo.phoneNumber}
                        </blockquote>
                    </div>
                </div>
            </div>
            <div class="row" style="width: 92%">
                <div class="form-group col-md-4">
                    <label class="control-label">省份
                        <small>&nbsp;(必填)</small>
                    </label>
                    <div class="well">
                        <blockquote>
                            ${user.userBaseInfo.province}
                        </blockquote>
                    </div>
                </div>
                <div class="form-group col-md-4">
                    <label class="control-label">城市
                        <small>&nbsp;(必填)</small>
                    </label>
                    <div class="well">
                        <blockquote>
                            ${user.userBaseInfo.city}
                        </blockquote>
                    </div>
                </div>
                <div class="form-group col-md-4">
                    <label class="control-label">街道
                        <small>&nbsp;(必填)</small>
                    </label>
                    <div class="well">
                        <blockquote>
                            ${user.userBaseInfo.street}
                        </blockquote>
                    </div>
                </div>
            </div>
            <div class="row" style="width: 92%">
                <div class="col-md-12">
                    <label class="control-label">详细地址
                    </label>
                    <div class="well">
                        <blockquote>
                            ${user.userBaseInfo.details}
                        </blockquote>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <%--<label class="control-label">头像</label>--%>
            <div style="margin-top: 100px;margin-left: 30px">
                <a href="" target="_blank">
                    <img src="" value='${pageContext.request.contextPath}/${user.userBaseInfo.headImage}' alt="" width="200" height="200">
                </a>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        $("#back").click(function () {
            window.history.go(-1)
            return false;
        })
        $("img").each(function () {
            let tmp = $(this).attr("value");
            let beginIndex = tmp.lastIndexOf("/webapp/") + 7;
            let endIndex = tmp.length;
            var realPath = tmp.substring(beginIndex, endIndex);
            $(this).attr("src", realPath);
            $(this).parent("a").attr("href", realPath);
        });
    })
</script>
</body>
</html>