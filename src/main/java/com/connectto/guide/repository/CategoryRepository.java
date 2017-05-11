package com.connectto.guide.repository;

import com.connectto.guide.entity.ChannelCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface CategoryRepository extends JpaRepository<ChannelCategory, Long> {


    @Modifying
    @Query("SELECT cc FROM ChannelCategory cc WHERE cc.partitionId=:partitionId AND cc.deleted = 0")
    public List<ChannelCategory> getByPartitionIdAndDeleted(@Param("partitionId") Integer partitionId );




}