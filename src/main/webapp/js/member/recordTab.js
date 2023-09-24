$(document).ready(function () {
  $("ul.recordTabs li").on("click", function () {
    let tab_id = $(this).attr("data-tab");

    $("ul.recordTabs li").removeClass("current");
    $(".recordTab-content").removeClass("current");

    $(this).addClass("current");
    $("#" + tab_id).addClass("current");
  });
});
