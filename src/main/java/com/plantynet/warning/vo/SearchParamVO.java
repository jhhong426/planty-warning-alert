package com.plantynet.warning.vo;

public class SearchParamVO {
	
	private String isSearch;
	private String preDate;
	private String postDate;
	private Integer selServerId;
	private Integer selEventId;
	private String notiFlag;
	private Integer managerId;
	
	public String getPreDate() {
		return preDate;
	}
	public void setPreDate(String preDate) {
		this.preDate = preDate;
	}
	public String getPostDate() {
		return postDate;
	}
	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}
	public String getIsSearch() {
		return isSearch;
	}
	public void setIsSearch(String isSearch) {
		this.isSearch = isSearch;
	}
	public Integer getManagerId() {
		return managerId;
	}
	public void setManagerId(Integer managerId) {
		this.managerId = managerId;
	}
	
	public Integer getSelServerId() {
		return selServerId;
	}
	public void setSelServerId(Integer selServerId) {
		this.selServerId = selServerId;
	}
	public Integer getSelEventId() {
		return selEventId;
	}
	public void setSelEventId(Integer selEventId) {
		this.selEventId = selEventId;
	}
	public String getNotiFlag() {
		return notiFlag;
	}
	public void setNotiFlag(String notiFlag) {
		this.notiFlag = notiFlag;
	}
	@Override
	public String toString() {
		return "SearchParamVO [isSearch=" + isSearch + ", preDate=" + preDate + ", postDate=" + postDate
				+ ", selServerId=" + selServerId + ", selEventId=" + selEventId + ", notiFlag=" + notiFlag
				+ ", managerId=" + managerId + "]";
	}
	
	
	
}
