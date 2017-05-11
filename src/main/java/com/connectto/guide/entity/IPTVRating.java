package com.connectto.guide.entity;

import javax.persistence.*;

/**
 * Created by htdev001 on 2/5/15.
 */
@Entity
@Table(name = "iptv_ratings")
public class IPTVRating {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "rating_id")
    private long ratingId;

    @Column(name = "rating")
    private String rating;

    @Column(name = "rating1")
    private String rating1;

    @Column(name = "rating_dsc")
    private String ratingDsc;

    @Column(name = "partition_id")
    private int partitionId;

    @Column(name = "deleted")
    private int deleted;

    @Column(name = "ordering")
    private int ordering;

    /*##################################################################################################################
     *                                  GETTERS & SETTERS
     *##################################################################################################################
     */

    public long getRatingId() {
        return ratingId;
    }

    public IPTVRating setRatingId(long ratingId) {
        this.ratingId = ratingId;
        return this;
    }

    public String getRating() {
        return rating;
    }

    public IPTVRating setRating(String rating) {
        this.rating = rating;
        return this;
    }

    public String getRating1() {
        return rating1;
    }

    public IPTVRating setRating1(String rating1) {
        this.rating1 = rating1;
        return this;
    }

    public String getRatingDsc() {
        return ratingDsc;
    }

    public IPTVRating setRatingDsc(String ratingDsc) {
        this.ratingDsc = ratingDsc;
        return this;
    }

    public int getPartitionId() {
        return partitionId;
    }

    public IPTVRating setPartitionId(int partitionId) {
        this.partitionId = partitionId;
        return this;
    }

    public int getDeleted() {
        return deleted;
    }

    public IPTVRating setDeleted(int deleted) {
        this.deleted = deleted;
        return this;
    }

    public int getOrdering() {
        return ordering;
    }

    public IPTVRating setOrdering(int ordering) {
        this.ordering = ordering;
        return this;
    }
}
