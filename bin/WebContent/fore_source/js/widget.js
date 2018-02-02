document.writeln("<div id=\"contactwidget\">");
document.writeln("  <ul>");
document.writeln("    <li id=\"wgqq\">");
document.writeln("      <a href=\"javascript:;\">QQ</a>");
document.writeln("      <div class=\"wgbox\">");
document.writeln("        <ul>");
document.writeln("          <li><a target=\"_blank\" href=\"http://wpa.qq.com/msgrd?v=3&uin=2732567275&site=qq&menu=yes\" rel=\"nofollow\" class=\"qqa\">QQ���߿ͷ�</a></li>");
document.writeln("          <li><a target=\"_blank\" href=\"http://shang.qq.com/wpa/qunwpa?idkey=ace5f97dea665034b4c9cf121aa00599578b28dfc9c017199a58661bc8933e34\" rel=\"nofollow\" class=\"qquna\">QQȺ</a></li>          ");
document.writeln("        </ul>");
document.writeln("      </div>");
document.writeln("      <div id=\"wgqqbotline\"></div>");
document.writeln("    </li>");
document.writeln("    <li id=\"wgwx\">");
document.writeln("      <a href=\"javascript:;\">΢��</a>");
document.writeln("      <div class=\"wgbox\"><img src=\"/static/images/qrcode200.jpg\" height=\"105\" alt=\"����΢��\" /></div>");
document.writeln("    </li>");
document.writeln("    <li id=\"wgtop\"><a href=\"javascript:;\">TOP</a></li>");
document.writeln("  </ul>");
document.writeln("</div>");

$(window).scroll(function(){
    if($(window).scrollTop()>100)
    {
        $("#wgtop").fadeIn(500);
    }
    else
    {
        $("#wgtop").fadeOut(500);
    }
});

$("#wgtop a").click(function(){
    $('body,html').animate({scrollTop:0},100);
    return false;
});

var isonwgbox = 0;
$("#wgqq>a, #wgwx>a").hover(function(){ 
    $('.wgbox').hide();    
    $(this).siblings('.wgbox').show();
}, function(){
    var _siblings = $(this).siblings('.wgbox');
    setTimeout(function(){      
        if(isonwgbox == 0) _siblings.hide();
    },500);
});

$(".wgbox").hover(function(){ 
    isonwgbox = 1;
}, function(){
    isonwgbox = 0;
    $(this).hide();
});