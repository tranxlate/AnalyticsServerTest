<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link rel="stylesheet" type="text/css" href="/css/views/common.css">
<link rel="stylesheet" type="text/css" href="/css/views/register.css">
<link rel="stylesheet" type="text/css" href="/css/normalize-5.0.0.min.css">
<link rel="stylesheet" type="text/css" href="/css/font-awesome-4.7.0.css">
<link rel="stylesheet" type="text/css" href="/css/w3/w3.css">
<link rel="stylesheet" type="text/css" href="/css/highcharts/highcharts.css">
<script type="text/javascript" src="/js/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="/js/jqwidgets/jqxcore.js"></script>
<script type="text/javascript" src="/js/jqwidgets/jqxdata.js"></script>
<script type="text/javascript" src="/js/highcharts/highcharts.js"></script>
<script type="text/javascript">
function analytics() {
	var id = $("#id").val();
	if(id=='') {
		alert("Please checking ID.");
		return ;
	}
	var source = {
		url: "/an/chart1",
		data: {
			id: id
		},
		datatype: "json"
	};
	var dataAdapter = new $.jqx.dataAdapter(source, {
        loadComplete: function (data) {
        	var datas = dataAdapter.records;
        	var label = [];
        	var val = [];

        	for(var i=0;i<datas.length;i++) {
        		var data = datas[i];
        		label.push(data.recTm);
        		val.push(data.val);
        	}

        	Highcharts.chart('chart1', {
        	    title: {
        	        text: 'PV Chart'
        	    },
        	    subtitle: {
        	        text: null
        	    },
        	    yAxis: {
        	        title: {
        	            text: 'Number of PV'
        	        }
        	    },
        	    plotOptions: {
        	        series: {
        	            label: {
        	                connectorAllowed: false
        	            }
        	        }
        	    },
        	    xAxis: {
        	    	categories: label	
        	    },
        	    series: [{
        	    	name: 'PV',
        	        data: val
        	    }],
        	    responsive: {
        	        rules: [{
        	            condition: {
        	                maxWidth: 500
        	            },
        	            chartOptions: {
        	                legend: {
        	                    layout: 'horizontal',
        	                    align: 'center',
        	                    verticalAlign: 'bottom'
        	                }
        	            }
        	        }]
        	    }
        	});
        }
	});
	dataAdapter.dataBind();
	var source2 = {
			url: "/an/total",
			data: {
				id: id
			},
			datatype: "json"
	};
	var dataAdapter2 = new $.jqx.dataAdapter(source2, {
		loadComplete: function (data) {
			$(".total").html('Total PV : ' + data.val);
		}
	});
	dataAdapter2.dataBind();
	var source3 = {
			url: "/an/chart2",
			data: {
				id: id
			},
			datatype: "json"
		};
		var dataAdapter3 = new $.jqx.dataAdapter(source3, {
	        loadComplete: function (data) {
	        	var datas = dataAdapter3.records;
	        	var label = [];
	        	var val = [];

	        	for(var i=0;i<datas.length;i++) {
	        		var data = datas[i];
	        		label.push(data.path);
	        		val.push(data.val);
	        	}
	        	Highcharts.chart('chart2', {
	        	    chart: {
	        	        type: 'bar'
	        	    },
	        	    title: {
	        	        text: 'PV Top 10'
	        	    },
	        	    subtitle: {
	        	        text: null
	        	    },
	        	    xAxis: {
	        	        categories: label,
	        	        title: {
	        	            text: null
	        	        }
	        	    },
	        	    yAxis: {
	        	        min: 0,
	        	        title: {
	        	            text: 'PV',
	        	            align: 'high'
	        	        },
	        	        labels: {
	        	            overflow: 'justify'
	        	        }
	        	    },
	        	    tooltip: {
	        	        valueSuffix: ' views'
	        	    },
	        	    plotOptions: {
	        	        bar: {
	        	            dataLabels: {
	        	                enabled: true
	        	            }
	        	        }
	        	    },
	        	    legend: {
	        	        layout: 'vertical',
	        	        align: 'right',
	        	        verticalAlign: 'top',
	        	        x: -40,
	        	        y: 80,
	        	        floating: true,
	        	        borderWidth: 1,
	        	        backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
	        	        shadow: true
	        	    },
	        	    credits: {
	        	        enabled: false
	        	    },
	        	    series: [{
	        	        name: 'PV',
	        	        data: val
	        	    }]
	        	});
	        }
		});
		dataAdapter3.dataBind();
}
</script>
<title>Hello Analytics</title>
</head>
<body>
	<header>
		<jsp:include page="../menu/menu.jsp"></jsp:include>
	</header>
	<section>
		<article class="analytics">
			<form class="w3-container w3-card-4 w3-light-grey w3-text-blue w3-margin">
			<h2 class="w3-center">Analytics</h2>
			 
			<div class="w3-row w3-section">
				<div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
				<div class="w3-rest">
					<input class="w3-input w3-border" name="id" id="id" type="text" placeholder="Your ID">
				</div>
			</div>
			
			<button type="button" class="w3-button w3-block w3-section w3-blue w3-ripple w3-padding" onclick="analytics();">Search</button>
			
			</form>
		</article>
		<article>
			<h3 class="total w3-right"></h3>
		</article>
		<article class="chart">
			<div id="chart1"></div>
		</article>
		<article class="chart">
			<div id="chart2"></div>
		</article>
	</section>
	<footer></footer>
</body>
</html>