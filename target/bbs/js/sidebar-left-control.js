/*
* 控制侧栏的js
* */
$(function () {
    $("#open").hide();
    $("#close").click(function () {
        $("#left-navbar").css("display", "none");
        $("#content").removeClass("col-md-10");
        $("#content").addClass("col-md-12");
        $("#open").show();
    })
    $("#open").click(function () {
        $("#left-navbar").css("display", "");
        $("#content").addClass("col-md-10");
        $("#open").hide();
    })
})