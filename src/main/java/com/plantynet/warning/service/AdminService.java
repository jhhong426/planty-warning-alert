package com.plantynet.warning.service;

import java.util.List;

import com.plantynet.warning.vo.ManagerVO;

public interface AdminService {
	void addAdmin(ManagerVO managerVO);
	List<ManagerVO> getManagerListByTeamId(int teamId);
	public void deleteAdmin(int managerId);
}
