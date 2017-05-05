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
    private int channelId;

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

    public FavoriteBlock setId(Long id) {
        this.id = id;
        return this;
    }

    public int getPartitionId() {
        return partitionId;
    }

    public FavoriteBlock setPartitionId(int partitionId) {
        this.partitionId = partitionId;
        return this;
    }

    public long getUserId() {
        return userId;
    }

    public FavoriteBlock setUserId(long userId) {
        this.userId = userId;
        return this;
    }

    public int getChannelId() {
        return channelId;
    }

    public FavoriteBlock setChannelId(int channelId) {
        this.channelId = channelId;
        return this;
    }

    public Integer getFavorite() {
        return favorite;
    }

    public FavoriteBlock setFavorite(Integer favorite) {
        this.favorite = favorite;
        return this;
    }

    public Date getFavoriteDateTime() {
        return favoriteDateTime;
    }

    public FavoriteBlock setFavoriteDateTime(Date favoriteDateTime) {
        this.favoriteDateTime = favoriteDateTime;
        return this;
    }

    public Integer getBlock() {
        return block;
    }

    public FavoriteBlock setBlock(Integer block) {
        this.block = block;
        return this;
    }

    public String getBlockPassword() {
        return blockPassword;
    }

    public FavoriteBlock setBlockPassword(String blockPassword) {
        this.blockPassword = blockPassword;
        return this;
    }

    public Date getBlockDateTime() {
        return blockDateTime;
    }

    public FavoriteBlock setBlockDateTime(Date blockDateTime) {
        this.blockDateTime = blockDateTime;
        return this;
    }
}