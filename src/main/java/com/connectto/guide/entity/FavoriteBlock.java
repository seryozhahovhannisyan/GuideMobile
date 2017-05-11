package com.connectto.guide.entity;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by htdev001 on 2/5/15.
 */
@Entity
@Table(name = "iptv_favorite_block")
public class FavoriteBlock {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "partition_id")
    private int partitionId;

    @Column(name = "user_id")
    private long userId;

    @Column(name = "channel_id")
    private long channelId;

    @Column(name = "favorite")
    private Integer favorite;

    @Column(name = "favorite_date_time")
    @Temporal(TemporalType.TIMESTAMP)
    private Date favoriteDateTime;

    @Column(name = "block")
    private Integer block;

    @Column(name = "block_password")
    private String blockPassword;

    @Column(name = "block_date_time")
    @Temporal(TemporalType.TIMESTAMP)
    private Date blockDateTime;

    /*##################################################################################################################
     *                                  GETTERS & SETTERS
     *##################################################################################################################
     */

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getPartitionId() {
        return partitionId;
    }

    public void setPartitionId(int partitionId) {
        this.partitionId = partitionId;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public long getChannelId() {
        return channelId;
    }

    public void setChannelId(long channelId) {
        this.channelId = channelId;
    }

    public Integer getFavorite() {
        return favorite;
    }

    public void setFavorite(Integer favorite) {
        this.favorite = favorite;
    }

    public Date getFavoriteDateTime() {
        return favoriteDateTime;
    }

    public void setFavoriteDateTime(Date favoriteDateTime) {
        this.favoriteDateTime = favoriteDateTime;
    }

    public Integer getBlock() {
        return block;
    }

    public void setBlock(Integer block) {
        this.block = block;
    }

    public String getBlockPassword() {
        return blockPassword;
    }

    public void setBlockPassword(String blockPassword) {
        this.blockPassword = blockPassword;
    }

    public Date getBlockDateTime() {
        return blockDateTime;
    }

    public void setBlockDateTime(Date blockDateTime) {
        this.blockDateTime = blockDateTime;
    }
}