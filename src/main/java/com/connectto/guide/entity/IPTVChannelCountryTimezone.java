package com.connectto.guide.entity;

import javax.persistence.*;

/**
 * Created by htdev001 on 2/5/15.
 */
@Entity
@Table(name = "iptv_channel_country_timezone")
public class IPTVChannelCountryTimezone {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "timezone")
    private String timezone;

    @Column(name = "daylight_saving")
    private int daylightSaving;

    @Column(name = "start_month")
    private int startMonth;

    @Column(name = "start_week")
    private int startWeek;

    @Column(name = "start_week_day")
    private int startWeekDay;

    @Column(name = "start_day")
    private int startDay;

    @Column(name = "end_month")
    private int endMonth;

    @Column(name = "end_week")
    private int endWeek;

    @Column(name = "end_week_day")
    private int endWeekDay;

    @Column(name = "end_day")
    private int endDay;

    @Column(name = "deleted")
    private int deleted;

    /*##################################################################################################################
     *                                  GETTERS & SETTERS
     *##################################################################################################################
     */

    public int getId() {
        return id;
    }

    public IPTVChannelCountryTimezone setId(int id) {
        this.id = id;
        return this;
    }

    public String getName() {
        return name;
    }

    public IPTVChannelCountryTimezone setName(String name) {
        this.name = name;
        return this;
    }

    public String getTimezone() {
        return timezone;
    }

    public IPTVChannelCountryTimezone setTimezone(String timezone) {
        this.timezone = timezone;
        return this;
    }

    public int getDaylightSaving() {
        return daylightSaving;
    }

    public IPTVChannelCountryTimezone setDaylightSaving(int daylightSaving) {
        this.daylightSaving = daylightSaving;
        return this;
    }

    public int getStartMonth() {
        return startMonth;
    }

    public IPTVChannelCountryTimezone setStartMonth(int startMonth) {
        this.startMonth = startMonth;
        return this;
    }

    public int getStartWeek() {
        return startWeek;
    }

    public IPTVChannelCountryTimezone setStartWeek(int startWeek) {
        this.startWeek = startWeek;
        return this;
    }

    public int getStartWeekDay() {
        return startWeekDay;
    }

    public IPTVChannelCountryTimezone setStartWeekDay(int startWeekDay) {
        this.startWeekDay = startWeekDay;
        return this;
    }

    public int getStartDay() {
        return startDay;
    }

    public IPTVChannelCountryTimezone setStartDay(int startDay) {
        this.startDay = startDay;
        return this;
    }

    public int getEndMonth() {
        return endMonth;
    }

    public IPTVChannelCountryTimezone setEndMonth(int endMonth) {
        this.endMonth = endMonth;
        return this;
    }

    public int getEndWeek() {
        return endWeek;
    }

    public IPTVChannelCountryTimezone setEndWeek(int endWeek) {
        this.endWeek = endWeek;
        return this;
    }

    public int getEndWeekDay() {
        return endWeekDay;
    }

    public IPTVChannelCountryTimezone setEndWeekDay(int endWeekDay) {
        this.endWeekDay = endWeekDay;
        return this;
    }

    public int getEndDay() {
        return endDay;
    }

    public IPTVChannelCountryTimezone setEndDay(int endDay) {
        this.endDay = endDay;
        return this;
    }

    public int getDeleted() {
        return deleted;
    }

    public IPTVChannelCountryTimezone setDeleted(int deleted) {
        this.deleted = deleted;
        return this;
    }
}
