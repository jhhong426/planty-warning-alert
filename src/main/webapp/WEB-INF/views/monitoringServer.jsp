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

var DateParsing = function(arg) {
	var splitArg = arg.split("-");
	var stringArg = new Array();
	stringArg[0] = parseInt(splitArg[0]);
	stringArg[1] = parseInt(splitArg[1]);
	stringArg[2] = parseInt(splitArg[2]);

	return stringArg;
};

<c:forEach var="item" items="${errorList}">
var list = new Array();
list.push("${item.eventCode}");
list.push(${item.count});
</c:forEach>

<c:forEach var="item" items="${day0}">
var nowY=DateParsing("${item.logde}")[0];
var nowM=DateParsing("${item.logde}")[1];
var nowD=DateParsing("${item.logde}")[2];
var nowCnt=${item.count};
</c:forEach>
<c:forEach var="item" items="${day1}">
var Y1=DateParsing("${item.logde}")[0];
var M1=DateParsing("${item.logde}")[1];
var D1=DateParsing("${item.logde}")[2];
var Cnt1=${item.count};
</c:forEach>
<c:forEach var="item" items="${day2}">
var Y2=DateParsing("${item.logde}")[0];
var M2=DateParsing("${item.logde}")[1];
var D2=DateParsing("${item.logde}")[2];
var Cnt2=${item.count};
</c:forEach>
<c:forEach var="item" items="${day3}">
var Y3=DateParsing("${item.logde}")[0];
var M3=DateParsing("${item.logde}")[1];
var D3=DateParsing("${item.logde}")[2];
var Cnt3=${item.count};
</c:forEach>
<c:forEach var="item" items="${day4}">
var Y4=DateParsing("${item.logde}")[0];
var M4=DateParsing("${item.logde}")[1];
var D4=DateParsing("${item.logde}")[2];
var Cnt4=${item.count};
</c:forEach>
<c:forEach var="item" items="${day5}">
var Y5=DateParsing("${item.logde}")[0];
var M5=DateParsing("${item.logde}")[1];
var D5=DateParsing("${item.logde}")[2];
var Cnt5=${item.count};
</c:forEach>
<c:forEach var="item" items="${day6}">
var Y6=DateParsing("${item.logde}")[0];
var M6=DateParsing("${item.logde}")[1];
var D6=DateParsing("${item.logde}")[2];
var Cnt6=${item.count};
</c:forEach>

Highcharts.chart('line-chart', {
    chart: {
        type: 'spline'
    },
    title: {
        text: '<strong>장애 일간 통계</strong>'
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
        // Define the data points. All series have a dummy year
        // of 1970/71 in order to be compared on the same x axis. Note
        // that in JavaScript, months start at 0 for January, 1 for February etc.
        data: [
        	/*
        	<c:forEach items="i" varStatus="status" begin="0" end="6">
        		<c:forEach var="item" items="${day}${status.index}">
        			<c:out value=''>[Date.UTC(DateParsing("${item.logde}")[0], DateParsing("${item.logde}")[1], DateParsing("${item.logde}")[2]), 8],</c:out>
        		</c:forEach>
        	</c:forEach>
        	*/
        	
        	/*
        	<c:forEach var="item" items="${day6}">
				[Date.UTC(DateParsing("${item.logde}")[0], DateParsing("${item.logde}")[1], DateParsing("${item.logde}")[2]), "${item.count}"],
			</c:forEach>
			<c:forEach var="item" items="${day5}">
				[Date.UTC(DateParsing("${item.logde}")[0], DateParsing("${item.logde}")[1], DateParsing("${item.logde}")[2]), "${item.count}"],
			</c:forEach>
			<c:forEach var="item" items="${day4}">
				[Date.UTC(DateParsing("${item.logde}")[0], DateParsing("${item.logde}")[1], DateParsing("${item.logde}")[2]), "${item.count}"],
			</c:forEach>
			<c:forEach var="item" items="${day3}">
				[Date.UTC(DateParsing("${item.logde}")[0], DateParsing("${item.logde}")[1], DateParsing("${item.logde}")[2]), "${item.count}"],
			</c:forEach>
			<c:forEach var="item" items="${day2}">
				[Date.UTC(DateParsing("${item.logde}")[0], DateParsing("${item.logde}")[1], DateParsing("${item.logde}")[2]), "${item.count}"],
			</c:forEach>
			<c:forEach var="item" items="${day1}">
				[Date.UTC(DateParsing("${item.logde}")[0], DateParsing("${item.logde}")[1], DateParsing("${item.logde}")[2]), "${item.count}"],
			</c:forEach>
			<c:forEach var="item" items="${day0}">
				[Date.UTC(DateParsing("${item.logde}")[0], DateParsing("${item.logde}")[1], DateParsing("${item.logde}")[2]), "${item.count}"]
			</c:forEach>
			*/

			[Date.UTC(Y6,M6,D6), Cnt6],
			[Date.UTC(Y5,M5,D5), Cnt5],
			[Date.UTC(Y4,M4,D4), Cnt4],
			[Date.UTC(Y3,M3,D3), Cnt3],
			[Date.UTC(Y2,M2,D2), Cnt2],
			[Date.UTC(Y1,M1,D1), Cnt1],
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
        text: '장애 TOP 5'
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
        	<c:forEach var="item" items="${errorList}" varStatus="status">
        	{
	        	name: '${item.eventCode}',
	            y: ${item.count},
	            //drilldown: '${item.eventCode}'
        	}
        	<c:if test="${!status.last}">, </c:if>
        	</c:forEach>]
    }],/*
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

