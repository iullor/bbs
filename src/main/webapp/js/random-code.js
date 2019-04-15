/*验证码*/
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
function validate1() {
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



