$("#vimg").on("click",function () {
    var timestamp = (new Date()).valueOf();
    $(this).attr("src","code.do?timestamp=" + timestamp);
});

$("#vimg2").on("click",function () {
    var timestamp = (new Date()).valueOf();
    $(this).attr("src","code2.do?timestamp=" + timestamp);
});