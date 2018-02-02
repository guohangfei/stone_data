/*ÐÇ×ùÎÝ_ËÑË÷ÍÆ¼ö*/
//var cpro_id = "u2121140";
//document.writeln('<script src=" http://su.bdimg.com/static/dspui/js/uf.js" type="text/javascript"></script>')
var qj_count=0;
(function(){
	var A=$('script');
	A.each(function(){
		if($(this).attr('src')=='https://w.cnzz.com/c.php?id=30047636&l=3') {qj_count=1;return}
	})
})()
if(!qj_count) document.writeln('<script src="https://w.cnzz.com/c.php?id=30047636&l=3" language="JavaScript"></script>');
document.writeln("<script src=\"https:\/\/s21.cnzz.com\/stat.php?id=3473983&web_id=3473983\" language=\"JavaScript\"><\/script>");
//document.writeln('<script language="javascript" type="text/javascript" src="http://js.users.51.la/15175934.js"></script>');
var _hmt = _hmt || [];
function wbdcount(id){
	(function() {
		var codes={0:'5d89b326f3cee5297d41ff8533cd5b7b',
			3706:'ba56aa1594e74f73654af934cbb89bdc',
			3955:'810e9c2d139e6edd565966732458d488',
			5296:'cc815b180b36773c8bd38312fcca62e1',
			5301:'40661d5948d9adeeb1edc2080adfabf3',
			5319:'ae4993f11db0139796bff7bf4d1aec03',
			5320:'976cb93358c31bbc9048fd192bbaa33e',
			5321:'02951598298f713e8abf7a5cf2725521',
			5324:'227fc4ecbb916478f78a6e070d4fdb89'
		};
		var _cs=codes[id];
		if(!_cs) return;
		var hm = document.createElement("script");
		hm.src = "https://hm.baidu.com/hm.js?"+_cs;
		var s = document.getElementsByTagName("script")[0];
		s.parentNode.insertBefore(hm, s);
	})();
}
if(typeof(_csw)!="undefined") {
	wbdcount(0);
	var ntime = Date.parse(new Date())/1000,nd=30;
	if(ntime-_csw['b']<86400*nd) {wbdcount(_csw['a']);}
}