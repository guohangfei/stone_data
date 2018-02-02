var _page='',com_astro=[['aries','白羊座','3.21-4.19','热情活力',2],['taurus','金牛座','4.20-5.20','稳健固执',3],['gemini','双子座','5.21-6.21','花心多变',4],['cancer','巨蟹座','6.22-7.22','敏感柔情',5],['leo','狮子座','7.23-8.22','骄傲威严',14],['virgo','处女座','8.23-9.22','完美理性',15],['libra','天秤座','9.23-10.23','公平和谐',16],['scorpio','天蝎座','10.24-11.22','神秘敏锐',17],['sagittarius','射手座','11.23-12.21','自由乐观',18],['capricorn','摩羯座','12.22-1.19','执著现实',19],['aquarius','水瓶座','1.20-2.18','自由博爱',20],['pisces','双鱼座','2.19-3.20','浪漫梦幻',21]];
function isDigit(eve){eve.value=eve.value.replace(/[^\d]/g,'')}
var today_id=getTodayId();
function tab_fortune(obj,obj1,id,obj2,type){var url="/fortune/ajax/"+myDates("YMD")+"/"+(type=="index"?"index/":"")+id+".html?v=3";if(obj2){$(obj1).removeClass("on");$(obj2).addClass("on")}$.ajax({type:"get",cache:true,url:url,timeout:10000,success:function(data){if(data.indexOf('座今日温馨提示'))$(obj).html(data)},error:function(){$(obj).html("请求超时")}})}function set_fortune(obj,id,type){if(!id)id=today_id[0];var url="/fortune/ajax/index/"+myDates("YMD")+"/"+id+"/"+(!type?0:type)+".html";$.ajax({type:"get",cache:true,url:url,timeout:10000,success:function(data){$(obj).html(data)},error:function(){$(obj).html("请求超时")}})}
function get_fortune(op) {var url = "/fortune/ajax/"+op.type+"/" + myDates("YMD") + "/" + op.id + "/" + (!op.sid ? 0 : op.sid) + ".html";if(op.dtype=='json') $.getJSON(url,op.data,function(d){op.success(d)});else $(op.obj).load(url);}
function myDates(patt){var d=new Date(),Minute=d.getMinutes(),Hour=d.getHours(),vh=0,vi=7;if(Hour<(vh)||(Minute<vi&&Hour==vh))d.setDate(d.getDate()-1);var year=d.getFullYear().toString(),month=d.getMonth()+1,day=d.getDate().toString(),tmp=patt;tmp=tmp.replace("Y",year);tmp=tmp.replace("y",(year.substr(2)));tmp=tmp.replace("M",(month<10?"0"+month:month));tmp=tmp.replace("m",month);tmp=tmp.replace("D",(day<10?"0"+day:day));tmp=tmp.replace("d",day);return tmp}function formFortune(f,t,l){var A=$(t).val(),B=$(l).val();$(f).attr("action","/fortune/"+A+"/"+B+".html");$(f).attr("method","get");return true}function formChaxun(id,f,a,b,c,d){var A=$(a,f).val(),E=['lnumber'],B=$(b,f).val(),C=$(c,f).val(),D=$(d,f).size()&&$(d,f).attr("checked")==true?$(d,f).val():'',sQ=7,q='';for(var i=0;i<E.length;i++){if(id==E[i]){q=A;break}}if(!q){if(isNaN(id))lt=id.length;else lt=id;if(lt==0)lt=1;var lQ=lt%sQ;if(lQ==0)lQ=1;if(A){lA=((A*(lQ))+lt);sA=lA.toString().length}else{lA='';sA=0}if(B){lB=((B*(lQ))+lt);sB=lB.toString().length}else{lB='';sB=0}if(C){lC=((C*(lQ))+lt);sC=lC.toString().length}else{lC='';sC=0}if(D){lD=((D*(lQ))+lt);sD=lD.toString().length}else{lD='';sD=0}var q=sA+''+sB+''+sC+''+sD+''+lA+''+lB+''+lC+''+lD}$(f).attr("action","/cx/"+id+"/"+q+".html");$(f).attr("method","get");return true}function eventFortune(obj){var A=$(obj),B="",C="";A.each(function(){$(this).hover(function(){_this=$(this);B=_this.html();$(this).attr("B",true);C=setInterval(function(){if(B==_this.html())_this.click();clearInterval(C)},500)},function(){B="";clearInterval(C)})})}function getTodayId(d){var D=[[9,19,'capricorn'],[10,18,'aquarius'],[11,20,'pisces'],[0,19,'aries'],[1,20,'taurus'],[2,21,'gemini'],[3,22,'cancer'],[4,22,'leo'],[5,22,'virgo'],[6,23,'libra'],[7,22,'scorpio'],[8,21,'sagittarius'],[9,19,'capricorn']];if(typeof(d)!='array'){var A=new Date();var d=[];d[0]=A.getMonth()+1;d[1]=A.getDate()}F=d[0]-(d[1]<=D[d[0]-1][1]?1:0);return[(F-3+12)%12,D[F][2]]}
function justify_block(box,tag){var A=$(box),T=0;A.each(function(){var _box=$(this),B=$(tag,_box);B.each(function(i){var _A=$(this).offset();if(_A.top!=T){T=_A.top;if(i){var _B=B.eq(i-1);_W=Math.floor((_box.width())-(_B.offset().left-_box.offset().left)-(_B.width()+_B.paddingLR()))+_box.paddingL();_WS=Math.floor(_W/2);$(tag+'.first:last',_box).css({width:$(tag+'.first:last',_box).width()+_WS});_B.css({width:_B.width()+_W-_WS}).addClass('last')}$(this).addClass('first')}})})}	

