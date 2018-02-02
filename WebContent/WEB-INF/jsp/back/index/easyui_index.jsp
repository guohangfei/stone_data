<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!-- 展示canvas -->
<div style="width: 300px;">
	<canvas id="myChart" style="width: 100px; height: 100px;"></canvas>
	<div style="position: relative; text-align: center; top: 30px">
		<span style="color: #232166; font-family: '微软雅黑'; font-size: 1000">各接口总收入情况</span>
	</div>
</div>


<!--引入 chartjs-->



<script type="text/javascript">
	var weather = ${cnt[0].cntMoney};
	var lun = ${cnt[1].cntMoney};
	var con = ${cnt[2].cntMoney};
	var lott= ${cnt[3].cntMoney};
	// 设置参数
	var data = {
		labels : [ "天气预报", "黄道吉日", "星座运势", "河北快三" ],
		datasets : [ {
			data : [ weather, lun, con, lott ],
			backgroundColor : [ "#FF6384", "#36A2EB", "#FFCE56", "#ccc" ],
			hoverBackgroundColor : [ "#FF6384", "#36A2EB", "#FFCE56", "#ccc" ]
		} ]
	};

	// Get the context of the canvas element we want to select
	var ctx = document.getElementById("myChart").getContext("2d");
	var myBarChart = new Chart(ctx, {
		type : 'pie',
		data : data,
	// options: options
	});
</script>