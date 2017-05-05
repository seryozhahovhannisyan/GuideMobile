package com.connectto.guide.entity;

import java.util.Date;
import javax.persistence.*;
/**
 * Created by htdev001 on 2/5/15.
 */
@Entity
@Table(name = "core_channel_click")
public class ChannelClick {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

    @Column(name = "user_id")
    private long userId;

    @Column(name = "channel_id")
    private long channelId;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "click_date_time")
    private Date clickDateTime;

    /*##################################################################################################################
     *                                  GETTERS & SETTERS
     *##################################################################################################################
     */

    public long getId() {
        return id;
    }

    public ChannelClick setId(long id) {
        this.id = id;
        return this;
    }

    public long getUserId() {
        return userId;
    }

    public ChannelClick setUserId(long userId) {
        this.userId = userId;
        return this;
    }

    public long getChannelId() {
        return channelId;
    }

    public ChannelClick setChannelId(long channelId) {
        this.channelId = channelId;
        return this;
    }

    public Date getClickDateTime() {
        return clickDateTime;
    }

    public ChannelClick setClickDateTime(Date clickDateTime) {
        this.clickDateTime = clickDateTime;
        return this;
    }
}
