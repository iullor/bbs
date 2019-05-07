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
    //第一个点击的时候
    $(".person-center").on("click", function () {
        window.location.href = "/person/basic/account"
    })

    //第二个点击的时候
    $(".person-collect").on("click", function () {
        window.location.href = "/person/collection/myPosts"
    })
  /*  //第三个点击的时候发帖
    $(".post-edit").on("click", function () {
        window.location.href = "/post/input/0"
    })*/
    //第四个点击的时候查看消息
    $(".person-message").on("click", function () {
        window.location.href = "/person/message/0"
    })

})