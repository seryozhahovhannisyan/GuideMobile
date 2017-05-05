package com.connectto.guide.entity;

import javax.persistence.*;

@Entity
@Table(name = "iptv_channels")
public class Channel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

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

    @Column(name = "timezone")
    private String timezone;//-08

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

    @ManyToOne
    @JoinColumn(name = "fb_id")
    private FavoriteBlock favoriteBlock;//

//    @OneToMany(mappedBy="process", cascade = CascadeType.ALL)
//    private List<XmlTv> xmlTvs;


    /*##################################################################################################################
     *                                  GETTERS & SETTERS
     *##################################################################################################################
     */

    public long getId() {
        return id;
    }

    public Channel setId(long id) {
        this.id = id;
        return this;
    }

    public String getNumber() {
        return number;
    }

    public Channel setNumber(String number) {
        this.number = number;
        return this;
    }

    public String getName() {
        return name;
    }

    public Channel setName(String name) {
        this.name = name;
        return this;
    }

    public String getDsc() {
        return dsc;
    }

    public Channel setDsc(String dsc) {
        this.dsc = dsc;
        return this;
    }

    public String getDvrDepth() {
        return dvrDepth;
    }

    public Channel setDvrDepth(String dvrDepth) {
        this.dvrDepth = dvrDepth;
        return this;
    }

    public String getRecording() {
        return recording;
    }

    public Channel setRecording(String recording) {
        this.recording = recording;
        return this;
    }

    public String getTimeShift() {
        return timeShift;
    }

    public Channel setTimeShift(String timeShift) {
        this.timeShift = timeShift;
        return this;
    }

    public String getLogo() {
        return logo;
    }

    public Channel setLogo(String logo) {
        this.logo = logo;
        return this;
    }

    public String getCategory() {
        return category;
    }

    public Channel setCategory(String category) {
        this.category = category;
        return this;
    }

    public String getMulticastUrl() {
        return multicastUrl;
    }

    public Channel setMulticastUrl(String multicastUrl) {
        this.multicastUrl = multicastUrl;
        return this;
    }

    public String getNvrViewUrl() {
        return nvrViewUrl;
    }

    public Channel setNvrViewUrl(String nvrViewUrl) {
        this.nvrViewUrl = nvrViewUrl;
        return this;
    }

    public String getUnicastUrl() {
        return unicastUrl;
    }

    public Channel setUnicastUrl(String unicastUrl) {
        this.unicastUrl = unicastUrl;
        return this;
    }

    public int getXmlChannelId() {
        return xmlChannelId;
    }

    public Channel setXmlChannelId(int xmlChannelId) {
        this.xmlChannelId = xmlChannelId;
        return this;
    }

    public String getTimezone() {
        return timezone;
    }

    public Channel setTimezone(String timezone) {
        this.timezone = timezone;
        return this;
    }

    public String getIpTVRatingVal() {
        return ipTVRatingVal;
    }

    public Channel setIpTVRatingVal(String ipTVRatingVal) {
        this.ipTVRatingVal = ipTVRatingVal;
        return this;
    }

    public String getDefaultLanguageId() {
        return defaultLanguageId;
    }

    public Channel setDefaultLanguageId(String defaultLanguageId) {
        this.defaultLanguageId = defaultLanguageId;
        return this;
    }

    public int getClickCount() {
        return clickCount;
    }

    public Channel setClickCount(int clickCount) {
        this.clickCount = clickCount;
        return this;
    }

    public IPTVChannelCountryTimezone getChannelTimezone() {
        return channelTimezone;
    }

    public Channel setChannelTimezone(IPTVChannelCountryTimezone channelTimezone) {
        this.channelTimezone = channelTimezone;
        return this;
    }

    public IPTVChannelCountryTimezone getCountryTimezone() {
        return countryTimezone;
    }

    public Channel setCountryTimezone(IPTVChannelCountryTimezone countryTimezone) {
        this.countryTimezone = countryTimezone;
        return this;
    }

    public FavoriteBlock getFavoriteBlock() {
        return favoriteBlock;
    }

    public Channel setFavoriteBlock(FavoriteBlock favoriteBlock) {
        this.favoriteBlock = favoriteBlock;
        return this;
    }

    /*public List<XmlTv> getXmlTvs() {
        return xmlTvs;
    }

    public Channel setXmlTvs(List<XmlTv> xmlTvs) {
        this.xmlTvs = xmlTvs;
        return this;
    }*/
}
