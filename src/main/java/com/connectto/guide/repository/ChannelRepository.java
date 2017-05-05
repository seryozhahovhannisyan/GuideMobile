package com.connectto.guide.repository;

import com.connectto.guide.entity.Channel;
import com.connectto.guide.entity.FavoriteBlock;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Map;

/**
 * Created by Seryozha Hovhaniisyan on 2015-02-09 16:36:41.
 */


public interface ChannelRepository extends JpaRepository<FavoriteBlock, Long> {

    public Channel getByChannelIdForMobile(Map<String, Object> params) ;
    public Integer getNewCountByParams(Map<String, Object> params) ;
    public List<Integer> getNewIdesByParams(Map<String, Object> params) ;

//    public List<ChannelCategoryModel> getIptvChannelCategories(Map<String, Object> params) ;
//    public List<IPTVLanguage> getIPTVLanguages(Map<String, Object> params) ;

    public Integer getChannelIdByXMLTVChannelId(int xmlTvChannelId) ;
    public boolean isChannelExists(int xmlTvChannelId) ;

}