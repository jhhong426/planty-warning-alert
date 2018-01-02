package com.plantynet.warning.dao;

import java.util.HashMap;

import com.plantynet.warning.vo.ManagerVO;


public interface LoginDAO {
	public int login(HashMap<String, String> map);
	public ManagerVO getManagerByLoginId(String id);
}
