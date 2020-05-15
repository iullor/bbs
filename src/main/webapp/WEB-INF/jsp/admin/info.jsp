<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>后台管理页面首页</title>
    <%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css">--%>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/lib/bootstrap-switch/bootstrap-switch.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/admin_pages.css">
    <script src="${pageContext.request.contextPath}/lib/jQuery/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/lib/bootstrap-switch/bootstrap-switch.min.js"></script>
    <%--引入echarts库--%>
    <script src="${pageContext.request.contextPath}/lib/echarts/echarts.js"></script>
    <style>
        table thead th {
            text-align: center;
        }

        table tr td {
            text-align: center;
        }

        #panelBarChart {
            width: 800px;
            height: 600px;
            margin: 50px 10px;
        }

        #panelPieChart {
            width: 400px;
            height: 350px;
        }

        #areaEachPanelPieChart {
            width: 600px;
            height: 350px;
        }

        /*第二行*/
        #areaAndBoardEachPanelBarChart {
            width: 700px;
            height: 400px;
            margin: 0px 10px;
        }

        #postAndAreaEachBoardChart {
            width: 700px;
            height: 400px;
            margin: 0px 10px;
        }

        #postTypePieChart {
            width: 450px;
            height: 400px;
            margin: 50px;
        }

        #postNumbersEachHourLineChart {
            width: 100%;
            height: 600px;
            margin: 50px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <h3 class="text-danger">系统运行信息</h3>
    <div class="row">
        <table class="table table-striped table-bordered table-hover">
            <thead>
            <th width="10%">
                <span class="glyphicon glyphicon-user"></span>&nbsp;系统用户
            </th>
            <th><span class="glyphicon glyphicon-th-large"></span>&nbsp;系统模块</th>
            <th><span class="glyphicon glyphicon-equalizer"></span>&nbsp;系统板块</th>
            <th><span class="glyphicon glyphicon-th"></span>&nbsp;系统分区</th>
            <th><span class="glyphicon glyphicon-flag"></span>&nbsp;系统贴子</th>
            <th><span class="glyphicon glyphicon-list-alt"></span>&nbsp;系统话题</th>
            <th><span class="glyphicon glyphicon-volume-up"></span>&nbsp;系统公告</th>
            <th><span><img src="${pageContext.request.contextPath}/images/public/stick.png" width="15" height="15"></span>&nbsp;置顶贴子</th>
            <th><span><img src="${pageContext.request.contextPath}/images/public/hot.png" width="20" height="20"></span>&nbsp;热门话题</th>
            </thead>
            <tbody>
            <tr>
                <td class="text-warning">
                    ${systemInfo.userNumbers}
                </td>
                <td class="text-info">
                    ${systemInfo.panelNumbers}
                </td>
                <td class="text-primary">
                    ${systemInfo.boardNumbers}
                </td>
                <td class="text-success">
                    ${systemInfo.areaNumbers}
                </td>
                <td class="text-warning">
                    ${systemInfo.postNumbers}
                </td>
                <td class="text-danger">
                    ${systemInfo.topicNumbers}
                </td>
                <td class="text-info">
                    ${systemInfo.noticeNumbers}
                </td>
                <td class="text-primary">
                    ${systemInfo.upPostNumbers}
                </td>
                <td class="text-success">
                    ${systemInfo.hotTopicNumbers}
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <h3 class="text-info">综合</h3>
    <hr>
    <div class="row">
        <div class="col-md-6">
            <div id="panelBarChart"></div>
        </div>
        <div class="col-md-6">
            <div id="panelPieChart"></div>
            <div id="areaEachPanelPieChart"></div>
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col-md-6">
            <h4 style="margin-left: 13%">选择模块</h4>
            <select name="eachPanel" id="eachPanel" class="form-control" style="width:30%;margin-left: 13%">
                <c:forEach items="${panels}" var="panel" varStatus="i">
                    <option value="${panel.id}" ${i.index==0?'selected':''}>${panel.title}</option>
                </c:forEach>
            </select>
            <div id="areaAndBoardEachPanelBarChart"></div>
        </div>
        <div class="col-md-6">
            <h4 style="margin-left: 13%">选择板块</h4>
            <select name="eachBoard" id="eachBoard" class="form-control" style="width:30%;margin-left: 13%">
                <c:forEach items="${boards}" var="board" varStatus="i">
                    <option value="${board.id}" ${i.index==0?'selected':''}>${board.boardTitle}</option>
                </c:forEach>
            </select>
            <div id="postAndAreaEachBoardChart"></div>
        </div>
    </div>
    <hr>
    <div class="row">
        <h3 class="text-info">贴子</h3>
        <div class="col-md-offset-6 col-md-6">
            <div id="postTypePieChart"></div>
        </div>
        <div class="col-md-12">
            <div id="postNumbersEachHourLineChart"></div>
        </div>
    </div>
    <hr>
    <div class="row">
        <h3 class="text-info">用户</h3>
    </div>
    <hr>
