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
    private int languageId;

    @Column(name = "language")
    private String language;

    @Column(name = "name")
    private int partition_id;

    @Column(name = "deleted")
    private boolean deleted;

    /*##################################################################################################################
     *                                  GETTERS & SETTERS
     *##################################################################################################################
     */

    public int getLanguageId() {
        return languageId;
    }

    public IPTVLanguage setLanguageId(int languageId) {
        this.languageId = languageId;
        return this;
    }

    public String getLanguage() {
        return language;
    }

    public IPTVLanguage setLanguage(String language) {
        this.language = language;
        return this;
    }

    public int getPartition_id() {
        return partition_id;
    }

    public IPTVLanguage setPartition_id(int partition_id) {
        this.partition_id = partition_id;
        return this;
    }

    public boolean isDeleted() {
        return deleted;
    }

    public IPTVLanguage setDeleted(boolean deleted) {
        this.deleted = deleted;
        return this;
    }
}
