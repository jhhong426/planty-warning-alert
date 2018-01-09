<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />    

<%@include file="include/header.jsp"%>

<style type="text/css"> 
	 a:link { color: black; text-decoration: none;}
	 a:visited { color: black; text-decoration: none;}
	 a:hover { color: black; text-decoration: none;}
</style>

<div class="content-wrapper" style="min-height: 951.444px;">
	<div class="box" style="min-height:951.444px;">
		<h3><strong>&emsp;모니터링</strong></h3>
		
		<div class="box-body">
		
		<div class="box">
			<div class="box-header with-border">
				<div id="date-text" style="float:left; width:25%">
					<h4><strong>&emsp;통계 기간 : </strong>&emsp;${today}</h4>
				</div>
				<div id="button" style="float:left; width:75%">
					<a href = "/monitoringList"><button class="btn btn-primary"><strong>상세목록</strong></button></a>
				</div>
				<hr>
			</div>
			
           <div class="box-body">
                <div class="row">
                     <div class="col-md-6">
                        <div class="box box-primary">
                          <div class="box-body">
                                <div id="line-chart"></div>
                          </div>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <div class="box box-danger">
                          <div class="box-body">
                                <div id="bar-chart"></div>
                          </div>
                        </div>
                     </div>
                </div>
			
			
		   </div>
		</div>
		
		</div>
		
		
	</div>
</div>


<%@include file="include/footer.jsp"%>

<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="/resources/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>

<script>

function DateParsing(arg) {
	var splitArg = arg.split("-");
	var stringArg = splitArg[0] + splitArg[1] + splitArg[2];
	var intArg = parseInt(stringArg);
	return intArg;
};

var lineSeriesData = [];
<c:forEach items="${dailyStatValue}" var="item">
lineSeriesData.push(parseInt("${item}"));
</c:forEach>

var lineDate = [];
<c:forEach items="${dailyStatDate}" var="item">
lineDate.push("${item}");
</c:forEach>

Highcharts.chart('line-chart', {
    chart: {
        type: 'spline'
    },
    title: {
        text: '장애 발생 일간 통계'
    },
    xAxis: {
        categories: lineDate,
        title: {
            text: '날짜'
        }
    },
    yAxis: {
        title: {
            text: '장애 발생 총 건수 (건)'
        }
    },
    tooltip: {
        
    },

    plotOptions: {
        spline: {
            marker: {
                enabled: true
            }
        }
    },
    
    series: [{
        showInLegend:false,
        name: "발생 건수",
        data: lineSeriesData
    }]
});

// 막대 그래프
Highcharts.chart('bar-chart', {
	chart: {
        type: 'column'
    },
    title: {
        text: '주간 TOP 5'
    },
    subtitle: {
        text: '에러코드 발생 주간 TOP 5'
    },
    xAxis: {
        categories : ["메롱","메롱","메롱","메롱","메롱"]
    },
    yAxis: {
        title: {
            text: '발생 건수'
        }

    },
    legend: {
        enabled: false
    },
    plotOptions: {
        series: {
            borderWidth: 0,
            dataLabels: {
                enabled: true,
                format: '{point.y}'
            }
        }
    },

    tooltip: {
        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y}</b> 건<br/>'
    },

    series: [{
        name: '에러코드',
        colorByPoint: true,
        data: [1,2,3,4,5]
    }]
             
});

</script>

