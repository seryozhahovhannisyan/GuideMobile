package com.connectto.guide.repository;

import com.connectto.guide.entity.FavoriteBlock;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Repository
public interface FavoriteBlockRepository extends JpaRepository<FavoriteBlock, Long> {


    @Modifying
    @Query("Update FavoriteBlock fb SET fb.favorite=:favorite, fb.favoriteDateTime=:favoriteDateTime   WHERE fb.id=:id")
    public void updateFavorite(@Param("id") Long id,
                               @Param("favorite") Integer favorite,
                               @Param("favoriteDateTime") Date favoriteDateTime);

    @Modifying
    @Query("Update FavoriteBlock fb SET fb.block=:block, fb.blockDateTime=:blockDateTime, fb.blockPassword=:blockPassword   WHERE fb.id=:id")
    public void updateBlock(@Param("id") Long id,
                            @Param("block") Integer block,
                            @Param("blockPassword") String blockPassword,
                            @Param("blockDateTime") Date blockDateTime);


}