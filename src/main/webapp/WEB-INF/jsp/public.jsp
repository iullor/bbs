<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>公共圈子</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.css">
    <c:if test="${sessionScope.CURRENT_USER.userLoginInfo.theme==0 || empty sessionScope.CURRENT_USER}">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css">
    </c:if>
    <c:if test="${sessionScope.CURRENT_USER.userLoginInfo.theme==1}">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public-pink.css">
    </c:if>
    <script src="${pageContext.request.contextPath}/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sidebar-left-control.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/jsp/foreground/commons/top-navbar.jsp"/>
<div class="container-fluid" style="margin-top: 30px;">
    <div class="row" style="margin-top: 20px;margin-bottom: 15px">
        <div class="col-md-offset-2 col-md-6">
            <h3>话题广场</h3>
        </div>
    </div>
    <div class="row">
        <div class="col-md-offset-2 col-md-6">
            <c:choose>
                <c:when test="${not empty topics}">
                    <c:forEach items="${topics}" var="topic" varStatus="i">
                        <div class="row topic-transfer">
                            <div class="col-md-4" style="margin-top:30px;">
                                <p style="margin-left: -10px;">
                                    <a href="${pageContext.request.contextPath}/public/${topic.id}">
                                        <img class="showUserHeadImg tmp1" value="${topic.topicPicture}"
                                             path="${pageContext.request.contextPath}"
                                             src="${pageContext.request.contextPath}/images/topic/default.png" width="320"
                                             height="180" alt="点击查看话题">
                                    </a>
                                </p>
                            </div>
                            <div class="col-md-8" style="padding-top: 0px;padding-left: 30px">
                                <div style="height:50px;padding-top: 10px;font-size: 20px;border-bottom: 1px black solid;">
                                    <p>
                                        <a href="${pageContext.request.contextPath}/public/${topic.id}">${topic.topicTitle}</a>
                                        <c:if test="${i.index+1<6}">
                                            <span class="pull-right">
                                                <img src="${pageContext.request.contextPath}/images/public/hot1.png" width="50" height="50" alt="">
                                            </span>
                                        </c:if>
                                    </p>
                                </div>
                                <div style="height: 150px;font-size: 18px;padding-top: 30px">
                                    <span>
                                        &nbsp;&nbsp;
                                        <c:set var="longDescribe" value="${topic.topicDescribe}"/>
                                        <c:set var="longDescribe" value="${topic.topicDescribe}"/>
                                        <c:set var="shortDescribe" value="${fn:substring(longDescribe, 0, 130)}"/>
                                        <c:if test="${topic.topicDescribe.length()>130}">
                                            ${shortDescribe}...
                                        </c:if>
                                        <c:if test="${topic.topicDescribe.length()<130}">
                                            ${longDescribe}
                                        </c:if>
                                    </span>
                                </div>
                                <div>
                                    <p class="text-right" style="padding-top: 4px;">
                                        <span style="margin-right: 20px;">
                                            关心 <span class="glyphicon glyphicon-heart-empty"></span>
                                        </span>
                                        <span style="margin-right: 50px;">
                                                创建时间
                                                <f:formatDate value="${topic.createTime}"
                                                              pattern="yyyy-MM-dd HH:mm:ss"/>
                                        </span>
                                        <span style="margin-right: 20px;font-size: 17px">热度${topic.topicParticipations}</span>
                                        <span>浏览数&nbsp;</span>
                                        <span class="glyphicon glyphicon-eye-open"
                                              style="margin-right: 20px;font-size: 18px;">&nbsp;${topic.topicSeen}</span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
            </c:choose>
        </div>
        <div class="col-md-3">
            <div class="row"
                 style="border: 1px solid #00a2d4; height: 530px;width: 380px;margin-left: 20px;background-color: white;z-index: -10;border-radius: 1%;">
                <div style="width: 350px;margin-top: 10px;margin-left: 15px;">
                    <table class="table table-bordered">
                        <tbody>
                        <tr style="background-color: #f5f5f5;">
                            <td width="50%" class="text-center bg-toIndex">
                                <a href="${pageContext.request.contextPath}/index">主页</a>
                            </td>
                            <td width="50%" class="text-center">
                                <a href="${pageContext.request.contextPath}/person/myfocus" style="font-size: 18px;color: black;">我的关注</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div style="border: 1px solid #f5f5f5;border-top: 1px solid rgba(0,0,0,0.19);width: 350px;margin-top: 50px;margin-left: 15px;">
                    <h4 class="text-center">热门话题</h4>
                    <div>
                        <table width="100%" class="table">
                            <tbody>
                            <tr>
                                <td>
                                    <div class="row text-center"
                                         style="width: 105%;margin-left: -6px;margin-top: -8px;">
                                        <c:forEach items="${hotTopicsKeywords}" var="topic">
                                            <div class="col-sm-6 hotTopicsTitle"
                                                 style="height: 40px;font-size: 17px;border: 1px solid silver;padding-top: 8px;">
                                                <a href="${pageContext.request.contextPath}/public/${topic.id}">
                                                        ${topic.topicKeyword}
                                                </a>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div style="border: 1px solid #f5f5f5;border-top: 2px solid #00c3f5;height: 250px;width: 350px;margin-top: 35px;margin-left: 15px">
                    <h4 class="text-center">热门板块</h4>
                    <div>
                        <table width="100%" class="table">
                            <tbody>
                            <tr>
                                <td>
                                    <div class="row text-center"
                                         style="width: 105%;margin-left: -6px;margin-top: -8px;">
                                        <c:forEach items="${hotBoards}" var="board">
                                            <div class="col-sm-6 hotTopicsTitle"
                                                 style="height: 40px;font-size: 17px;border: 1px solid silver;padding-top: 8px;">
                                                <a href="${pageContext.request.contextPath}/board/${board.id}">
                                                        ${board.boardTitle}
                                                </a>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="topic-foot" class="row panel-footer">
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
                    <c:forEach begin="${pageResult.beginIndex}" end="${pageResult.endIndex}" var="pageNumber">
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
                    <li id="lastPage" class="${pageResult.endIndex==pageResult.totalPage?'disabled':''}">
                        <a href="javascript:goPage(${pageResult.totalPage})">
                            末页
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="col-md-2" style="margin-left:-260px;height: 78px;padding-top: 10px;">
            <%--跳转的框--%>
            <form id="goPage" action="${pageContext.request.contextPath}/public" method="get">
                <input type="hidden" name="currentPage">
                <input type="hidden" name="pageSize">
            </form>
            <div id="toPage">
                <input type="text" name="toPage" class="form-text">&nbsp;/&nbsp;${pageResult.totalPage}
                <button type="button" class="btn btn-success">跳转</button>
            </div>
        </div>
    </div>
</div>
<script>
    function goPage(pageNumber) {
        $(":hidden[name='currentPage']").val(pageNumber);
        $(":hidden[name='pageSize']").val(10);
        $("#goPage").submit();
    }

    $(function () {
        //分页一些东西的隐藏与显示
        let search = ${pageResult.totalPage};
        //如果只有一页,隐藏所有
        if (search < 2) {
            $("#foot").hide();
        }
        //如果当前页等于第一页,那么隐藏上一页的按钮
        let currentPage =${pageResult.currentPage};
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
                let endPage = ${pageResult.totalPage};
                if (endPage + 1 > toPage) {
                    goPage(toPage);
                } else {
                    alert("请输入正确的页码");
                }
            } else {
                alert("请输入页码");
            }
        });

        $(".tmp1").mouseover(function () {
            $(this).css({
                "width": "336px",
                "height": "189px",
                "z-index": "10"
            })
        }).mouseleave(function () {
            $(this).css({
                width: "320px",
                height: "180px",
                "z-index": "1"
            })
        })

        $("tr td").on("click", function () {
            $(this).children("a").click();
        })


    })
</script>
</body>
</html>