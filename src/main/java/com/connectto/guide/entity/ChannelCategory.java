package com.connectto.guide.entity;

import javax.persistence.*;

@Entity
@Table(name = "iptv_channel_categories")
public class ChannelCategory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "category_id")
    private long id;

    @Column(name = "category_name")
    private String name;

    @Column(name = "category_dsc")
    private String dsc;

    @Column(name = "partition_id")
    private int partitionId;

    @Column(name = "deleted")
    private boolean deleted;

    /*##################################################################################################################
     *                                  GETTERS & SETTERS
     *##################################################################################################################
     */

    public long getId() {
        return id;
    }

    public ChannelCategory setId(long id) {
        this.id = id;
        return this;
    }

    public String getName() {
        return name;
    }

    public ChannelCategory setName(String name) {
        this.name = name;
        return this;
    }

    public String getDsc() {
        return dsc;
    }

    public ChannelCategory setDsc(String dsc) {
        this.dsc = dsc;
        return this;
    }

    public int getPartitionId() {
        return partitionId;
    }

    public ChannelCategory setPartitionId(int partitionId) {
        this.partitionId = partitionId;
        return this;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }
}
