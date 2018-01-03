package com.plantynet.warning.dao;

import java.util.List;

import com.plantynet.warning.vo.ManagerVO;

public interface AdminDAO {
	public void addAdmin(ManagerVO managerVO);
	public List<ManagerVO> getManagerListByTeamId(int teamId);
	public void deleteAdmin(int managerId);
}
