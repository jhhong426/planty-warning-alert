package com.plantynet.warning.vo;

public class SessionVO {
	private	int managerId;
	private String managerNm;
	private String loginId;
	private String phoneNo;
	private String email;
	
	public int getManagerId() {
		return managerId;
	}
	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}
	public String getManagerNm() {
		return managerNm;
	}
	public void setManagerNm(String managerNm) {
		this.managerNm = managerNm;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
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
	@Override
	public String toString() {
		return "SessionVO [managerId=" + managerId + ", managerNm=" + managerNm + ", loginId=" + loginId + ", phoneNo="
				+ phoneNo + ", email=" + email + "]";
	}
	
	

}
