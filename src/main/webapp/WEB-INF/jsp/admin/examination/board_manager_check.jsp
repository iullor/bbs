<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>版主申请</title>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">--%>
    <link rel="icon" type="image/x-icon" href="/images/favicon.ico" />
    <link rel="stylesheet" href="/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="/lib/bootstrap-switch/bootstrap-switch.min.css">
    <script src="/lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="/lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <link rel="stylesheet" href="../../../../../css/admin/admin_pages.css">
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
    <h2 class="text-left">版主申请</h2>
    <br>
    <div class="panel-group">
        <div class="panel panel-warning">
            <div class="panel-heading">
                <div class="panel-title">
                    <ul class="nav nav-pills" role="tablist">
                        <li role="presentation"><a href="#">未审核<span class="badge text-danger">${options.size()}</span></a></li>
                        <li role="presentation"><a href="#">已审核 <span class="badge"></span></a></li>
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
                                    <td><a href="/board/${op.board.id}">${op.board.boardTitle}</a></td>
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
                                            <input type="hidden" name="boardId" value="${op.board.id}"/>
                                            <input type="hidden" name="applyUserId" value="${op.user.id}"/>
                                            <input type="hidden" name="board.boardTitle" value="${op.board.boardTitle}"/>
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
                <c:choose>
                    <c:when test="${not empty options}">
                        <table class="table table-hover table-striped text-left">
                            <thead>
                            <th>id</th>
                            <th>标题</th>
                            <th>板块简介</th>
                            <th>创建时间</th>
                            <th>修改</th>
                            <th>删除</th>
                            </thead>
                            <tbody>
                            <c:forEach items="${options}" var="op1">
                                <tr>
                                    <td><a href="#">啦啦啦</a></td>
                                    <td><a href="#">a</a></td>
                                    <td><a href="#">a</a></td>
                                    <td><a href="#">a</a></td>
                                    <td><a href="#">a</a></td>
                                    <td><a href="#">a</a></td>
                                    <td><a href="#">a</a></td>
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
            <c:if test="${options.size()>5}">
                <div class="panel-footer">
                    <nav class="Page navigation text-center">
                        <ul class="pagination">
                            <li class="disabled">
                                <a href="#" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li class="active"><a href="#">1</a></li>
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
            </c:if>
        </div>
    </div>
</div>
<script>
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

    })
</script>
</body>
</html>