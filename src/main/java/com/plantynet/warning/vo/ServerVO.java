package com.plantynet.warning.vo;

import java.sql.Timestamp;

public class ServerVO {
	private	int serverId;
	private int teamId;
	private String teamNm;
	private String serverNm;
	private String ip;
	private String sttus;
	/*private Timestamp rgsde;*/
	private String rgsde;
	private String updde;
	
	
	public String getTeamNm()
    {
        return teamNm;
    }
    public void setTeamNm(String teamNm)
    {
        this.teamNm = teamNm;
    }
    public int getServerId() {
		return serverId;
	}
	public void setServerId(int serverId) {
		this.serverId = serverId;
	}
	public int getTeamId() {
		return teamId;
	}
	public void setTeamId(int teamId) {
		this.teamId = teamId;
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
	@Override
	public String toString() {
		return "ServerVO [serverId=" + serverId + ", teamId=" + teamId + ", ServerNm=" + serverNm + ", ip=" + ip
				+ ", sttus=" + sttus + ", rgsde=" + rgsde + ", updde=" + updde + "]";
	}
	
	
}
