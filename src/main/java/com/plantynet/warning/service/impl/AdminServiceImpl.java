package com.plantynet.warning.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plantynet.warning.dao.AdminDAO;
import com.plantynet.warning.dao.ServerInfoDAO;
import com.plantynet.warning.service.AdminService;
import com.plantynet.warning.vo.ManagerVO;


@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO adminDAO;
	
	
	@Override
	public void addAdmin(ManagerVO managerVO) {
		adminDAO.addAdmin(managerVO);
	}
	
	@Override
	public List<ManagerVO> getManagerList() {
		return adminDAO.getManagerList();
	}
	@Override
	public void deleteAdmin(int managerId) {
		adminDAO.deleteAdmin(managerId);
		adminDAO.updateEvntMngrByManagerId(managerId);
	}

	@Override
	public int getLoginIdCount(String loginId) {
		return adminDAO.getLoginIdCount(loginId);
	}
	
	
}
