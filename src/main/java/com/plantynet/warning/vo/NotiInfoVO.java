package com.plantynet.warning.vo;
/*
 * 발송 대기 테이블에 INSERT 할 데이터 VO 객체
 */
public class NotiInfoVO
{
    private Integer serverId;           //장애가 발생한 서버 아이디
    private Integer managerId;          //발생한 장애의 담당자 아이
    private Integer eventId;            //발생한 장애의 아이디
    private String eventCode;           //발생한 장애코드
    private String ip;                  //장애가 발생한 서버의 아이피
    private String msg;                 //Agent로부터 넘어온 장애메세지
    private String ntfcMth;             //담당자가 설정한 알림방법
    private String managerEmail;        //장애 담당자의 이메일
    private String managerCttpc;        //장애 담당자의 휴대폰 연락처
    private String logde;               //장애 발생 시간
    
    public Integer getServerId()
    {
        return serverId;
    }
    public void setServerId(Integer serverId)
    {
        this.serverId = serverId;
    }
    public Integer getManagerId()
    {
        return managerId;
    }
    public void setManagerId(Integer managerId)
    {
        this.managerId = managerId;
    }
    public Integer getEventId()
    {
        return eventId;
    }
    public void setEventId(Integer eventId)
    {
        this.eventId = eventId;
    }
    public String getEventCode()
    {
        return eventCode;
    }
    public void setEventCode(String eventCode)
    {
        this.eventCode = eventCode;
    }
    public String getIp()
    {
        return ip;
    }
    public void setIp(String ip)
    {
        this.ip = ip;
    }
    public String getMsg()
    {
        return msg;
    }
    public void setMsg(String msg)
    {
        this.msg = msg;
    }
    public String getNtfcMth()
    {
        return ntfcMth;
    }
    public void setNtfcMth(String ntfcMth)
    {
        this.ntfcMth = ntfcMth;
    }
    public String getManagerEmail()
    {
        return managerEmail;
    }
    public void setManagerEmail(String managerEmail)
    {
        this.managerEmail = managerEmail;
    }
    public String getManagerCttpc()
    {
        return managerCttpc;
    }
    public void setManagerCttpc(String managerCttpc)
    {
        this.managerCttpc = managerCttpc;
    }
    public String getLogde()
    {
        return logde;
    }
    public void setLogde(String logde)
    {
        this.logde = logde;
    }
    @Override
    public String toString()
    {
        return "NotiInfoVO [serverId=" + serverId + ", managerId=" + managerId + ", eventId=" + eventId + ", eventCode="
                + eventCode + ", ip=" + ip + ", msg=" + msg + ", ntfcMth=" + ntfcMth + ", managerEmail=" + managerEmail
                + ", managerCttpc=" + managerCttpc + ", logde=" + logde + "]";
    }
    
    
}
