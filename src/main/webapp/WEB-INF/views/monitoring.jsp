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
			<div class="box-header">
				<div id="date-text" class="col-md-4">
					<h4><strong>통계기간 : </strong>${today}</h4>
				</div>
				<div id="button" class="col-md-2">
					<a href = "/monitoringList"><button style="height:40px" class="btn btn-primary"><strong>상세목록</strong></button></a>
				</div>
				<div class="col-md-6"></div>
			</div>
			
           <div class="box-body">
		   	<div id="line-chart" style="float:left; width:50%; min-width:310px; height: 400px; margin: 0 auto"></div>
			<div id="bar-chart" style="float:right; width:50%; min-width:310px; height: 400px; margin: 0 auto"></div>
			
		   </div>
		</div>
		
		</div>
	</div>
	
	<!-- 사용자 정보 수정 팝업창 기능 -->
  <div class="modal fade" id="dailyTopFivePopup" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4>일간 장애 발생 TOP 5</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
           <h3 class="text-center"><mark id="popUpDate"></mark></h3>
           <table id="tabDailyTopFive" class="table table-bordered text-center">
                <thead>
                    <tr class="active">
                      <th>서버명</th>
                      <th>장애 발생 건수</th>
                   </tr>
                </thead>
                <tbody>
                    
                </tbody>
           </table>
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

//line 그래프의 x 값 매칭
var barSeriesData = [];
<c:forEach items="${topFiveCnt}" var="item">
barSeriesData.push(parseInt("${item}"));
</c:forEach>



Highcharts.chart('line-chart', {
    chart: {
        type: 'spline'
    },
    title: {
        text: '장애 발생 일간 통계',
       	style: {
           	fontWeight: 'bold'
        }
    },
    subtitle: {
        text: '일간 장애 발생 총 건수'
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
        },
        series: {
            cursor:'pointer',
            point: {
                events:{
                    click : function (){
                        var date = this.category;
                        $("#popUpDate").text(date);
                        $.ajax({
                            
                            type :"post",
                            url : "/monitoring/dailyTopFive",
                            data :{"date" : date},
                            dataType : "json",
                            success : function(data){
                                if(data.result.length == 0){
                                    alert("해당 날짜에 발생한 장애가 없습니다.");
                                }
                                else{
                                    var str = "";
                                    $(data.result).each(function(){
                                        $("#tabDailyTopFive tbody").empty();
                                        str += "<tr><td>" + this.serverNm + "</td><td>" + this.count + "</td></tr>";
                                        $("#tabDailyTopFive tbody").append(str);
                                        $("#dailyTopFivePopup").modal();
                                    }); 
                                }
                                
                            }
                        });
                        
                    }
                }
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

    tooltip: {
        headerFormat: ' ',
        pointFormat: '<span style="color:{point.color}"">{point.category}</span><br><span>{series.name}</span>: <b>{point.y}</b> 건<br/>'
    },

    series: [{
        name: '발생 건수',
        colorByPoint: true,
        data: barSeriesData
    }]
             
});

</script>

