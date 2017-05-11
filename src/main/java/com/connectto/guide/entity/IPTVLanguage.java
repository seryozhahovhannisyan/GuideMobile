package com.connectto.guide.entity;


import javax.persistence.*;

/**
 * Created by Serozh on 7/20/2016.
 */
@Entity
@Table(name = "iptv_languages")
public class IPTVLanguage {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "language_id")
    private long languageId;

    @Column(name = "language")
    private String language;

    @Column(name = "partition_id")
    private int partitionId;

    @Column(name = "deleted")
    private boolean deleted;

    /*##################################################################################################################
     *                                  GETTERS & SETTERS
     *##################################################################################################################
     */

    public long getLanguageId() {
        return languageId;
    }

    public void setLanguageId(long languageId) {
        this.languageId = languageId;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public int getPartitionId() {
        return partitionId;
    }

    public void setPartitionId(int partitionId) {
        this.partitionId = partitionId;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public void setDeleted(boolean deleted) {
        this.deleted = deleted;
    }
}
