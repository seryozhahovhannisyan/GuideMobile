package com.connectto.guide.repository;

import com.connectto.guide.entity.Channel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by Seryozha Hovhaniisyan on 2015-02-09 16:36:41.
 */

@Repository
public interface ChannelRepository extends JpaRepository<Channel, Long>, CrudRepository<Channel,Long> {

    public Long countByChannelId(Long id);

//    @Modifying
//    @Query("SELECT vc FROM Channel vc   WHERE vc.channelId=:channelId ")
//    public  Channel getByChannelId(@Param("channelId") Long channelId);

}