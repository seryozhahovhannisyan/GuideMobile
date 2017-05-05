package com.connectto.guide.service.impl;

import com.connectto.guide.common.exception.InternalErrorException;
import com.connectto.guide.common.util.CollectionHelper;
import com.connectto.guide.entity.ChannelCategory;
import com.connectto.guide.entity.IPTVLanguage;
import com.connectto.guide.entity.XmlFilesUpdate;
import com.connectto.guide.entity.Channel;
import com.connectto.guide.repository.ChannelRepository;
import com.connectto.guide.repository.FavoriteBlockRepository;
import com.connectto.guide.repository.XmlFilesUpdateRepository;
import com.connectto.guide.repository.XmlTvRepository;
import com.connectto.guide.service.ChannelService;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Seryozha Hovhaniisyan on 2015-02-09 16:36:41.
 */


@Transactional(readOnly = true)
public class ChannelServiceImpl implements ChannelService {

    private ChannelRepository channelRepository;
    private FavoriteBlockRepository favoriteBlockRepository;
    private XmlTvRepository xmlTvRepository;
    private XmlFilesUpdateRepository xmlFilesUpdateRepository;



    @Override
    //existence channelIdes
    public Long getCountByParams(Map<String, Object> params) throws InternalErrorException {
        try {
            Long newIptvChannelsCount = channelRepository.getNewCountByParams(params);
            //newIptvChannelsCount += favoriteBlockRepository.getNewCountByParams(params);
            return newIptvChannelsCount;
        } catch (RuntimeException e) {
            throw new InternalErrorException(e);
        }
    }

    @Override
    public List<Long> getIdesByParams(Map<String, Object> params) throws InternalErrorException {
        List<Long> ides = new ArrayList<>(100);
        try {

            ides.addAll(channelRepository.getNewIdesByParams(params));
            if(!CollectionHelper.isEmpty(ides)){
                params.put("notin",ides);
            }


            ///ides.addAll(favoriteBlockRepository.getNewIdesByParams(params));
            return ides;
        } catch (RuntimeException e) {
            throw new InternalErrorException(e);
        }
    }

    @Override
    public Channel getByChannelId(Map<String, Object> params) throws InternalErrorException {
        try {
            return channelRepository.getByChannelIdForMobile(params);
        } catch (RuntimeException e) {
            throw new InternalErrorException(e);
        }
    }
}