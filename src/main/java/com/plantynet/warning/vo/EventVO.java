package com.plantynet.warning.vo;

public class EventVO
{
    private int eventId;
    private int serverId;
    private String eventCode;
    private String description;
    private String rgsde;
    public int getEventId()
    {
        return eventId;
    }
    public void setEventId(int eventId)
    {
        this.eventId = eventId;
    }
    public int getServerId()
    {
        return serverId;
    }
    public void setServerId(int serverId)
    {
        this.serverId = serverId;
    }
    public String getEventCode()
    {
        return eventCode;
    }
    public void setEventCode(String eventCode)
    {
        this.eventCode = eventCode;
    }
    public String getDescription()
    {
        return description;
    }
    public void setDescription(String description)
    {
        this.description = description;
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
        return "EventVO [eventId=" + eventId + ", serverId=" + serverId + ", eventCode=" + eventCode + ", description="
                + description + ", rgsde=" + rgsde + "]";
    }
    
    
}