(function(g,h,i){var f,p=0,o="artDialog"+ +new Date,a=h.VBArray&&!h.XMLHttpRequest,c="createTouch"in document&&!("onmousemove"in document)||/(iPhone|iPad|iPod)/i.test(navigator.userAgent),d=!a&&!c,t=0;$.fn.floatBox=function(options){if(options&&options['top'])var top=options['top'];else var top=0;var f=$(this),p=f.attr('id'),u=p+'-tmp';f.before('<div id="'+u+'"></div>');floatBox=function(id,setting){if(!$('#'+u).length)return false;t=$('#'+u).position().top;var k=$(document).scrollTop();if(k>t){f.css({position:"fixed",top:top});d||f.css({position:"absolute",top:k+top})}else{f.css({position:""})}};$(window).scroll(function(){this.floatBox()})}})(this.jQuery,this);
function geturlcls(str){
	url=this.location.href;
	return url.indexOf(str)>1?true:false;
}
function setCookie(k, v, opt){var val = encodeURIComponent(v);if(!opt) opt = {duration:365};if(opt && opt.duration){var d = new Date();d.setTime(d.getTime() + opt.duration*24*3600*1000);val += ';expires=' + d.toGMTString();}document.cookie = k + '=' + val + '; path=/';}
function getCookie(k){var c = document.cookie.split("; "); for(var i=0; i<c.length; i++) { var p = c[i].split("="); if(k == p[0]) try{return decodeURIComponent(p[1]);}catch(e){return null;}}return null;}
function getDomainTips(){
	if(getCookie('ndomaintips')!='1') $('body').prepend('<div class="ndomaintips" style="font-size: 13px; width: 100%;height:30px;line-height:30px;background:#ffe9f2;border-bottom:solid 1px #ffb5d6; text-align: center;">为了方便广大星座爱好者访问，星座屋已启用简短域名<b><font color="#3399FF" size="4">xzw.com</font></b>，请朋友们记住新域名登录本站。&nbsp; <span style="color:#999">[<a href="javascript:void(0)" onclick="hideDomainTips()" style="color:#999">我记住了</a>]</span></div>');
}
function hideDomainTips(){
	$(".ndomaintips").hide();setCookie('ndomaintips',1,{duration:30})
}
function _attachEvent(obj, evt, func, eventobj) {return false}
var isIE6 = function() {return $.browser.msie && "6.0" == $.browser.version ? !0 : !1};
var isIE7 = function() {return $.browser.msie && "7.0" == $.browser.version ? !0 : !1};
if(isIE6()) $('html').addClass('ie6 ie');
else if(isIE7()) $('html').addClass('ie');
function showtodayico() {
	K=getTodayId();
	$('.todayastro').css({
		'left': K[0] * 82 + (K[0] == 11 ? 40 : 50)
	});
	$('.topnav li').css({'padding':'0 21px'}).eq(10).hide()
	$('.topnav li a').eq(6).html('星盘查询')
}
function search_baidu(obj) {
		$('#s-wd').attr('name','q');
		$(obj).append('<input type="hidden" name="s" value="16748015355598023686"><input type="hidden" name="entry" value="1">');
		if($('.hotword').size()) $('.hotword a').each(function(){
			$(this).attr({'href':$(this).attr('href').replace('/act/search?wd=','http://search.xingzuowu.com/cse/search?s=16748015355598023686&entry=1&q='),'target':'_blank'});
		});
		$(obj).submit(function(){
			if(!$(this).attr('bd_search')){
				$(obj).attr({'action':'http://search.xingzuowu.com/cse/search','bd_search':'1'});
			}
			if($('#s-wd').val()!=''&&$('#s-wd').val()!=sintText) return true;
			return false
		});
		return false
}
function bacck_search(obj){
	search_baidu(obj)
}
function submit_search(f){
	//if(f.wd.value!=''&&f.wd.value!=sintText) return true;
	//return false;
}
function show_pvBody(ck,pv,dv) {
	d=getCookie(ck);
	d=(!d?0:Math.ceil(d));
	CV=Math.floor(d/pv);
	document.writeln(dv[CV]);
	if(d>=(dv.length*pv)-1) d=-1;
	setCookie(ck,d+1);
}
function https() {
	return 'https:' != document.location.protocol ? false : true;
}
jQuery.fn.extend({
	paddingL:function(){return parseInt(this.css('paddingLeft'))},paddingR:function(){return parseInt(this.css('paddingRight'))},paddingT:function(){return parseInt(this.css('paddingTop'))},paddingB:function(){return parseInt(this.css('paddingBottom'))},marginL:function(){return parseInt(this.css('marginLeft'))},marginR:function(){return parseInt(this.css('marginRight'))},marginT:function(){return parseInt(this.css('marginTop'))},marginB:function(){return parseInt(this.css('marginBottom'))},borderL:function(){return parseInt(this.css('borderLeftWidth'))},borderR:function(){return parseInt(this.css('borderRgihtWidth'))},borderT:function(){return parseInt(this.css('borderTopWidth'))},borderB:function(){return parseInt(this.css('borderBottomWidth'))},marginLR:function(){return this.marginL()+this.marginR()},marginTB:function(){return this.marginT()+this.marginB()},paddingLR:function(){return this.paddingL()+this.paddingR()},paddingTB:function(){return this.paddingT()+this.paddingB()},borderLR:function(){return this.borderL()+this.borderR()},borderTB:function(){return this.borderT()+this.borderB()},outerWidth:function(){return this.width()+this.marginLR()+this.paddingLR()+this.borderLR()},outerHeight:function(){return this.height()+this.marginTB()+this.paddingTB()+this.borderTB()}
});
function browserRedirect(){
	var wl=['/divine','update.xingzuowu.com'];
	var url='',ckn='go_ms';
	var sUserAgent=navigator.userAgent.toLowerCase();var bIsIpad=sUserAgent.match(/ipad/i)=="ipad";var bIsIphoneOs=sUserAgent.match(/iphone os/i)=="iphone os";var bIsMidp=sUserAgent.match(/midp/i)=="midp";var bIsUc7=sUserAgent.match(/rv:1.2.3.4/i)=="rv:1.2.3.4";var bIsUc=sUserAgent.match(/ucweb/i)=="ucweb";var bIsAndroid=sUserAgent.match(/android/i)=="android";var bIsCE=sUserAgent.match(/windows ce/i)=="windows ce";var bIsWM=sUserAgent.match(/windows mobile/i)=="windows mobile";
	if(bIsIphoneOs||bIsMidp||bIsUc7||bIsUc||bIsAndroid||bIsCE||bIsWM){
		url=location.href;url=url.toLowerCase();for(i=0;i<wl.length;i++){if(location.href.indexOf(wl[i])>-1)return};
		surl=url;surl=surl.replace('//www.xzw.com/','//m.xzw.com/');
		surl=surl.replace('//www.xingzuowu.com/','//m.xzw.com/');
		surl=surl.replace('//xingzuowu.com/','//m.xzw.com/');
		surl=surl.replace('//xzw.com/','//m.xzw.com/');
		if(document.referrer.indexOf('.baidu.com')>-1){
			if(!document.location.protocol) surl=surl.replace('http://','https://');
			surl += (surl.indexOf('?')>0?'&':'?')+'appid=bds';
		}
		if(surl) location=surl
	}
}
if(getCookie('u_reductions')!=1) browserRedirect();
jQuery.fn.extend({returntop:function(){if(this[0]){var b=this,S=false,H=false,e=$(window).height(),_show=function(){if(H)return false;H=true;b.stop();b.fadeIn().animate({'bottom':'200'},'1000','swing',function(){H=false})},_hide=function(){H=false;b.stop();b.animate({'bottom':e},'500','swing',function(){b.css('bottom',-260).hide();$(".sBtn",b).hide();$('.b_icon div',b).hide()})},setpBtn=function(){var d=$(document).scrollTop();if(S)return;d>10?_show():_hide()};$('.b_top',b).click(function(){S=true;$("html, body").animate({scrollTop:0},500,'swing',function(){S=false});_hide();return false});var c=null;$(window).bind("scroll",function(){setpBtn()})}}});
$(function() {
	$('.t_nav li').eq(9).hide();$('.t_nav li a').eq(5).html('星盘查询')

	$('.search form,#searchBar form').attr('action','/act/search');
	if ($('.astronav').size() && !$('.todayastro').size()) {
		$('.astronav').append('<li class="todayastro"></li>');
		showtodayico()
	}
	if (!$('#scroll_tops').size()) {
		$('body').append('<div id="scroll_tops"></div>');
	}
	var A=$('#scroll_tops'),K=getTodayId();
	A.append('<div class="sBtn"></div><div class="b_icon"><span></span><div></div></div><div class="ic_b b_wx"></div><div class="ic_b b_top"></div>');
	var sB=[[110,30,41,40,'运势','/fortune/'+K[1]+'/'],[110,-10,53,-51,'性格','/cx/1/'+	(K[0]+2>10?2:1)+'000'+(K[0]+2)+'.html'],[70,30,58,-38,'文章','/astro/'+K[1]+'/'],[70,-10,108,-67,'圈子','']];
	for(i=0;i<sB.length;i++){
			$('.sBtn',A).append('<em class="l'+(i+1)+'">'+sB[i][4]+'</em>');
	}
	var init_SB = function(){
		for(i=0;i<sB.length;i++){
			var SBn=$('em',A).eq(i);
			SBn.attr('_i',i).css({top:sB[i][0],left:sB[i][1]}).click(function(){
				var SBv=sB[$(this).attr('_i')];
				if(SBv[5]) top.location.href=SBv[5];
			});
		}
	};
	init_SB();
	A.returntop();
	var sS=false,sBN=A.find('em'),Tr;
	var show_sbtn=function(i){
		if(!sS) sBN.eq(i).animate({top:sB[i][2],left:sB[i][3]},'fast');
		else sBN.eq(i).animate({top:sB[i][0],left:sB[i][1]},'fast');
	};
	$('.b_icon span,.b_icon div',A).css('backgroundPosition','center '+(-K[0]*90)+'px');
	$('.b_icon',A).click(function(){
		if($('.sBtn').css('display')=='none'){sS=false;$('.sBtn').show();init_SB();}
		var I=0;
		show_sbtn(I)
		Tr=setInterval(function(){
			I++;
			if(I>=sBN.size()) {if(!sS) sS=true; else sS=false;clearInterval(Tr);return}
			else show_sbtn(I)
		},50)	
		if(!sS) $('div',this).fadeIn(400); else $('div',this).fadeOut();
	});
	var N=["aries","taurus","gemini","cancer","leo","virgo","libra","scorpio","sagittarius","capricorn","aquarius","pisces"];
	$('.b_wx',A).hover(function(){
		if(!$('.wx_qcode').size()) $('body').append('<div class="wx_qcode"><h4>\u626B\u4E8C\u7EF4\u7801<br>\u5173\u6CE8\u661F\u5EA7\u5C4B\u5B98\u65B9\u5FAE\u4FE1\u53F7</h4><img src="images/qrcode_big.gif"></div>');
		$('.wx_qcode').show();
	},function(){$('.wx_qcode').hide()});
	//getDomainTips();
	$('.copyright,#footer',$('body').not('.articleview')).append('<div class="mT10 f_tips">本站内容仅供娱乐</div>');
});
function showTopLink() {
}
function setpArc(){var vnav=false,A=$('.s-nav,.sonnav'),C=$('.c-nav'),L=$('li',C),U,O,S=0;var repos=function(){C.animate({left:$('#wraper').offset().left-C.width()-10})},hide_nav=function(v){O.animate({height:v},200,function(){if(v==0)$('.sm',C).hide();else re_size()})},get_size=function(){var PT=$('.place').offset().top,WH=$(window).height(),LH=L.height();return{T:PT,H:WH,L:LH}},re_size=function(){var P=get_size();if(U.height()+P.T>P.H){var VM=(P.H-P.T-P.L)/P.L;VM=Math.round(VM)-1;S=VM*P.L;O.animate({height:S});if(!$('.sm',C).size()){O.after('<span class="sm"></span>');$('.sm',C).click(function(){var OT=parseInt(U.css('marginTop'));if(OT==0)V=U.height()-O.height();else V=0;U.animate({marginTop:-V})})}$('.sm',C).show()}else{O.height('');$('.sm',C).hide()}},stp_nav=function(){if(A.html()=='')return false;C.html('<div class="sm-inner"><ul>'+A.html().replace(/·/g,'')+'</ul></div>');U=$('ul',C);O=$('div',C);var P=$('.place a').eq(1);U.prepend('<li><a class="l2" href="/">首页</a></li><li><a class="l2" href="'+P.attr('href')+'">'+P.text()+'</a></li>');S=U.height();C.append('<span _s=1></span>');repos();if(!isIE6())C.css({top:1000}).animate({top:$('.place').offset().top},500);L=$('li',C);$('span',C).hover(function(){$(this).addClass('on')},function(){$(this).removeClass('on')});$('span',C).not('.sm').addClass('up').click(function(){var _S=$(this).attr('_s');hide_nav(_S==1?0:S);$(this).attr('_s',_S==1?0:1);if(_S==0)$(this).addClass('up');else $(this).removeClass('up');$(this).removeClass('on')});re_size()};if(C.size()){stp_nav()}else $(document).ready(function(){$('body').append('<div class="c-nav"></div>');C=$('.c-nav');stp_nav()});$(window).resize(function(){repos();re_size()});$(document).ready(function(){repos();re_size()});if(isIE6()){var _M=$('#menu').html();$('#menu').remove();$('body').append('<div id="menu">'+_M+'</div>')}}
if($('head').attr('_v')!='index') document.writeln('<script type="text/javascript" src="'+(https()?'https':'http')+'://cbjs.baidu.com/js/m.js"><\/script>');

