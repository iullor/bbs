<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">--%>
    <link rel="icon" type="image/x-icon" href="/images/favicon.ico" />
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="/js/sidebar-left-control.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row" style="margin-top: 50px;">
        <div class="col-md-12">
            <h3>
                主页显示
                <small>(一次只能展示3条)</small>
            </h3>
            <c:choose>
                <c:when test="${not empty hotTopics}">
                    <table id="showAllTopics" class="table table-bordered table-striped table-hover">
                        <thead>
                        <th>序号</th>
                        <th>话题标题</th>
                        <th>创建者</th>
                        <th class="text-center">缩略图</th>
                        <th>时间</th>
                        <th>浏览量</th>
                        <th>参与度</th>
                        <th class="text-center">移除</th>
                        </thead>
                        <tbody>
                        <c:forEach items="${hotTopics}" var="hotTopic" varStatus="i">
                            <tr>
                                <td>${i.index+1}</td>
                                <td>
                                    <a href="/public/${hotTopic.id}" target="_blank">${hotTopic.topicTitle}</a>
                                </td>
                                <td>${hotTopic.user.nickName}</td>
                                <td class="text-center">
                                    <img src="" class="showUserHeadImg" width="80" height="45"
                                         value="${hotTopic.topicPicture}" alt="">
                                </td>
                                <td>
                                    <f:formatDate value="${hotTopic.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                </td>
                                <td>${hotTopic.topicSeen}</td>
                                <td>${hotTopic.topicParticipations}</td>
                                <td width="8%" class="text-center">
                                    <a href="#" class="minus" tid="${hotTopic.id}">
                                        <span class="glyphicon glyphicon-minus text-danger text-center"></span>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <h3 style="text-align: center;margin-top: 100px;">
                        <a href="/admin/topic/input/0">添加到主页</a>
                    </h3>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <hr>
    <div class="row" style="margin-top: 50px;">
        <div class="col-md-12">
            <h3>所有的话题</h3>
            <form action="/admin/topic/search/" method="get">
                <div class="col-md-offset-6 col-md-4" style="margin-bottom: 10px;">

                    <input type="text" name="topicTitle" class="form-control" style="line-height:30px;font-size: 16px;"
                           placeholder="话题标题">
                </div>
                <div class="col-md-2">
                    <button class="btn btn-info" type="submit"> 搜索 </button>
                    <a href="/admin/topic" class="btn btn-success pull-right">显示全部</a>
                </div>
            </form>
            <c:choose>
                <c:when test="${not empty topics}">
                    <table id="showAllTopics" class="table table-hover">
                        <thead>
                        <th>序号</th>
                        <th>话题标题</th>
                        <th>创建者</th>
                        <th class="text-center">缩略图</th>
                        <th>时间</th>
                        <th>浏览量</th>
                        <th>参与度</th>
                        <th class="text-center">首页显示</th>
                        </thead>
                        <tbody>
                        <c:forEach items="${topics}" var="topic" varStatus="i">
                            <tr>
                                <td>${i.index+1}</td>
                                <td>
                                    <a href="/public/${topic.id}" target="_blank">${topic.topicTitle}</a>
                                </td>
                                <td>${topic.user.nickName}</td>
                                <td class="text-center">
                                    <img src="" class="showUserHeadImg" width="80" height="45"
                                         value="${topic.topicPicture}" alt="">
                                </td>
                                <td>
                                    <f:formatDate value="${topic.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                </td>
                                <td>${topic.topicSeen}</td>
                                <td>${topic.topicParticipations}</td>
                                <td width="8%" class="text-center">
                                    <a href="#" class="plus" tid="${topic.id}">
                                        <span class="glyphicon glyphicon-plus text-danger text-center"></span>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <h3 style="text-align: center;margin-top: 100px;">
                        当前暂没有， <a href="/admin/topic/input/0">去添加</a>
                    </h3>
                </c:otherwise>
            </c:choose>
        </div>
        <form action="/admin/topic/update" id="tmp" method="post">
            <input type="hidden" name="id">
            <input type="hidden" name="level">
        </form>
    </div>
    <%--分页--%>
    <div id="foot" class="row" style="margin-top: 100px;">
        <div class="col-md-offset-3 col-md-4">
            <nav class="Page navigation">
                <ul class="pagination">
                    <li id="firstPage" style="margin-right: 20px">
                        <a href="javascript:goPage(1)" aria-label="Previous">
                            <span aria-hidden="true">首页</span>
                        </a>
                    </li>
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
        <div class="col-md-3" style="margin-left:-70px;height: 78px;padding-top: 10px;">
            <%--跳转的框--%>
            <form id="goPage" action="/admin/topic" method="get">
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
        $(":hidden[name='pageSize']").val(5);
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


        //更改显示级别
        $(".plus").on("click", function () {
            let tid = $(this).attr("tid");
            $("#tmp").children("input:first-child").val(tid);
            $("#tmp").children("input:last-child").val(1);
            $("#tmp").submit();
        })
        $(".minus").on("click", function () {
            let tid = $(this).attr("tid");
            $("#tmp").children("input:first-child").val(tid);
            $("#tmp").children("input:last-child").val(0);
            $("#tmp").submit();
        })


    })
</script>
</body>
</html>