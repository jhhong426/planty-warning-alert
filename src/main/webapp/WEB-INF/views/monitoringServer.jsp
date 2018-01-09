<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />    

<%@include file="include/header.jsp"%>

<div class="content-wrapper" style="width:auto; height:auto; padding:0px;">
	<div class="box" style="width:auto; height:auto; padding:0px;">
		<h3><strong>&emsp;모니터링 > 상세목록 > 서버별 장애 통계</strong></h3>
		<div class="box">
		
			<div class="box-header">
				<div id="date-text" class="col-md-5">
					<h4><strong>통계기간&ensp;:&ensp;</strong>${today}</h4>
					<h4><strong>서&emsp;&emsp;버&ensp;:&ensp;</strong>${serverInfo.serverNm}</h4>
					<h4><strong>&ensp;I&emsp;&emsp;&ensp;P&ensp; :&ensp;</strong>${serverInfo.ip}</h4>
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

// 오늘을 포함한 일주일의 날짜(String)와 그 날 한 서버에서 에러가 발생한 총 개수(Int)를 배열에 불러옴
var date = new Array();
var eventCount = new Array();

<c:forEach var="item" items="${serverLineChart}" varStatus="status">
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

// 막대 그래프 
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
        	<c:forEach var="item" items="${serverBarChart}" varStatus="status">
        	{
	        	name: '${item.eventCode}',
	            y: ${item.count}
        	}
        	<c:if test="${!status.last}">, </c:if>
        	</c:forEach>
        	]
    }]
});

</script>

