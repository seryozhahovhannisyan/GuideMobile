package com.connectto.guide.repository;

import com.connectto.guide.entity.XmlTv;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import org.springframework.cache.annotation.Cacheable;

@Repository
public interface XmlTvRepository extends JpaRepository<XmlTv, Long> {

//    @Cacheable(value="movieFindCache", key="#xmltvChannelId")
//    @Cacheable({"movieFindCache", "xmltvChannelId"})
    @Cacheable(value="movieFindCache" )
    @Modifying
    @Query("SELECT tv FROM XmlTv tv  WHERE tv.xmltvChannelId=:xmltvChannelId AND tv.startTime BETWEEN :startTime AND :stopTime ")
    public List<XmlTv> xmltvChannelId(@Param("xmltvChannelId") Long xmltvChannelId,
                                      @Param("startTime") Date startTime,
                                      @Param("stopTime") Date stopTime);
}