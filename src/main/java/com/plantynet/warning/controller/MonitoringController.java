package com.plantynet.warning.controller;

import org.springframework.ui.Model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.plantynet.warning.service.MonitoringService;
import com.plantynet.warning.service.ServerInfoService;
import com.plantynet.warning.vo.MonitoringVO;
import com.plantynet.warning.vo.SearchParamVO;
import com.plantynet.warning.vo.SessionVO;
import com.plantynet.warning.vo.TeamTopFiveVO;

@Controller
public class MonitoringController {

	@Autowired
	MonitoringService monitoringService;
	@Autowired
	ServerInfoService serverInfoService;
	
	// 모니터링 페이지
	@RequestMapping(value = "/monitoring", method = RequestMethod.GET)
	public String monitoring(Model model, HttpSession session) 
		throws Exception {
		
		SessionVO sessionVO = (SessionVO) session.getAttribute("sessionVO");
		
		model.addAttribute("today", monitoringService.getDate());
		
		Collection<Integer> dailyStatValue = monitoringService.getDailyStat(sessionVO);
		String[] dailyStatDate = getDateArrays("MM/dd");
		
		
		List<TeamTopFiveVO> topVo = monitoringService.getTeamTopFive(sessionVO);
		ArrayList<String> topFiveSerNm = new ArrayList<>();
		ArrayList<Integer> topFiveCnt = new ArrayList<>();
		
		for ( TeamTopFiveVO vo : topVo)
        {
            topFiveSerNm.add(vo.getServerNm());
            topFiveCnt.add(vo.getCount());
        }
		
		model.addAttribute("dailyStatValue",dailyStatValue);
		model.addAttribute("dailyStatDate",dailyStatDate);
		model.addAttribute("topFiveSerNm", topFiveSerNm);
		model.addAttribute("topFiveCnt", topFiveCnt);
		
		return "monitoring";
	}
	
	// 모니터링 리스트 페이지
	@RequestMapping(value = "/monitoringList", method = RequestMethod.GET)
	public String monitoringList(Model model, HttpSession session, SearchParamVO searchParamVo) 
		throws Exception {

		SessionVO sessionVO = (SessionVO) session.getAttribute("sessionVO");
		
		if (searchParamVo.getNotiFlag() != null || searchParamVo.getPostDate() != null || searchParamVo.getPreDate() != null || searchParamVo.getSelEventId() != null || searchParamVo.getSelServerId() != null)
		{
			searchParamVo.setIsSearch("true");
			if (searchParamVo.getSelServerId() != null)
			{
				MonitoringVO monitoringVo = new MonitoringVO();
				monitoringVo.setServerId(searchParamVo.getSelServerId());
				monitoringVo.setManagerId(sessionVO.getManagerId());
				model.addAttribute("codeList",monitoringService.getCodeList(monitoringVo));
			}
		}
		else 
		{
			searchParamVo.setIsSearch("false");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar calendar = Calendar.getInstance();
			searchParamVo.setPreDate(sdf.format(calendar.getTime()));
			searchParamVo.setPostDate(sdf.format(calendar.getTime()));
		}
		searchParamVo.setManagerId(sessionVO.getManagerId());
		
		
		model.addAttribute("serverList", monitoringService.getServerList(sessionVO.getManagerId()));
		model.addAttribute("errorLogList", monitoringService.getErrorLogList(searchParamVo));
		model.addAttribute("searchParam", searchParamVo);
		
		return "monitoringList";
	}
	
	@RequestMapping(value = "/monitoring/server", method= RequestMethod.GET)
	public String redirectMonitoringList (String serverNm) {
		
		
		String serverId = serverInfoService.getServerIdByName(serverNm).toString();
		String[] dates = getDateArrays("yyyy-MM-dd");
		String preDate = dates[0];
		String postDate = dates[6];
		
		String url = "/monitoringList?preDate="+ preDate + "&postDate=" + postDate + "&selServerId=" + serverId + "&selEventId=";
		
		return "redirect:" + url;
	}
	
	// 모니터링 상세 페이지(사용안함) 
//	@RequestMapping(value = "/monitoringServer", method = RequestMethod.GET)
//	public String monitoringServer(Integer serverId, Model model)
//		throws Exception {
//		
//		// 일주일 전 날짜 ~ 오늘 날짜
//		model.addAttribute("today", monitoringService.getDate());
//
//		// 해당 서버 정보 (서버명, IP)
//		model.addAttribute("serverInfo", serverInfoService.getServerInfo(serverId));
//		
//		// 서버 선형 그래프
//		model.addAttribute("serverLineChart", monitoringService.getErrorLineStat(serverId));
//		
//		//서버 막대 그래프
//		model.addAttribute("serverBarChart", monitoringService.getErrorBarStat(serverId));
//		
//		return "monitoringServer";
//	}

	// 모니터링 리스트 페이지의 서버 카테고리 변경 시 해당 서버의 에러코드 목록
	@ResponseBody
	@RequestMapping(value = "/monitoringList/changeServer", method = RequestMethod.POST)
	public Map<String, Object> changeServer(@RequestParam("serverId") int serverId, HttpSession session) 
		throws Exception {
			
			SessionVO sessionVO = (SessionVO) session.getAttribute("sessionVO");
			
			Map<String, Object> map = new HashMap<String,Object>();
			MonitoringVO vo = new MonitoringVO();
			
			vo.setServerId(serverId);
			vo.setManagerId(sessionVO.getManagerId());
			List<MonitoringVO> list = (List<MonitoringVO>) monitoringService.getCodeList(vo);
			
			map.put("result", list);

		return map;
	}

	// MonitoringServer.jsp의 Line-Chart Tooltip 가져오기
	/*@ResponseBody
	@RequestMapping(value = "/monitoringServer/topCode", method = RequestMethod.POST)
	public Map<String, Object> topCode(@RequestParam("serverId") int serverId, @RequestParam("rgsde") String rgsde,  HttpSession session) 
		throws Exception {
		
			HashMap<String, Object> map = new HashMap<String,Object>();
			HashMap<String, Object> resultMap = new HashMap<String,Object>();
			
			map.put("rgsde", rgsde);
			map.put("serverId", serverId);
			
			List<MonitoringVO> list = (List<MonitoringVO>) monitoringService.getTopCode(map);
			resultMap.put("result", list);

		return resultMap;
	}*/
	
	@ResponseBody
    @RequestMapping(value = "/monitoring/dailyTopFive", method = RequestMethod.POST)
    public Map<String, Object> getDailyTopFive(String date, HttpSession session) 
        throws Exception {
	    
	        SessionVO sessionVO = (SessionVO) session.getAttribute("sessionVO");
        
            HashMap<String, Object> resultMap = new HashMap<String,Object>();
            Map<String, Object> paramMap = new HashMap<>();
            
            paramMap.put("date", date);
            paramMap.put("managerId", sessionVO.getManagerId());
            resultMap.put("result", monitoringService.getDailyTopFive(paramMap));
            

        return resultMap;
    }
	
	private static String[] getDateArrays(String pattern){
	    
	    String[] dateArray = new String[7];
        SimpleDateFormat formatter = new SimpleDateFormat(pattern);
        
        Calendar cal = Calendar.getInstance();
        
        for (int i = 6; i >= 0; i--)
        {
            dateArray[i] = formatter.format(cal.getTime());
            cal.add(Calendar.DATE, -1);
        }
        
        return dateArray;
	}
	
}
