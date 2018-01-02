package com.plantynet.warning.vo;

public class ManagerVO {

	private int managerId;
	private int teamId;
	private String managerNm;
	private String loginId;
	private String loginPassword;
	private String phoneNo;
	private String email;
	private String sttus;
	private String rgsde;
	private String updde;

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public int getManagerId() {
		return managerId;
	}

	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}

	public int getTeamId() {
		return teamId;
	}

	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}

	public String getManagerNm() {
		return managerNm;
	}

	public void setManagerNm(String managerNm) {
		this.managerNm = managerNm;
	}

	public String getLoginPassword() {
		return loginPassword;
	}

	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSttus() {
		return sttus;
	}

	public void setSttus(String sttus) {
		this.sttus = sttus;
	}

	public String getRgsde() {
		return rgsde;
	}

	public void setRgsde(String rgsde) {
		this.rgsde = rgsde;
	}

	public String getUpdde() {
		return updde;
	}

	public void setUpdde(String updde) {
		this.updde = updde;
	}

}
