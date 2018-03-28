package com.plantynet.warning.service;

import java.util.List;

import com.plantynet.warning.vo.ManagerVO;

public interface AdminService {
	void addAdmin(ManagerVO managerVO);
	List<ManagerVO> getManagerList();
	public void deleteAdmin(int managerId);
	public int getLoginIdCount(String loginId);
}
