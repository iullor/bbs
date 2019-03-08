<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>重置密码</title>
    <link rel="stylesheet" href="../../lib/bootstrap/bootstrap.min.css">
    <script src="../../lib/jQuery/jquery-2.1.4.min.js"></script>
    <script src="../../lib/bootstrap/bootstrap.min.js"></script>
    <!--重置密码的样式-->
    <style>
        body {
            background-color: #f5f5f5;
        }
        .row:first-child{
            margin-top: 8%;
        }
        .row .col-md-3 {
            margin-top: 10%;
        }

        .form-group > .col-md-7 > label {
            margin-top: 10%;
            margin-left: -7%;
        }

        .form-group > .col-md-7 > input {
            margin-left: -7%;
        }

        .form-group:last-child {
            margin-top: 40px;
            padding-left: 30px;
        }

        .form-group:last-child > button {
            margin-left: 20px;

        }
        .info{
            margin-top: 8%;
            color: #ddd;
            padding: 1px;
        }
        #codeImg {
            width: auto;
            margin-top: 25px;
            margin-left: -20px;
            font-family: Arial, 宋体;
            font-style: italic;
            font-size: 16px;
            color: green;
            border: 0;
            padding: 2px 3px;
            letter-spacing: 3px;
            font-weight: bolder;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-offset-2 col-md-2">
            <h3 class="text-warning">重置密码</h3>
        </div>
        <div class="col-md-3">
            <form action="" method="post">
                <div class="form-group">
                    <label for="myUsername">用户名</label>
                    <input type="text" class="form-control" id="myUsername">
                </div>
                <div class="form-group">
                    <label for="myEmail">预留邮箱</label>
                    <input type="email" name="email" id="myEmail" class="form-control">
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-7">
                            <label for="inputCode">验证码</label>
                            <input type="text" class="form-control" id="inputCode">
                        </div>
                        <div class="col-md-5">
                            <input type="button" id="codeImg" onclick="createCode()" style="width:60px"
                                   title='点击更换验证码'/>
                            <span><a href="#" onclick="createCode()">换一张</a></span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-info">重置</button>
                    <button type="reset" class="btn btn-info"> 取消</button>
                </div>
            </form>
        </div>
    </div>

    <div class="info text-center">
        <h4><small>我们将根据您的账号和预留的邮箱，为您重置密码，并将正确的密码发到您的邮箱，真注意查看！</small></h4>
    </div>
</div>
<script>
    var code; //在全局定义验证码
    function createCode() {
        code = "";
        var codeLength = 4;//验证码的长度
        var checkCode = document.getElementById("codeImg");
        var random = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
            'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');//随机数
        for (var i = 0; i < codeLength; i++) {//循环操作
            var index = Math.floor(Math.random() * 36);//取得随机数的索引（0~35）
            code += random[index];//根据索引取得随机数加到code上
        }
        checkCode.value = code;//把code值赋给验证码
    }

    //校验验证码
    function validate() {
        var inputCode = document.getElementById("inputCode").value.toUpperCase(); //取得输入的验证码并转化为大写

        if (inputCode.length <= 0) {
            alert("请输入验证码！");
            return false;
        } else if (inputCode != code) {
            alert("验证码输入错误，重新输入");
            createCode();//刷新验证码
            document.getElementById("inputCode").value = "";//清空文本框
            return false;
        } else { //输入正确时
            alert("正在重置。。。。");
            return true;
        }
    }

    $(function () {
        createCode();
        $("button[type='submit']").on("click", function () {
            validate();
        });
    });
</script>


<!--<script>

    var checkOperator;  //式子
    var checkCode;
    var result;

    /*
    * 生成随机数
    * */
    function createRandomNumber() {
        var num = Math.round(Math.random() * 10);
        return num;
    }


    /**
     * 生成运算符
     * @returns {number}
     */
    function createRandomOperation() {
        var num = Math.round(Math.random() * 3);
        switch (num) {
            case num = 0:
                return "+";
            case num = 1:
                return "-";
            default:
                return "*";
        }
    }

    /**
     * 生成验证码，的计算式子
     */
    function createCheckCode() {

        var operator = new Array(2);
        var numbers = new Array(3);

        for (var i = 0; i < numbers.length; i++) {
            numbers[i] = createRandomNumber();
        }

        for (var i = 0; i < operator.length; i++) {
            operator[i] = createRandomOperation();
        }
        var result = calculate(numbers, operator);
        return result;
    }


    /**
     * 计算
     */
    function calculate(numbers, operator) {
        /*  var result;*/
        /*判断*/
        if (operator[0] === "+") {
            switch (operator[1]) {
                case "+":
                    checkOperator = numbers[0] + "+" + numbers[1] + "+" + numbers[2]
                    return numbers[0] + numbers[1] + numbers[2];
                case "-":
                    checkOperator = numbers[0] + "+" + numbers[1] + "-" + numbers[2]
                    return numbers[0] + numbers[1] - numbers[2];
                case "*":
                    checkOperator = numbers[0] + "+" + numbers[1] + "*" + numbers[2]
                    return numbers[0] + numbers[1] * numbers[2];
            }
        }
        if (operator[0] === "-") {
            switch (operator[1]) {
                case "+":
                    checkOperator = numbers[0] + "-" + numbers[1] + "+" + numbers[2]
                    return numbers[0] - numbers[1] + numbers[2];
                case "-":
                    checkOperator = numbers[0] + "-" + numbers[1] + "-" + numbers[2]
                    return numbers[0] - numbers[1] - numbers[2];
                case "*":
                    checkOperator = numbers[0] + "-" + numbers[1] + "*" + numbers[2]
                    return numbers[0] - numbers[1] * numbers[2];
            }
        }
        if (operator[0] === "*") {
            switch (operator[1]) {
                case "+":
                    checkOperator = numbers[0] + "*" + numbers[1] + "+" + numbers[2]
                    return numbers[0] * numbers[1] + numbers[2];
                case "-":
                    checkOperator = numbers[0] + "*" + numbers[1] + "-" + numbers[2]
                    return numbers[0] * numbers[1] - numbers[2];
                case "*":
                    checkOperator = numbers[0] + "*" + numbers[1] + "*" + numbers[2]
                    return numbers[0] * numbers[1] * numbers[2];
            }
        }

    }

    function f1() {
        var result = createCheckCode();
        $("#checkCode").val('');
        $("#checkOperator").jsp(checkOperator + '=');
        //alert(checkOperator + '=' + result)
        return result;
    }


    /*
    * 判断
    *
    * */
    function f2(checkCode, result) {
        $("button[type='submit']").click(function () {
            if (checkCode != null && checkCode != '' && checkCode !== 'undefined') {
                if (result != checkCode) {
                    alert("验证码输入错误，重新输入");
                    result = f1();
                    return false;
                }
                alert("重置密码中。。。。")
            } else {
                alert("请输入验证码")
                return false;
            }
        })
    }

    //调用
    function f3() {
        result = f1();
        f2(checkCode, result);
    }

    $(function () {
        $("#checkCode").on("change", function () {
            checkCode = $("#checkCode").val()
            alert(checkCode)
        })
        /*alert("式子：" + checkOperator + "=" + re)*/
        f3();

    })

</script>-->


</body>
</html>