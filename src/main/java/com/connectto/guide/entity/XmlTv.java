package com.connectto.guide.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "v_core_xmltv")
public class XmlTv implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

    @Column(name = "channel")
    private String channel;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "start_time")
    private Date startTime;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "stop_time")
    private Date stopTime;

    @Column(name = "title")
    private String title;

    @Column(name = "category")
    private String category;

    @Column(name = "rating")
    private String rating;

    @Column(name = "icon")
    private String icon;
    // Escape  in dto
    @JsonIgnore
    @Column(name = "xmltv_channel_id")
    private Long xmltvChannelId;

    @JsonIgnore
    @Column(name = "xml_type")
    private int xmlType;



    /*##################################################################################################################
     *                                  GETTERS & SETTERS
     *##################################################################################################################
     */

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getChannel() {
        return channel;
    }

    public void setChannel(String channel) {
        this.channel = channel;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getStopTime() {
        return stopTime;
    }

    public void setStopTime(Date stopTime) {
        this.stopTime = stopTime;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public Long getXmltvChannelId() {
        return xmltvChannelId;
    }

    public void setXmltvChannelId(Long xmltvChannelId) {
        this.xmltvChannelId = xmltvChannelId;
    }

    public int getXmlType() {
        return xmlType;
    }

    public void setXmlType(int xmlType) {
        this.xmlType = xmlType;
    }
}
