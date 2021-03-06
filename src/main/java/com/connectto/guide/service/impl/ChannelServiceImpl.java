package com.connectto.guide.service.impl;

import com.connectto.guide.common.exception.InternalErrorException;
import com.connectto.guide.common.util.DataConverter;
import com.connectto.guide.common.util.QueryUtil;
import com.connectto.guide.entity.Channel;
import com.connectto.guide.entity.FavoriteBlock;
import com.connectto.guide.repository.ChannelRepository;
import com.connectto.guide.repository.ContainerCustomRepository;
import com.connectto.guide.repository.FavoriteBlockRepository;
import com.connectto.guide.service.ChannelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Seryozha Hovhaniisyan on 2015-02-09 16:36:41.
 */

@Service
@Transactional(readOnly = true)
public class ChannelServiceImpl implements ChannelService {

    @Autowired
    private ChannelRepository channelRepository;

    @Autowired
    private FavoriteBlockRepository favoriteBlockRepository;

    @Autowired
    private ContainerCustomRepository repository;


    @Override
    //existence channelIdes
    public Long getCountByParams(Map<String, Object> params) throws InternalErrorException {

        StringBuilder queryBuilder = QueryUtil.buildIPTVChannel("count(c.channel_id)", params);

        try {
            Long newIptvChannelsCount = (Long) repository.getCountByParams(queryBuilder.toString());
            if (params.containsKey("channelUpdateDate")) {
                queryBuilder = QueryUtil.buildIPTVFavoriteBlock("count(ifb.channel_id)", params);
                newIptvChannelsCount += (Long) repository.getCountByParams(queryBuilder.toString());
            }

            return newIptvChannelsCount;
        } catch (RuntimeException e) {
            throw new InternalErrorException(e);
        }
    }

    @Override
    public List<Long> getIdesByParams(Map<String, Object> params) throws InternalErrorException {
        List<Long> ides = new ArrayList<>(100);
        try {
            StringBuilder queryBuilder = QueryUtil.buildIPTVChannel("c.channel_id", params);
            queryBuilder.append("order by c.channel_number");

            ides.addAll((List<Long>) repository.getIdesByParams(queryBuilder.toString()));

            if (params.containsKey("channelUpdateDate")) {
                queryBuilder = QueryUtil.buildIPTVFavoriteBlock("ifb.channel_id", params);
                queryBuilder.append(String.format(" and ifb.channel_id not in (%s)", DataConverter.join(ides, ",")));
                ides.addAll((List<Long>) repository.getIdesByParams(queryBuilder.toString()));
            }

            return ides;
        } catch (RuntimeException e) {
            throw new InternalErrorException(e);
        }
    }

    @Override
    public Channel getByChannelId(Long channelId, Long userId ) throws InternalErrorException {
        try {
            Channel channel = channelRepository.findOne(channelId);
            List<FavoriteBlock> favoriteBlock = favoriteBlockRepository.getByUserIdAndChannelId(userId, channelId);
//            channel.setFavoriteBlock(favoriteBlock);
            return channel ;
        } catch (RuntimeException e) {
            throw new InternalErrorException(e);
        }
    }
}