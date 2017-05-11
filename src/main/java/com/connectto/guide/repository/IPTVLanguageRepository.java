package com.connectto.guide.repository;

import com.connectto.guide.entity.IPTVLanguage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IPTVLanguageRepository extends JpaRepository<IPTVLanguage, Long> {


    @Modifying
    @Query("SELECT l FROM IPTVLanguage l WHERE l.partitionId=:partitionId AND l.deleted = 0")
    public List<IPTVLanguage> getByPartitionId(@Param("partitionId") Integer partitionId);




}