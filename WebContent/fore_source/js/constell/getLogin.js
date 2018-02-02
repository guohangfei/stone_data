function getLoginCk(k) {
    var c = document.cookie.split("; ");
    for (var i = 0; i < c.length; i++) {
        var p = c[i].split("=");
        if (k == p[0]) try {
            return decodeURIComponent(p[1])
        } catch(e) {
            return null
        }
    }
    return null
}
function getUcookie(k) {
    return getLoginCk(k)
}
function getUserInfo(){
	var x_us_id = getCookie('xzw_user_id'),
    x_us_name = getCookie('xzw_user_name');
    if (x_us_name) {
        var userinfo = '<img align=absbottom src="images/icon_nuser.gif"> <strong>' + x_us_name + '</strong> <a target="_blank" href="http://u.xzw.com/">\u6211\u7684\u4E3B\u9875</a><span class="gray">|</span><a target="_blank" href="http://u.xzw.com/index.php?app=public&mod=Profile">\u7A7A\u95F4</a><span class="gray">|</span><a target="_blank" href="http://u.xzw.com/index.php?app=public&mod=Account&act=index">\u8BBE\u7F6E</a><span class="gray">|</span><a target="_blank" href="http://u.xzw.com/index.php?app=public&mod=Invite&act=invite">\u9080\u8BF7\u597D\u53CB</a><span class="gray">|</span><a target="_blank" href="http://u.xzw.com/index.php?app=public&mod=Passport&act=logout">\u9000\u51FA</a><span class="gray">|</span><a target="_blank" href="http://www.xzw.com/calendars/">万年历</a><span class="gray">|</span><a target="_blank" href="http://www.xzw.com/cquery/">星座查询</a>'
    } else {
        var userinfo = '<a target="_blank" _href="http://u.xzw.com/index.php?app=public&mod=Register&act=index">\u7528\u6237\u6CE8\u518C</a><span class="gray">|</span><a target="_blank" _href="http://u.xzw.com/">\u767B\u5F55</a><span class="gray">|</span><a target="_blank" href="http://www.xzw.com/calendars/">万年历</a><span class="gray">|</span><a target="_blank" href="http://www.xzw.com/cquery/">星座查询</a>'
    }
    document.getElementById("userbar").innerHTML = userinfo
}
function setpTopusers() {
	var N=0;getUserInfo();
	var S=setInterval(function(){N++;getUserInfo();if(N>10) {clearInterval(S);setpTopusers()}},5000);
}
	//<img align=absbottom src="images/connect_qq.gif"><a target="_blank" href="javascript:void(0)" onclick="this.href=\'http://u.xzw.com/connect.php?mod=login&op=init&statfrom=login\'">\u7528QQ\u767B\u5F55</a><span class="gray">|</span><img align=absbottom src="images/connect_weibo.gif"><a target="_blank" href="javascript:void(0)" onclick="this.href=\'http://u.xzw.com/xwb.php?m=xwbAuth.login\'">用微博登录</a><span class="gray">|</span><a target="_blank" href="http://u.xzw.com/forum/">\u8BBA\u575B</a><span class="gray">|</span>

