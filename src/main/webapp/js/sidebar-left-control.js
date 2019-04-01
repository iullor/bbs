/*
* 控制侧栏的js
* */
$(function () {
    $("#open").hide();
    $("#close").click(function () {
        //$("#left-navbar").css("display", "none");
        $("#left-navbar").hide();
        $("#content").removeClass("col-md-10");
        $("#content").addClass("col-md-12");
        $("#open").show();
    })
    $("#open").click(function () {
        $("#left-navbar").css("display", "");
        $("#content").addClass("col-md-10");
        $("#open").hide();
    })


    //显示图片
    $(".showUserHeadImg").each(function () {
        var headImg = $(this).attr("value");
        let beginIndex = headImg.indexOf("/webapp/") + 7;
        let endIndex = headImg.length;
        let src = headImg.substring(beginIndex, endIndex);
        $(this).attr("src", src);
    })
})