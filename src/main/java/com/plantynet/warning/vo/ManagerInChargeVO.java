package com.plantynet.warning.vo;

public class ManagerInChargeVO
{
    private int managerId;
    private int eventId;
    private String managerNm;
    private String alertMth;
    private String rgsde;
    
    
    public String getManagerNm()
    {
        return managerNm;
    }
    public void setManagerNm(String managerNm)
    {
        this.managerNm = managerNm;
    }
    public int getManagerId()
    {
        return managerId;
    }
    public void setManagerId(int managerId)
    {
        this.managerId = managerId;
    }
    public int getEventId()
    {
        return eventId;
    }
    public void setEventId(int eventId)
    {
        this.eventId = eventId;
    }
    public String getAlertMth()
    {
        return alertMth;
    }
    public void setAlertMth(String alertMth)
    {
        this.alertMth = alertMth;
    }
    public String getRgsde()
    {
        return rgsde;
    }
    public void setRgsde(String rgsde)
    {
        this.rgsde = rgsde;
    }
    @Override
    public String toString()
    {
        return "ManagerInChargeVO [managerId=" + managerId + ", eventId=" + eventId + ", managerNm=" + managerNm
                + ", alertMth=" + alertMth + ", rgsde=" + rgsde + "]";
    }
    
    
}
