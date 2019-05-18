<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>审核审查</title>
    <link rel="icon" type="image/x-icon" href="/images/favicon.ico" />
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/lib/bootstrap-switch/bootstrap-switch.min.css">
    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/jsrender/1.0.2/jsrender.js"></script>
    <script src="/lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <link rel="stylesheet" href="/css/admin/admin_pages.css">
    <style>
        .input-group {
            bottom: 20px;
        }

        .form-text {
            line-height: 25px;
            margin-left: 10px;
            width: 20%;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <h2 class="text-left">贴子申请</h2>
    <br>
    <div class="panel-group">
        <div class="panel panel-warning">
            <div class="panel-heading">
                <div class="panel-title">
                    <ul class="nav nav-pills" role="tablist">
                        <li role="presentation"><a href="#">未审核<span class="badge text-danger">${options.size()}</span></a>
                        </li>
                        <li role="presentation" class="hasRead"><a href="#">已审核 <span class="badge"></span></a></li>
                    </ul>
                </div>
            </div>
            <div class="panel-body">
                <c:choose>
                    <c:when test="${not empty options}">
                        <table class="table table-hover table-striped table-bordered ">
                            <thead>
                            <th>id</th>
                            <th>用户名</th>
                            <th>类型</th>
                            <th>相关</th>
                            <th>理由</th>
                            <th>申请时间</th>
                            <th>操作</th>
                            <th>添加说明</th>
                            </thead>
                            <tbody>
                            <c:forEach items="${options}" var="op" varStatus="i">
                                <tr>
                                    <td><a href="#">${i.index+1}</a></td>
                                    <td><a href="/account/${op.user.id}">${op.user.nickName}</a></td>
                                    <td>${op.applyType}</td>
                                    <td><a href="/post/${op.post.id}">${op.post.postTitle}</a></td>
                                    <td>
                                        <a href="#">${op.brief}
                                            <a href="/admin/apply/showApplyReason/${op.id}" title="点击查看详情"
                                               class="pull-right" target="_blank">查看</a>
                                        </a>
                                    </td>
                                    <td>
                                        <span>
                                            <f:formatDate value="${op.applyTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                        </span>
                                    </td>
                                    <td>
                                        <select name="status">
                                            <option value="-1">请选择</option>
                                            <option value="3">同意</option>
                                            <option value="4">拒绝</option>
                                            <option value="5">忽略</option>
                                        </select>
                                    </td>
                                    <td>
                                        <form action="/admin/check" class="remakes" method="post">
                                            <input type="text" width="50" name="remakes">
                                            <input type="hidden" name="id" value="${op.id}"/>
                                            <input type="hidden" name="status" value=""/>
                                            <input type="hidden" name="postId" value="${op.post.id}"/>
                                            <input type="hidden" name="applyUserId" value="${op.user.id}"/>
                                            <input type="hidden" name="post.postTitle" value="${op.post.postTitle}"/>
                                            <button type="submit" class="btn btn-small btn-info">添加</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <div class="text-center" style="font-size: 30px;margin-top: 80px;margin-bottom: 50px;">
                            <h3>暂无未处理过的信息</h3>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="panel-body">
                <table class="table table-hover table-striped text-left table-bordered">
                    <thead>
                    <th>id</th>
                    <th>用户名</th>
                    <th>类型</th>
                    <th>相关</th>
                    <th>理由</th>
                    <th>申请时间</th>
                    <th>操作</th>
                    <th>添加说明</th>
                    </thead>
                    <tbody id="listHasChecked">
                    </tbody>
                </table>
                <script type="text/x-jsrender" id="hasChecked">
                  {{for data}}
                        {{else}}
                                <tr>
                                    <td>
                                        {{:#getIndex()+1}}
                                    </td>
                                    <td>
                                         <a href="/account/{{:user.id}}">{{:user.nickName}}</a>
                                    </td>
                                    <td><a href="#">{{:applyType}}</a></td>
                                    <td><a href="/post/{{:post.id}}">{{:post.postTitle}}</a></td>
                                    <td>
                                        <a href="#">{{:brief}}</a>
                                        <a href="/person/apply/showApplyReason/{{:id}}" class="pull-right">详情</a>
                                    </td>
                                    <td>
                                        <a href="#">{{:applyTime}}</a>
                                    </td>
                                    <td>
                                        {{if status==3}}
                                               通过
                                        {{else status==4}}
                                                拒绝
                                        {{else status==5}}
                                                忽略
                                        {{/if}}
                                     </td>
                                    <td>
                                        {{:remakes}}
                                    </td>
                                </tr>
                    {{/for}}
                </script>
                <div id="haveNot" class="text-center" style="font-size: 30px;margin-top: 80px;margin-bottom: 50px;">
                    <h3>暂无未处理过的信息</h3>
                </div>
            </div>
            <div id="foot" class="row panel-footer panel-default">
                <div class="col-md-offset-4 col-md-4">
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
                <div class="col-md-2" style="margin-left:-70px;height: 78px;padding-top: 10px;">
                    <%--跳转的框--%>
                    <form id="goPage" action="/admin/check/post" method="get">
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
    </div>
</div>
<script>
    function goPage(pageNumber) {
        $(":hidden[name='currentPage']").val(pageNumber);
        $(":hidden[name='pageSize']").val(10);
        $("#goPage").submit();
    }
    $(function () {
        $(".show-evidence").css({"width": "200px", "height": "50px"}).hide();
        $(".nav-pills>li:first-child").attr("class", "active");
        $(".panel-body:last").hide();
        $(".nav-pills>li").click(function () {
            //$(this).siblings() 是dom 元素，需要把他转换为jquery 函数才能使用方法
            $($(this).siblings()).attr("class", "");
            $(this).attr("class", "active");
            var index1 = $(this).index();
            $(".panel-body").hide();
            $(".panel-body").eq(index1).show();
        })

        $("select[name='status']").on("change", function () {
            var status = $(this).val();
            $(this).parent("td").next("td").children("form").children("input[name='status']").val(status)
        })
        //使用ajax来异步发送备注
        $(".remakes").on("click", function () {
            let status = $(this).children("input[name='status']").val();
            if (status !== null && status !== '' && status !== 'undefined') {
                return true;
            }
            alert("请先选择状态")
            return false;
        })
        //使用异步技术，来查看已经审核的
        $(".hasRead").on("click", function () {
            $.ajax({
                url: '/admin/check/post/hasChecked',
                type: 'get',
                contentType: 'application/json',
                success: function (data) {
                    console.log(data)
                    console.log(data.length)
                    if (data.length > 0) {
                        $("#haveNot").hide();
                    }
                    var html = $("#hasChecked").render(data);
                    $("#listHasChecked").html(html);
                }
            })
        })
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
    })
</script>
</body>
</html>