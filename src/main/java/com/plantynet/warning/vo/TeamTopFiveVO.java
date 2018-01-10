package com.plantynet.warning.vo;

public class TeamTopFiveVO
{
    private String serverNm;
    private Integer count;
    
    public String getServerNm()
    {
        return serverNm;
    }
    public void setServerNm(String serverNm)
    {
        this.serverNm = serverNm;
    }
    public Integer getCount()
    {
        return count;
    }
    public void setCount(Integer count)
    {
        this.count = count;
    }
    @Override
    public String toString()
    {
        return "TeamTopFiveVO [serverNm=" + serverNm + ", count=" + count + "]";
    }
    
    
}
