<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />    
<%@include file="include/header.jsp"%>

<div class="content-wrapper" style="min-height: 951.444px;">
	<div class="box" style="min-height:951.444px;">
		<h3><strong>&emsp;모니터링 > 상세목록 > 서버별 장애 통계</strong></h3>
		
		<div class="box">
			<div class="box-header">
				<h4><strong>통계 기간 : ${today}</strong></h4>
				<h4><strong>서      버 : ${serverInfo.serverNm}</strong></h4>
				<h4><strong>I    P : ${serverInfo.ip}</strong></h4>
			</div>
			
           <div class="box-body">
			
				<div id="line-chart" style="float:left; width:50%; min-width:310px; height: 400px; margin: 0 auto"></div>
				<div id="bar-chart" style="float:right; width:50%; min-width:310px; height: 400px; margin: 0 auto"></div>
			
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

// 오늘을 포함한 일주일의 날짜(String)와 그 날 한 서버에서 에러가 발생한 총 개수(Int)를 배열에 불러옴
var date = new Array();
var eventCount = new Array();

<c:forEach var="item" items="${date}" varStatus="status">
	date[${status.index}] = "${item.rgsde}";
	eventCount[${status.index}] = parseInt("${item.count}");
</c:forEach>

// 선형 그래프
(function (H) {
    H.wrap(H.Tooltip.prototype, 'refresh', function (proceed, point, e) {
        if (e.type !== 'mousemove') {
            proceed.call(this, point, e);
        }
    });
    H.addEvent(H.Point.prototype, 'click', function (e) {
        e.point.series.chart.tooltip.refresh(e.point, e);
    });
}(Highcharts));

$('#line-chart').highcharts( {
    chart: {
        type: 'spline',
        zoomType: 'x'  
    },
    title: {
        text: '<strong>장애 일간 통계</strong>'
    },
    xAxis: {
        categories : date,
        title: {
            text: '월/일'
        }
    },
    yAxis: {
        title: {
            text: '서버 발생 총 건수 (건)'
        },
        min: 0
    },
    tooltip: {
    	formatter : function() {
    		var str = '<b>' + 'TOP5'+ '</b>';

    		$.ajax({
                type: "POST",
                url: "/monitoringServer/topCode",
                async:false,
                data: { serverId : ${serverInfo.serverId}, rgsde : this.x },
                dataType: "json",
                success: function(data){
                	
                	str = '<b>' + 'TOP'+ data.result.length + '</b>';
                	
                	if (data.result.length == null || data.result.length == 0){
                		str = '에러 발생하지 않음';
                	}
                	else {
                		$(data.result).each(function(i){
                        	str += "<br>" + data.result[i].eventCode + " : " + data.result[i].count.toString();
                        }) 
                	}
                	
                },
                error:function(){
                    alert("불러오는 도중 에러가 발생하였습니다. 다시 시도해주세요.");
                    return;
                }
            });
    		str += "<br>총  " + this.y.toString() + "건";
    		return str;
    	}
    },

    series: [{
        name: 'TOP 5',
        data: eventCount
    }]
});

// 막대 그래프 (주석 부분은 DrillDown)
Highcharts.chart('bar-chart', {
	chart: {
        type: 'column'
    },
    title: {
        text: '<strong>장애 TOP 5</strong>'
    },
    xAxis: {
        type: 'category'
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
        name: '<b>에러코드</b>',
        colorByPoint: true,
        data: [
        	<c:forEach var="item" items="${errorList}" varStatus="status">
        	{
	        	name: '${item.eventCode}',
	            y: ${item.count},
	            //drilldown: '${item.eventCode}'
        	}
        	<c:if test="${!status.last}">, </c:if>
        	</c:forEach>]
    }]/*,
    drilldown: {
        series: [{
            name: 'ER001',
            id: 'ER001',
            data: [
                [
                    'v11.0',
                    24.13
                ],
                [
                    'v8.0',
                    17.2
                ],
                [
                    'v9.0',
                    8.11
                ],
                [
                    'v10.0',
                    5.33
                ],
                [
                    'v6.0',
                    1.06
                ],
                [
                    'v7.0',
                    0.5
                ]
            ]
        }, {
            name: 'ER002',
            id: 'ER002',
            data: [
                [
                    'v40.0',
                    5
                ],
                [
                    'v41.0',
                    4.32
                ],
                [
                    'v42.0',
                    3.68
                ],
                [
                    'v39.0',
                    2.96
                ],
                [
                    'v36.0',
                    2.53
                ],
                [
                    'v43.0',
                    1.45
                ],
                [
                    'v31.0',
                    1.24
                ],
                [
                    'v35.0',
                    0.85
                ],
                [
                    'v38.0',
                    0.6
                ],
                [
                    'v32.0',
                    0.55
                ],
                [
                    'v37.0',
                    0.38
                ],
                [
                    'v33.0',
                    0.19
                ],
                [
                    'v34.0',
                    0.14
                ],
                [
                    'v30.0',
                    0.14
                ]
            ]
        }, {
            name: 'ER003',
            id: 'ER003',
            data: [
                [
                    'v35',
                    2.76
                ],
                [
                    'v36',
                    2.32
                ],
                [
                    'v37',
                    2.31
                ],
                [
                    'v34',
                    1.27
                ],
                [
                    'v38',
                    1.02
                ],
                [
                    'v31',
                    0.33
                ],
                [
                    'v33',
                    0.22
                ],
                [
                    'v32',
                    0.15
                ]
            ]
        }, {
            name: 'ER004',
            id: 'ER004',
            data: [
                [
                    'v8.0',
                    2.56
                ],
                [
                    'v7.1',
                    0.77
                ],
                [
                    'v5.1',
                    0.42
                ],
                [
                    'v5.0',
                    0.3
                ],
                [
                    'v6.1',
                    0.29
                ],
                [
                    'v7.0',
                    0.26
                ],
                [
                    'v6.2',
                    0.17
                ]
            ]
        }, {
            name: 'ER005',
            id: 'ER005',
            data: [
                [
                    'v12.x',
                    0.34
                ],
                [
                    'v28',
                    0.24
                ],
                [
                    'v27',
                    0.17
                ],
                [
                    'v29',
                    0.16
                ]
            ]
        }]
    }*/
});

</script>

