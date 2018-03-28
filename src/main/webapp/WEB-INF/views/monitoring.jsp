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

<div class="content-wrapper"  style="width:auto; height:100%; padding:0px;">
	<div class="box"  style="width:auto; height:100%; padding:0px;">
		<h3><strong>&emsp;모니터링</strong></h3>
		
		<div class="box">
			<div class="box-header with-border">
				<div id="date-text" style="float:left; width:65%">
					<h4><strong>&emsp;통계 기간 : </strong>&emsp;${today}</h4>
				</div>
				<div id="button" style="float:right; width:35%">
					<a href = "/monitoringList"><button class="btn btn-primary"><strong>알림 이력</strong></button></a>
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
//line 그래프의 x 값 매칭
var lineSeriesData = [];
<c:forEach items="${dailyStatValue}" var="item">
lineSeriesData.push(parseInt("${item}"));
</c:forEach>

//line 그래프 y 값 매칭
 var lineDate = [];
<c:forEach items="${dailyStatDate}" var="item">
lineDate.push("${item}");
</c:forEach> 

//bar 그래프 x 값 매칭
var barServerNm = [];
<c:forEach items="${topFiveSerNm}" var="item">
barServerNm.push("${item}");
</c:forEach>

//bar 그래프의 x 값 매칭
var barSeriesData = [];
<c:forEach items="${topFiveCnt}" var="item">
barSeriesData.push(parseInt("${item}"));
</c:forEach>



// pie 그래프 데이터 렌더링
var pieData = [];


for (var i = 0; i < barServerNm.length; i++){
	
	var pieKeyAndValue = new Object();

	pieKeyAndValue.name = barServerNm[i];
	pieKeyAndValue.y = barSeriesData[i];
	
	pieData.push(pieKeyAndValue);
	
}




//선형 그래프
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
        type: 'spline'
    },
    title: {
        text: '장애 알림 일간 통계',
       	style: {
           	fontWeight: 'bold'
        }
    },
    subtitle: {
        text: '일간 장애 알림 총 건수'
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
    credits:{
    	enabled:false
    }, 
    tooltip: {
        formatter: function() {
        	var str = '<b>' + 'TOP5'+ '</b>';
        	
    		$.ajax({
                type: "POST",
                url: "/monitoring/dailyTopFive",
                async:false,
                data: {"date" : this.x},
                dataType: "json",
                success: function(data){
                	
                	str = '<b>' + 'TOP'+ data.result.length + '</b>';
                	
                	if (data.result.length == null || data.result.length == 0){
                		str = '장애 발생하지 않음';
                	}
                	else {                   
                        $(data.result).each(function(){
                            str += "<br>" + this.serverNm + " : " + this.count;
                        });
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

    plotOptions: {
        spline: {
            dataLabels: {
                enabled: true
            }
        }
    },
    
    series: [{
    	showInLegend: false,
    	label: {
    		enabled: false
    	},
        data: lineSeriesData
    }]
});

//pie 그래프
Highcharts.chart('bar-chart', {
    chart: {
        plotBackgroundColor: null,
        plotBorderWidth: null,
        plotShadow: false,
        type: 'pie'
    },
    title: {
        text: '주간 서버 별 알림 통계',
        style: {
           	fontWeight: 'bold'
        }
    },
    subtitle: {
        text: '주간 서버 별 알림 건 수'
    },
    credits:{
    	enabled:false
    }, 
    tooltip: {
        pointFormat: '{series.name}: <b>{point.y} 건</b><br><b>{point.percentage:.1f} %</b>'
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                style: {
                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                }
            },
            point: {
            	events: {
            		click: function () {
            			var url = '/monitoring/server?serverNm=' + encodeURIComponent(this.options.name);
            			location.href = url;
            		}
            	}
            }
        }
    },
    series: [{
        name: '알림 건수',
        colorByPoint: true,
        data: pieData
    }]
});

// 막대 그래프
/* Highcharts.chart('bar-chart', {
	chart: {
        type: 'column'
    },
    title: {
        text: '주간 TOP 5',
       	style: {
              fontWeight: 'bold'
        }
    },
    subtitle: {
        text: '장애 발생 서버 TOP 5'
    },
    xAxis: {
        title: {
            text: '서버'
        },
        categories : barServerNm
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
    credits:{
    	enabled:false
    }, 
    tooltip: {
        headerFormat: ' ',
        pointFormat: '<span style="color:{point.color}"">{point.category}</span><br><span>{series.name}</span>: <b>{point.y}</b> 건<br/>'
    },

    series: [{
        name:"발생 건수",
    	colorByPoint: true,
        data: barSeriesData
    }]
             
}); */

</script>
