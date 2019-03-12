<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>模块</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../../lib/bootstrap-switch/bootstrap-switch.min.css">
    <script src="../../../../lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="../../../../lib/bootstrap/bootstrap.min.js"></script>
    <script src="../../../../lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <link rel="stylesheet" href="../../../../css/admin/admin_pages.css">
    <style>
        .form-group {
            bottom: 20px;
        }

        #warning-info {
            margin-top: 150px;
        }
    </style>

</head>
<body>
<div class="container-fluid">
    <h2 class="text-center">模块列表</h2>
    <br>
    <div class="col-md-offset-9 col-md-2">
        <div class="form-group">
            <form action="" id="searchByPanelTitle">
                <input type="text" class="form-control" name="inputPanelTitle" placeholder="模块名">
                <span class="input-group-btn">
                    <button type="submit" class="btn btn-default">查找<span
                            class="glyphicon glyphicon-search"></span></button>
                </span>
            </form>
        </div>
    </div>
    <div class="col-md-1">
        <div class="input-group">
            <button class="btn btn-default">显示全部 <span class="glyphicon glyphicon-menu-hamburger"></span></button>
        </div>
    </div>

    <br>
    <div class="panel-group">
        <div class="panel panel-warning" id="allPanels">
            <div class="panel-heading">
                <div class="panel-title">
                    状态信息
                </div>
            </div>
            <div class="panel-body">
                <table class="table table-hover table-striped text-left">
                    <thead>
                    <th>id</th>
                    <th>logo</th>
                    <th>标题</th>
                    <th>管理者</th>
                    <th>板块简介</th>
                    <th>创建时间</th>
                    <th>修改</th>
                    <th>删除</th>
                    </thead>
                    <tbody>
                    <c:forEach items="${panels}" var="p" varStatus="i">
                        <tr>
                            <td><a href="#">${p.id}</a></td>
                            <td><a href="#">${p.logoPath}</a></td>
                            <td><a href="#">${p.title}</a></td>
                            <td><a href="#">${p.userList[0].username}</a></td>
                            <td><a href="#">${p.info}</a></td>
                            <td><a href="#">
                                <f:formatDate value="${p.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                            </a></td>
                            <td><a href="/panel/input/${p.id}">编辑</a></td>
                            <td><a class="delete" href="/panel/${p.id}">删除</a></td>
                            <form action="" method="POST">
                                <input type="hidden" name="_method" value="DELETE"/>
                            </form>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        /**
         * 页面list之后，搜索结果展示的隐藏
         */
        $(".delete").on("click", function () {
            var i = confirm("你确定要删除当前用户吗？");
            alert(i)
            if (i) {
                alert($(this).attr("href"));
                var href = $(this).attr("href");
                $("form").attr("action", href).submit();
            }
            return false;
        })

        $("#searchByPanelTitle").submit(function () {
            var key = $("input[name='inputPanelTitle']").val();
            /**
             * 封装为obj对象，再用js将对象转换为json传输
             * @type {{title: (*|jQuery)}}
             */
            var obj = {
                title: key
            }
            alert(key)
            if (key != null && key !== '') {
                $.ajax({
                    url: "/panel/searchByPanelTitle",
                    type: "post",
                    data: JSON.stringify(obj),
                    contentType: "application/json",
                    success: function (data) {
                        if (data.status == "2000") {
                            alert("查询到几条结果")
                           /* var panels = JSON.parse(data["0"]);*/
                            //data.panels;
                            $("tbody").empty();
                            $(data.panels).each(function (key,value) {
                                console.log(key)
                                console.log(value)
                            })
                        } else if ("2001") {
                            alert("查询结果为空")
                        }
                    },
                    error: function (e) {
                        alert(e)
                    }
                });

            } else {
                alert("请输入要查询的关键词")
            }
            return false;
        })
    })

</script>
</body>
</html>