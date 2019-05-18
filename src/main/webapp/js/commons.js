/*判断字是不是多了*/
$(function () {
    $(".showShortInfo").hide();
    $(".showMoreInfo>a").on("click", function () {
        $(this).parent().siblings("div.showShortInfo").show();
        $(this).parent("div").hide();
        return false;
    })
    $(".showShortInfo>a").on("click", function () {
        $(this).parent().siblings("div.showMoreInfo").show();
        $(this).parent("div").hide();
        return false;
    })

})