<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title> 石头数据API接口_数据接口平台</title>
<meta name="description" content="极速数据平台提供各类生活数据API，方便开发者快速简单的开发APP、软件及其他服务平台。公交、火车、违章、快递等数据应有尽有。">
<meta name="keywords" content="极速数据,API,数据接口">
<link rel="canonical" href="http://www.jisuapi.com/">
<link href="${basePath }/fore_source/css/mainv2.css" rel="stylesheet" type="text/css">
<script src="${basePath }/fore_source/js/hm.js"></script>
<script type="text/javascript" src="${basePath }/fore_source/js/jquery-2.0.3.min.js"></script>
<script type="${basePath }/fore_source/js/jquery.js"></script>
<link href="${basePath }/fore_source/css/jquery.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- 页眉 -->
	<%@ include  file="../include/top.jsp" %>
	
	<!--主体部分  -->
	<div class="wid" id="abbox">
  <div id="leftnav">
    <ul>      
      <li><a href="#" class="on" id="lnabout">关于我们</a></li>
      <li><a href="#contact" id="lnjob">联系我们</a></li>    
    </ul>
  </div>
  <div id="aboutbox">
    <h1>关于顽石 <span>ABOUT US</span></h1>
    <div id="aboutcontent" class="aboutcbox">
      <p id="aboutimg"><img src="${basePath }/fore_source/image/ws-office.png" style="position:relative;left: -40px;top: -30px;width:958px;height:180px;"/></p>
    <p>河北顽石教育科技有限公司，是一家集产品研发与企业内训为一体的高技术科技型公司，历经多年发展，开拓创新，不断调整企业管理机制丰富自主产品研发内容，建立极具竞争力的技术体系。为教育行业，企事业单位，政府部门客户提供一流的全面解决方案和全方位的技术支持。</p><br>
    <p>同时公司拥有一支规模庞大，优秀敬业的技术和管理团队，这支队伍不仅有一流的专业素质和丰富的研发经验、实施、咨询服务能力，且具有良好的职业修养和综合业务能力，正是有一支这样高素质的队伍，公司才能博击浪潮，屡创佳绩。</p><br>
	<p>服务客户真诚至上是我们的宗旨，以人为本,开拓创新是我们的理念，公司质量方针是客户为本,持续改进勇创高满意度应用软件服务，科技创新稳步发展，争做高新技术软件产业先锋。河北顽石教育科技有限公司，培养专业IT技术人才，为企业下游人才储备奠定了良好的基础，形成了人才培养——人才储备——人才内部消化——人才派遣——服务合作企业的良性产业链。</p>
    </div>
  </div>
  <div class="clearfix"></div>
</div>  

<script type="text/javascript">
$("#logininbox>a").hover(function(){ 
    $('#loginindown').show();
}, function(){    
    $('#loginindown').hide();
});

$("#loginindown").hover(function(){ 
    $(this).show();
    $("#logininbox>a").addClass('on');
}, function(){    
    $(this).hide();
    $("#logininbox>a").removeClass('on');
});
</script>

	<!-- 页脚 -->
	<%@ include  file="../include/foot.jsp" %>
</body>
</html>