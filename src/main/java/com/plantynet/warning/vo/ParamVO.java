package com.plantynet.warning.vo;


/*
 * Agent 서버에서 GET방식으로 넘어오는 값들에 대한 VO 객체
 * 1. 서버아이피
 * 2. 발생한 에러 코드
 * 3. 에러 메세지
 * 4. 장애일시
 */

public class ParamVO
{   
    private String ip;
    private String eventCode;
    private String msg;
    private String lodge;
    
    public String getIp()
    {
        return ip;
    }
    public void setIp(String ip)
    {
        this.ip = ip;
    }
    public String getEventCode()
    {
        return eventCode;
    }
    public void setEventCode(String eventCode)
    {
        this.eventCode = eventCode;
    }
    public String getMsg()
    {
        return msg;
    }
    public void setMsg(String msg)
    {
        this.msg = msg;
    }
    public String getLodge()
    {
        return lodge;
    }
    public void setLodge(String lodge)
    {
        this.lodge = lodge;
    }
    @Override
    public String toString()
    {
        return "ParamVO [ip=" + ip + ", eventCode=" + eventCode + ", msg=" + msg + ", lodge=" + lodge + "]";
    }
    
    
}
