package com.plantynet.warning.vo;

import java.sql.Timestamp;

public class ServerVO {
	private	int serverId;
	private String serverNm;
	private String ip;
	private String sttus;
	/*private Timestamp rgsde;*/
	private String rgsde;
	private String updde;
	
	

    public int getServerId() {
		return serverId;
	}
	public void setServerId(int serverId) {
		this.serverId = serverId;
	}
	public String getServerNm() {
		return serverNm;
	}
	public void setServerNm(String serverNm) {
		this.serverNm = serverNm;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getSttus() {
		return sttus;
	}
	public void setSttus(String sttus) {
		this.sttus = sttus;
	}
	/*public Timestamp getRgsde() {
		return rgsde;
	}
	public void setRgsde(Timestamp rgsde) {
		this.rgsde = rgsde;
	}*/
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
