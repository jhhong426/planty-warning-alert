package com.plantynet.warning.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plantynet.warning.dao.AdminDAO;
import com.plantynet.warning.service.AdminService;
import com.plantynet.warning.vo.ManagerVO;


@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO adminDAO;
	
	public void addAdmin(ManagerVO managerVO) {
		adminDAO.addAdmin(managerVO);
	}
	
	@Override
	public List<ManagerVO> getManagerListByTeamId(int teamId) {
		return adminDAO.getManagerListByTeamId(teamId);
	}

	public void deleteAdmin(int managerId) {
		adminDAO.deleteAdmin(managerId);
	}
}
