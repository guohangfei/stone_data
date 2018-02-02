<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人中心</title>
<link href="${basePath }/fore_source/css/user/main.css" rel="stylesheet"
	type="text/css" />
<link href="${basePath }/fore_source/css/user/my.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="${basePath }/fore_source/js/jquery-2.0.3.min.js"></script>
</head>
<body>
	<%@ include file="../include/user/top.jsp"%>
	<div class="wid">
		<%@ include file="../include/user/left.jsp"%>
		<div id="rcontentbox">
			<h2>
				<img src="${basePath }${img_url }" height="30"/>
				${api_name }
			</h2>
			<div class="rcontent">
				<h5 class="buytitle">选择您要购买的套餐</h5>
				<form method="post" action="${basePath }/fore/user/do_buy.do" id="buyForm">
					<div id="buypackage">
						<div class="bpitem clearfix" id="bptitle">
							<div class="bpselect">&nbsp;</div>
							<div class="bpname">名称</div>
							<div class="bpapinum">次数</div>
							<div class="bpprice">单价(元)</div>
							<div class="bpnum">数量</div>
							<div class="bptota">小计(元)</div>
						</div>
						
						<c:forEach items="${set_meal }" var="meal" varStatus="i">
							
							<div class="bpitem clearfix on text" >
								<div class="bpselect">
									<label class=""> 
									<input type="radio" name="meal_id" class="checkbox" <c:if test="${i.index==0}">checked="checked"</c:if> value="${meal.noid }" /> <span></span>
									</label> 
								</div>
								
								<div class="bpname">${meal.name }</div>
								<div class="bpapinum">
									<span class="darkgreen">${meal.number}</span>次
								</div>
								<div class="bpprice">${meal.price}</div>
								<div class="bpnum">
									<span class="minus">-</span>
									<input type="text" name="numb" value="0" class="roundinput" />
									<span class="plus">+</span>
								</div>
								<div class="bptotal">0.00</div>
								<input hidden="hidden" class="apply_money" name="apply_money">
								<input hidden="hidden" name="api_id" value="${meal.api_id}">
							</div>
						
						</c:forEach>     
					
					</div>
					<div id="buytotal" class="clearfix">
						<div id="btleft">
							<label class="checkbox-group" style="display: none;"> <input
								type="checkbox" name="usebalance" id="usebalance" value="1"
								checked="checked" /> <span>平台余额<span  id="balance">0.00</span>元
							</span>
							</label>
						</div>
						
						<div id="btright">
							已选择<span id="totalnum">1</span>个套餐 应付：<span id="totalfee">00</span>元
								<input hidden="hidden" id="total" name="totalfee" >
							<input type="submit" name="submitt" id="submitt" value="提交订单" />
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	var chk;
$(document).ready(function(){
	
    $(".bpitem").each(function(){
        if($(this).index() == 0) return true;
        if($(this).find(".bpid").prop("checked") == true) $(this).addClass('on');
        else $(this).removeClass('on');
        var num = parseInt($(this).find("input[name='numb']").val());
        var price = $(this).find('.bpprice').html();    
        var total = parseInt(num) * parseFloat(price);
        total = total.toFixed(2);
        $(this).find('.totalfee').html(total);
    });
    
    $(".checkbox").change(function(){
    	$(this).attr("checked","checked");
    	var radioSize = $(".checkbox");
    	var chkVal = $(this).val();
    	for(var j = 0;j<radioSize.length;j++){
    		if(radioSize[j].value==chkVal){
    			continue;
    		}
    		$($(".checkbox")[j]).removeAttr("checked");
    	}
    	$(".roundinput").val("0");
    	$(".bptotal").text("0.00");
    	$("#totalfee").text("00");
    });
    
    $("#buyForm").submit(function(){
    	var totalPrice = $("#totalfee").text();
    	$("#total").val(totalPrice);
    	if(totalPrice==0){
    		alert("请选择购买的数量!");
    		return false;
    	}
    });
});

$("#buypackage .minus").on('click', function(){
	chk = $(this).parent().siblings('.bpselect').find("input").attr("checked");
	if(chk!="checked"){
		return;
	}
   if($(this).next().val()==0){
	   return;
   }
    var sibnum = $(this).siblings("input[name='numb']");
    var parent = $(this).parent();
    var num = parseInt(sibnum.val())-1;
    if(num<0) num = 0;
    sibnum.val(num);    
    var price = parent.siblings('.bpprice').html();    
    total = parseInt(num) * parseFloat(price);
    total = total.toFixed(2);
    parent.siblings('.bptotal').html(total);
    parent.siblings('.apply_money').val(total);
    $("#totalfee").text(parseFloat(total));
    return false;
})
$("#buypackage .plus").on('click', function(){
	chk = $(this).parent().siblings('.bpselect').find("input").attr("checked");
	if(chk!="checked"){
		return;
	}
    var sibnum = $(this).siblings("input[name='numb']");
    var parent = $(this).parent();
    
   

    var maxnum = parseInt(parent.siblings('.bpselect').find("input[name='maxnumb']").val());
    var num = parseInt(sibnum.val())+1;
    if(maxnum>0 && num>maxnum)
    {
        alert('最多只能买'+maxnum+'件！');
        return false;
    }
    sibnum.val(num);
    var price = parent.siblings('.bpprice').html();
    total = parseInt(num) * parseFloat(price);
    total = total.toFixed(2);
    parent.siblings('.bptotal').html(total);
    parent.siblings('.apply_money').val(total);
    $("#totalfee").text(parseFloat(total));
    return false;
})


$("#jsbbox .minus").on('click', function(){
    if($(this).hasClass('gray')) return false;
    var jsbnum = $(this).siblings("input[name='jsbnum']");
    var num = parseInt(jsbnum.val())-1;
    if(num<0) num = 0;
    jsbnum.val(num); 
    $("#jdisprice i").html(num/100);
    return false;
})


</script>
</body>
</html>