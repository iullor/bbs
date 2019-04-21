/*
* 控制侧栏的js
* */
$(function () {
    //显示图片
    $(".showUserHeadImg").each(function () {
        var headImg = $(this).attr("value");
        let beginIndex = headImg.indexOf("/webapp/") + 7;
        let endIndex = headImg.length;
        let src = headImg.substring(beginIndex, endIndex);
        $(this).attr("src", src);
    })
    $(".right-nav>div:last-child").hide();

    //第一个点击的时候
    $(".right-nav>div:first-child").on("click", function () {
        window.location.href = "/person/basic/account"
    })

    //第二个点击的时候
    $(".right-nav>div:nth-child(2)").on("click", function () {
        window.location.href = "/person/collection/myPosts"
    })
    //第三个点击的时候发帖
    $(".right-nav>div:nth-child(3)").on("click", function () {
        window.location.href = "/post/input/0"
    })
    //第四个点击的时候查看消息
    $(".right-nav>div:nth-child(4)").on("click", function () {
        window.location.href = "/person/message/0"
    })
    /*$(".showPostFirstImage").each(function () {
        alert(1)
      /!*  var headImg = $(this).attr("value");
        let beginIndex = headImg.indexOf("/webapp/") + 7;
        let endIndex = headImg.length;
        let src = headImg.substring(beginIndex, endIndex);
        console.log(src)
        $(this).attr("src", src);*!/
    })*/
})