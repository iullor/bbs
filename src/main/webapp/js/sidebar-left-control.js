/*
* 控制侧栏的js
* */
$(function () {
    //显示图片
    $(".showUserHeadImg").each(function () {
        let headImg = $(this).attr("value");
        let urlPath = $(this).attr("path");
        $(this).attr("src",urlPath+ headImg);
    })
    //第一个点击的时候
    $(".person-center").on("click", function () {
        window.location.href = "/bbs/person/basic/account"
    })

    //第二个点击的时候
    $(".person-collect").on("click", function () {
        window.location.href = "/bbs/person/collection/myPosts"
    })
  /*  //第三个点击的时候发帖
    $(".post-edit").on("click", function () {
        window.location.href = "/post/input/0"
    })*/
    //第四个点击的时候查看消息
    $(".person-message").on("click", function () {
        window.location.href = "/bbs/person/message/0"
    })

})