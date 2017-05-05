package com.connectto.guide.entity;

import javax.persistence.*;
import com.connectto.guide.common.util.StringHelper;

import java.util.Properties;

@Entity
@Table(name = "iptv_user_rating_info")
public class UserRatingInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "user_id")
    private Long userId;

    @Column(name = "password")
    private String password;

    @Column(name = "rating")
    private String rating;

    @Column(name = "channel_category")
    private String channelCategory;

    @Column(name = "watching_channel")
    private int watchingChannel;

    @Column(name = "no_rating")
    private int noRating;

    public UserRatingInfo() {
    }

    public UserRatingInfo(Properties properties) {
        password =  StringHelper.isBlank(properties.getProperty("password")) ? "1111" : properties.getProperty("password");
        rating =  StringHelper.isBlank(properties.getProperty("rating")) ? "" : properties.getProperty("rating");
        channelCategory =  StringHelper.isBlank(properties.getProperty("channelCategory")) ? "" : properties.getProperty("channelCategory");

        try {
            noRating = StringHelper.isBlank(properties.getProperty("noRating")) ? 1 : Integer.parseInt(properties.getProperty("noRating"));
        }catch (Exception e){
            noRating = 1;
        }

        try {
            watchingChannel = StringHelper.isBlank(properties.getProperty("watchingChannel")) ? 0 : Integer.parseInt(properties.getProperty("watchingChannel"));
        }catch (Exception e){
            watchingChannel = 0;
        }

    }


    /*##################################################################################################################
     *                                  GETTERS & SETTERS
     *##################################################################################################################
     */


    public Long getId() {
        return id;
    }

    public UserRatingInfo setId(Long id) {
        this.id = id;
        return this;
    }

    public Long getUserId() {
        return userId;
    }

    public UserRatingInfo setUserId(Long userId) {
        this.userId = userId;
        return this;
    }

    public String getPassword() {
        return password;
    }

    public UserRatingInfo setPassword(String password) {
        this.password = password;
        return this;
    }

    public String getRating() {
        return rating;
    }

    public UserRatingInfo setRating(String rating) {
        this.rating = rating;
        return this;
    }

    public String getChannelCategory() {
        return channelCategory;
    }

    public UserRatingInfo setChannelCategory(String channelCategory) {
        this.channelCategory = channelCategory;
        return this;
    }

    public int getWatchingChannel() {
        return watchingChannel;
    }

    public UserRatingInfo setWatchingChannel(int watchingChannel) {
        this.watchingChannel = watchingChannel;
        return this;
    }

    public int getNoRating() {
        return noRating;
    }

    public UserRatingInfo setNoRating(int noRating) {
        this.noRating = noRating;
        return this;
    }
}
