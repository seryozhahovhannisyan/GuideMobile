package com.connectto.guide.repository;

import com.connectto.guide.entity.FavoriteBlock;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by Seryozha Hovhaniisyan on 2015-02-09 16:36:41.
 */

@Repository
public interface ChannelRepository extends JpaRepository<FavoriteBlock, Long>, CrudRepository<FavoriteBlock,Long> {
    public Long countByChannelId(Long id);
}