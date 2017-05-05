package com.connectto.guide.entity;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "v_core_xmltv")
public class XmlTv {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

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

    /*##################################################################################################################
     *                                  GETTERS & SETTERS
     *##################################################################################################################
     */

    public int getId() {
        return id;
    }

    public XmlTv setId(int id) {
        this.id = id;
        return this;
    }

    public String getChannel() {
        return channel;
    }

    public XmlTv setChannel(String channel) {
        this.channel = channel;
        return this;
    }

    public Date getStartTime() {
        return startTime;
    }

    public XmlTv setStartTime(Date startTime) {
        this.startTime = startTime;
        return this;
    }

    public Date getStopTime() {
        return stopTime;
    }

    public XmlTv setStopTime(Date stopTime) {
        this.stopTime = stopTime;
        return this;
    }

    public String getTitle() {
        return title;
    }

    public XmlTv setTitle(String title) {
        this.title = title;
        return this;
    }

    public String getCategory() {
        return category;
    }

    public XmlTv setCategory(String category) {
        this.category = category;
        return this;
    }

    public String getRating() {
        return rating;
    }

    public XmlTv setRating(String rating) {
        this.rating = rating;
        return this;
    }

    public String getIcon() {
        return icon;
    }

    public XmlTv setIcon(String icon) {
        this.icon = icon;
        return this;
    }
}