</div>
</body>
<%--模块的柱形图--%>
<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('panelBarChart'));
    // 指定图表的配置项和数据
    //获取每个模块的帖子数
    var postNumberEachPanel = '${postNumberEachPanel}'
    console.log(postNumberEachPanel)
    var panelJSON = JSON.parse(postNumberEachPanel);
    var panelTitle1 = new Array()
    var postsEachPanel = new Array()
    for (let i = 0; i < panelJSON.length; i++) {
        //这里定义x轴显示的一些样式
        panelTitle1[i] = {
            value: panelJSON[i].title,
            textStyle: {
                fontSize: 18,
                padding: [10, 5]
            }
        }
        postsEachPanel[i] = panelJSON[i].postNumbers
    }
    //console.log(panelTitle1)
    var option = {
        title: {
            text: '各模块帖子数',
            textStyle: {
                fontSize: 25
            }
        },
        grid: {
            x: 100,
            y: 100,
            x2: 100,
            y2: 50,
        },
        tooltip: {},
        legend: {
            top: '8%',
            right: '5%',
            data: ['贴子']
        },
        xAxis: {
            name: '模块名字',
            data: panelTitle1
        },
        yAxis: {
            name: '贴子数量',
        },
        series: [{
            name: '贴子',
            type: 'bar',
            data: postsEachPanel,
            barWidth: '10%',
            barGap: '30%',
            tooltip: [{
                padding: [30, 5]
            }]
        }
        ],
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
<%--模块的饼图--%>
<script type="text/javascript">
    var myChart1 = echarts.init(document.getElementById('panelPieChart'));
    // 指定图表的配置项和数据
    //获取每个模块的帖子数
    var postNumberEachPanel = '${postNumberEachPanel}'
    var panelJSON = JSON.parse(postNumberEachPanel);
    //console.log(panelJSON)
    var data1 = new Array();
    //拼接data=[{value:'',name:''}]的形式
    for (let i = 0; i < panelJSON.length; i++) {
        data1[i] = {
            value: panelJSON[i].postNumbers,
            name: panelJSON[i].title
        }
    }
    //console.log(data1)
    var option1 = {
        title: {
            text: '各模块帖子比例',
            textStyle: {
                fontSize: 22
            }
        },
        grid: {
            x: 100,
            y: 100,
            x2: 100,
            y2: 50,
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        series: [{
            name: '贴子',
            type: 'pie',
            data: data1.sort(function (a, b) {
                return a.value - b.value;
            }),
            label: {
                fontSize: 18
            },
            barWidth: '10%',
            barGap: '30%',
            roseType: 'radius',
            tooltip: [{
                padding: [30, 5]
            }]
        }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart1.setOption(option1);
</script>
<%--模块的饼图--%>
<script type="text/javascript">
    var myChart2 = echarts.init(document.getElementById('areaEachPanelPieChart'));
    // 指定图表的配置项和数据
    //获取每个模块的帖子数
    var postNumberEachPanel = '${postNumberEachPanel}'
    var panelJSON = JSON.parse(postNumberEachPanel);
    //console.log(panelJSON)
    var data2 = new Array();
    //拼接data=[{value:'',name:''}]的形式
    for (let i = 0; i < panelJSON.length; i++) {
        data2[i] = {
            value: panelJSON[i].areaNumbers,
            name: panelJSON[i].title
        }
    }
    //console.log(data2)
    var option2 = {
        title: {
            text: '各模块分区比例',
            textStyle: {
                fontSize: 22
            }
        },
        grid: {
            x: 100,
            y: 100,
            x2: 100,
            y2: 50,
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        series: [{
            name: '分区',
            type: 'pie',
            data: data2.sort(function (a, b) {
                return a.value - b.value;
            }),
            label: {
                fontSize: 18
            },
            barWidth: '10%',
            barGap: '30%',
            roseType: 'radius',
            tooltip: [{
                padding: [30, 5]
            }]
        }
        ],
        color: ['#2f4554', '#61a0a8', '#d48265', '#91c7ae', '#749f83', '#ca8622', '#bda29a', '#6e7074', '#546570', '#c4ccd3']
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart2.setOption(option2);
</script>
<%--每个模块中板块和分区的关系柱形图--%>
<script type="text/javascript">
    var myChart3 = echarts.init(document.getElementById('areaAndBoardEachPanelBarChart'));
    // 指定图表的配置项和数据
    //获取每个模块的帖子数
    var eachBoard = '${eachBoard}'
    var eachBoardJSON = JSON.parse(eachBoard);
    //console.log(eachBoardJSON)
    var eachBoardTitle = new Array()
    var eachBoardAreaNumbers = new Array()
    for (let i = 0; i < eachBoardJSON.length; i++) {
        //这里定义x轴显示的一些样式
        eachBoardTitle[i] = {
            value: eachBoardJSON[i].boardTitle,
            textStyle: {
                fontSize: 14,
                padding: [5, 5]
            }
        }
        eachBoardAreaNumbers[i] = eachBoardJSON[i].areaNumbers
    }
    //console.log(eachBoardJSON)
    var option3 = {
        title: {
            text: '每个模块中板块和分区',
            textStyle: {
                fontSize: 20
            },
            bottom: '0px',
            left: '30%'
        },
        grid: {
            x: 100,
            y: 80,
            x2: 100,
            y2: 100,
        },
        tooltip: {},
        legend: {
            top: '8%',
            right: '5%',
            data: ['分区']
        },
        xAxis: {
            name: '板块',
            data: eachBoardTitle
        },
        yAxis: {
            name: '分区数',
        },
        series: [{
            name: '贴子',
            type: 'bar',
            data: eachBoardAreaNumbers,
            barWidth: '10%',
            barGap: '30%',
            tooltip: [{
                padding: [30, 5]
            }]
        }
        ],
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart3.setOption(option3);
</script>
<%--每个板块中分区和贴子的关系柱形图--%>`
<script type="text/javascript">
    var myChart4 = echarts.init(document.getElementById('postAndAreaEachBoardChart'));
    // 指定图表的配置项和数据
    //获取每个模块的帖子数
    var eachArea = '${eachArea}'
    var eachAreaJSON = JSON.parse(eachArea);
    var eachAreaTitle = new Array()
    var eachAreaPostNumbers = new Array()
    console.log(eachAreaJSON)
    for (let i = 0; i < eachAreaJSON.length; i++) {
        //这里定义x轴显示的一些样式
        eachAreaTitle[i] = {
            value: eachAreaJSON[i].areaTitle,
            textStyle: {
                fontSize: 14,
                padding: [5, 5]
            }
        }
        eachAreaPostNumbers[i] = eachAreaJSON[i].postNumbers
    }
    var option4 = {
        title: {
            text: '每个板块中分区和贴子',
            textStyle: {
                fontSize: 18
            },
            bottom: '0px',
            left: '30%'
        },
        grid: {
            x: 100,
            y: 80,
            x2: 100,
            y2: 100,
        },
        legend: {
            top: '8%',
            right: '5%',
            data: ['贴子']
        },
        xAxis: {
            name: '分区',
            data: eachAreaTitle
        },
        yAxis: {
            name: '帖子数',
        },
        series: [{
            name: '贴子',
            type: 'bar',
            data: eachAreaPostNumbers,
            barWidth: '10%',
            barGap: '30%',
            tooltip: [{
                padding: [30, 5]
            }]
        }]
    };
    console.log(option4)
    // 使用刚指定的配置项和数据显示图表。
    myChart4.setOption(option4);
</script>
<%--贴子类型的饼图--%>
<script type="text/javascript">
    var myChart5 = echarts.init(document.getElementById('postTypePieChart'));
    // 指定图表的配置项和数据
    //获取每个模块的帖子数
    var postSortByEachPostType = '${postSortByEachPostType}'
    var postSortByEachPostTypeJSON = JSON.parse(postSortByEachPostType)
    //console.log(postSortByEachPostType)
    //console.log(postSortByEachPostTypeJSON)
    var data5 = new Array();
    //拼接data=[{value:'',name:''}]的形式
    for (let i = 0; i < postSortByEachPostTypeJSON.length; i++) {
        data5[i] = {
            value: postSortByEachPostTypeJSON[i].postCountSortByPostTypeName,
            name: postSortByEachPostTypeJSON[i].postTypeName
        }
    }
    //console.log(data5)
    var option5 = {
        title: {
            text: '贴子类型的占比',
            textStyle: {
                fontSize: 22
            }
        },
        grid: {
            x: 100,
            y: 100,
            x2: 100,
            y2: 50,
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        series: [{
            name: '贴子',
            type: 'pie',
            data: data5.sort(function (a, b) {
                return a.value - b.value;
            }),
            label: {
                fontSize: 18
            },
            barWidth: '10%',
            barGap: '30%',
            roseType: 'radius',
            tooltip: [{
                padding: [30, 5]
            }]
        }
        ],
        color: ['#d48265', '#91c7ae', '#749f83', '#ca8622', '#bda29a', '#6e7074', '#546570', '#c4ccd3', '#61a0a8']
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart5.setOption(option5);
</script>
<%--发帖时间和贴子数的折线图--%>
<script type="text/javascript">
    var myChart6 = echarts.init(document.getElementById('postNumbersEachHourLineChart'));
    // 指定图表的配置项和数据
    //获取每个模块的帖子数
    var postTimeSortByEachTime = '${postTimeSortByEachTime}'
    var postTimeSortByEachTimeJSON = JSON.parse(postTimeSortByEachTime);
    var postTime = new Array()
    var postNumbersEachHour = new Array()
    //console.log(postTimeSortByEachTimeJSON)
    for (let i = 0; i < postTimeSortByEachTimeJSON.length; i++) {
        //这里定义x轴显示的一些样式
        postTime[i] = {
            value: postTimeSortByEachTimeJSON[i].postTime,
            textStyle: {
                fontSize: 14,
                padding: [5, 5],
                textStyle: {
                    align: 'left'
                }
            }
        }
        postNumbersEachHour[i] = postTimeSortByEachTimeJSON[i].postCountSortByPostTime
    }
    //console.log(postTime)
    //console.log(postNumbersEachHour)
    var option6 = {
        title: {
            text: '发帖的集中时间',
            textStyle: {
                fontSize: 18
            },
            bottom: '0px',
            left: '40%'
        },
        grid: {
            x: 100,
            y: 80,
            x2: 100,
            y2: 100,
        },
        tooltip: {},
        legend: {
            top: '8%',
            right: '5%',
            data: ['贴子']
        },
        xAxis: {
            name: '小时',
            data: postTime,
            boundaryGap: false
        },
        yAxis: {
            name: '帖子数',
        },
        series: [{
            name: '贴子',
            type: 'line',
            data: postNumbersEachHour,
            barWidth: '10%',
            barGap: '30%',
            tooltip: [{
                padding: [30, 5]
            }]
        }
        ],
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart6.setOption(option6);
</script>
<script>
    $(function () {
        //监听select的变化，如果发生变化，就重新，ajax重新发送请求，将返回的结果重新渲染
        $("#eachPanel").on("change", function () {
            let panelId = $(this).val();
            $.ajax({
                url: '/admin/system/selectByPanelId?panelId=' + panelId,
                type: 'get',
                success: function (data) {
                    var eachBoardJSON = data;
                    //console.log(eachBoardJSON)
                    var myChart3 = echarts.init(document.getElementById('areaAndBoardEachPanelBarChart'));
                    // 指定图表的配置项和数据
                    //console.log(eachBoardJSON)
                    var eachBoardTitle = new Array()
                    var eachBoardAreaNumbers = new Array()
                    for (let i = 0; i < eachBoardJSON.length; i++) {
                        //这里定义x轴显示的一些样式
                        eachBoardTitle[i] = {
                            value: eachBoardJSON[i].boardTitle,
                            textStyle: {
                                fontSize: 14,
                                padding: [5, 5]
                            }
                        }
                        eachBoardAreaNumbers[i] = eachBoardJSON[i].areaNumbers
                    }
                    var option3 = {
                        title: {
                            text: '每个模块中板块和分区',
                            textStyle: {
                                fontSize: 20
                            },
                            bottom: '0px',
                            left: '30%'
                        },
                        grid: {
                            x: 100,
                            y: 80,
                            x2: 100,
                            y2: 100,
                        },
                        tooltip: {},
                        legend: {
                            top: '8%',
                            right: '5%',
                            data: ['分区']
                        },
                        xAxis: {
                            name: '板块',
                            data: eachBoardTitle
                        },
                        yAxis: {
                            name: '分区数',
                        },
                        series: [{
                            name: '贴子',
                            type: 'bar',
                            data: eachBoardAreaNumbers,
                            barWidth: '10%',
                            barGap: '30%',
                            tooltip: [{
                                padding: [30, 5]
                            }]
                        }
                        ],
                    };
                    // 使用刚指定的配置项和数据显示图表。
                    myChart3.setOption(option3);
                }
            })
        })
        $("#eachBoard").on("change", function () {
            let boardId = $(this).val();
            $.ajax({
                url: '/admin/system/selectByBoardId?boardId=' + boardId,
                type: 'get',
                success: function (data) {
                    var eachAreaJSON = data;
                    console.log(eachAreaJSON)
                    var myChart4 = echarts.init(document.getElementById('postAndAreaEachBoardChart'));
                    // 指定图表的配置项和数据
                    //获取每个模块的帖子数
                    var eachAreaTitle = new Array()
                    var eachAreaPostNumbers = new Array()
                    //console.log(eachAreaJSON)
                    for (let i = 0; i < eachAreaJSON.length; i++) {
                        //这里定义x轴显示的一些样式
                        eachAreaTitle[i] = {
                            value: eachAreaJSON[i].areaTitle,
                            textStyle: {
                                fontSize: 14,
                                padding: [5, 5]
                            }
                        }
                        eachAreaPostNumbers[i] = eachAreaJSON[i].postNumbers
                    }
                    console.log(eachAreaTitle)
                    var option4 = {
                        title: {
                            text: '每个板块中分区和贴子',
                            textStyle: {
                                fontSize: 18
                            },
                            bottom: '0px',
                            left: '30%'
                        },
                        grid: {
                            x: 100,
                            y: 80,
                            x2: 100,
                            y2: 100,
                        },
                        tooltip: {},
                        legend: {
                            top: '8%',
                            right: '5%',
                            data: ['贴子']
                        },
                        xAxis: {
                            name: '分区',
                            data: eachAreaTitle
                        },
                        yAxis: {
                            name: '帖子数',
                        },
                        series: [{
                            name: '贴子',
                            type: 'bar',
                            data: eachAreaPostNumbers,
                            barWidth: '10%',
                            barGap: '30%',
                            tooltip: [{
                                padding: [30, 5]
                            }]
                        }
                        ],
                    };
                    // 使用刚指定的配置项和数据显示图表。
                    myChart4.setOption(option4);
                }
            })
        })

    })
</script>
</html>