package com.connectto.guide.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "v_iptv_channels")
public class Channel implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "channel_id")
    private long channelId;

    @Column(name = "channel_number")
    private String number;

    @Column(name = "channel_name")
    private String name;

    @Column(name = "channel_dsc")
    private String dsc;

    @Column(name = "dvr_depth")
    private String dvrDepth;

    @Column(name = "recording")
    private String recording;

    @Column(name = "timeshift")
    private String timeShift;

    @Column(name = "channel_logo")
    private String logo;

    @Column(name = "channel_category")
    private String category;

    @Column(name = "multicast_url")
    private String multicastUrl;

    @Column(name = "nvr_view_url")
    private String nvrViewUrl;

    @Column(name = "unicast_url")
    private String unicastUrl;

    @Column(name = "xml_channel_id")
    private int xmlChannelId;

//    @Column(name = "timezone")
//    private String timezone;//-08

    @Column(name = "rating_val")
    private String ipTVRatingVal;

    @Column(name = "default_language_id")
    private String defaultLanguageId;

    @Column(name = "clickCount")
    private int clickCount;//

    @ManyToOne
    @JoinColumn(name = "channel_timezone")
    private IPTVChannelCountryTimezone channelTimezone;//-08

    @ManyToOne
    @JoinColumn(name = "timezoneId")
    private IPTVChannelCountryTimezone countryTimezone;//


    @JsonIgnore
    @Column(name = "updated")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedAt;

    @JsonIgnore
    @Column(name = "deleted")
    private int deleted;

    @JsonIgnore
    @Column(name = "partition_id")
    private int partitionId;

    @JsonIgnore
    @Column(name = "nvr_server_id")
    private int nvrServerId;



//    private FavoriteBlock favoriteBlock;//


    /*##################################################################################################################
     *                                  GETTERS & SETTERS
     *##################################################################################################################
     */

    public long getChannelId() {
        return channelId;
    }

    public void setChannelId(long channelId) {
        this.channelId = channelId;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDsc() {
        return dsc;
    }

    public void setDsc(String dsc) {
        this.dsc = dsc;
    }

    public String getDvrDepth() {
        return dvrDepth;
    }

    public void setDvrDepth(String dvrDepth) {
        this.dvrDepth = dvrDepth;
    }

    public String getRecording() {
        return recording;
    }

    public void setRecording(String recording) {
        this.recording = recording;
    }

    public String getTimeShift() {
        return timeShift;
    }

    public void setTimeShift(String timeShift) {
        this.timeShift = timeShift;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getMulticastUrl() {
        return multicastUrl;
    }

    public void setMulticastUrl(String multicastUrl) {
        this.multicastUrl = multicastUrl;
    }

    public String getNvrViewUrl() {
        return nvrViewUrl;
    }

    public void setNvrViewUrl(String nvrViewUrl) {
        this.nvrViewUrl = nvrViewUrl;
    }

    public String getUnicastUrl() {
        return unicastUrl;
    }

    public void setUnicastUrl(String unicastUrl) {
        this.unicastUrl = unicastUrl;
    }

    public int getXmlChannelId() {
        return xmlChannelId;
    }

    public void setXmlChannelId(int xmlChannelId) {
        this.xmlChannelId = xmlChannelId;
    }

    /*public String getTimezone() {
        return timezone;
    }

    public void setTimezone(String timezone) {
        this.timezone = timezone;
    }*/

    public String getIpTVRatingVal() {
        return ipTVRatingVal;
    }

    public void setIpTVRatingVal(String ipTVRatingVal) {
        this.ipTVRatingVal = ipTVRatingVal;
    }

    public String getDefaultLanguageId() {
        return defaultLanguageId;
    }

    public void setDefaultLanguageId(String defaultLanguageId) {
        this.defaultLanguageId = defaultLanguageId;
    }

    public int getClickCount() {
        return clickCount;
    }

    public void setClickCount(int clickCount) {
        this.clickCount = clickCount;
    }

    public IPTVChannelCountryTimezone getChannelTimezone() {
        return channelTimezone;
    }

    public void setChannelTimezone(IPTVChannelCountryTimezone channelTimezone) {
        this.channelTimezone = channelTimezone;
    }

    public IPTVChannelCountryTimezone getCountryTimezone() {
        return countryTimezone;
    }

    public void setCountryTimezone(IPTVChannelCountryTimezone countryTimezone) {
        this.countryTimezone = countryTimezone;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }

    public int getPartitionId() {
        return partitionId;
    }

    public void setPartitionId(int partitionId) {
        this.partitionId = partitionId;
    }

    public int getNvrServerId() {
        return nvrServerId;
    }

    public void setNvrServerId(int nvrServerId) {
        this.nvrServerId = nvrServerId;
    }
}
