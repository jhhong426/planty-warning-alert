<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />    

<%@include file="include/header.jsp"%>

<div class="content-wrapper" style="min-height: 951.444px;">
	<div class="box" style="min-height:951.444px;">
		<h2><strong>&emsp;모니터링</strong></h2>
		
		<div class="box">
			<div class="box-header">
				<div id="date-text" style="float:left; width:20%">
					<h4><strong>통계 기간 : </strong>${today}</h4>
				</div>
				<div id="button" style="float:left; width:80%">
					<a href = "/monitoringList"><button style="height:40px"><strong>상세목록</strong></button></a>
				</div>
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

function DateParsing(arg) {
	var splitArg = arg.split("-");
	var stringArg = splitArg[0] + splitArg[1] + splitArg[2];
	var intArg = parseInt(stringArg);
	return intArg;
};


<c:forEach var="item" items="${day0}">
var nowY=DateParsing("${item.rgsde}")[0];
var nowM=DateParsing("${item.rgsde}")[1];
var nowD=DateParsing("${item.rgsde}")[2];
var nowCnt=${item.count};
</c:forEach>
<c:forEach var="item" items="${day1}">
var Y1=DateParsing("${item.rgsde}")[0];
var M1=DateParsing("${item.rgsde}")[1];
var D1=DateParsing("${item.rgsde}")[2];
var Cnt1=${item.count};
</c:forEach>
<c:forEach var="item" items="${day2}">
var Y2=DateParsing("${item.rgsde}")[0];
var M2=DateParsing("${item.rgsde}")[1];
var D2=DateParsing("${item.rgsde}")[2];
var Cnt2=${item.count};
</c:forEach>
<c:forEach var="item" items="${day3}">
var Y3=DateParsing("${item.rgsde}")[0];
var M3=DateParsing("${item.rgsde}")[1];
var D3=DateParsing("${item.rgsde}")[2];
var Cnt3=${item.count};
</c:forEach>
<c:forEach var="item" items="${day4}">
var Y4=DateParsing("${item.rgsde}")[0];
var M4=DateParsing("${item.rgsde}")[1];
var D4=DateParsing("${item.rgsde}")[2];
var Cnt4=${item.count};
</c:forEach>
<c:forEach var="item" items="${day5}">
var Y5=DateParsing("${item.rgsde}")[0];
var M5=DateParsing("${item.rgsde}")[1];
var D5=DateParsing("${item.rgsde}")[2];
var Cnt5=${item.count};
</c:forEach>
<c:forEach var="item" items="${day6}">
var Y6=DateParsing("${item.rgsde}")[0];
var M6=DateParsing("${item.rgsde}")[1];
var D6=DateParsing("${item.rgsde}")[2];
var Cnt6=${item.count};
</c:forEach>

Highcharts.chart('line-chart', {
    chart: {
        type: 'spline'
    },
    title: {
        text: '<strong>서버 장애 이력</strong>'
    },
    subtitle: {
        text: 'TOP 5'
    },
    xAxis: {
        type: 'datetime',
        dateTimeLabelFormats: {
            day: '%e',
    				month: '%m'
        },
        title: {
            text: 'Date'
        }
    },
    yAxis: {
        title: {
            text: '서버 발생 총 건수 (건)'
        },
        min: 0
    },
    tooltip: {
        headerFormat: '<b>{series.name}</b><br>',
        pointFormat: '{point.x:%m월%e일}: <br> {point.y:.2f} m <br>1<br>2<br>3'
    },

    plotOptions: {
        spline: {
            marker: {
                enabled: true
            }
        }
    },

    series: [{
        name: 'TOP 5',
        // [Date.UTC(년, 월(0~11), 일), 값]

        data: [
        	[Date.UTC(Y6,M6-1,D6), Cnt6],
			[Date.UTC(Y5,M5-1,D5), Cnt5],
			[Date.UTC(Y4,M4-1,D4), Cnt4],
			[Date.UTC(Y3,M3-1,D3), Cnt3],
			[Date.UTC(Y2,M2-1,D2), Cnt2],
			[Date.UTC(Y1,M1-1,D1), Cnt1],
			[Date.UTC(nowY,nowM,nowD), nowCnt]
        ]
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
        name: '에러코드',
        colorByPoint: true,
        data: [
        	<c:forEach var="item" items="${serverList}" varStatus="status">
	    	{
	        	name: '${item.eventCode}',
	            y: ${item.count},
	            //drilldown: '${item.eventCode}'
	    	}
	    	<c:if test="${!status.last}">, </c:if>
	    	</c:forEach>
	    	]
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

