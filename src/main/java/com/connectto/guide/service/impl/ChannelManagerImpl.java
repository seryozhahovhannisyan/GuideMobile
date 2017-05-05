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
import com.connectto.guide.service.ChannelManager; 
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by Seryozha Hovhaniisyan on 2015-02-09 16:36:41.
 */


@Transactional(readOnly = true)
public class ChannelManagerImpl implements ChannelManager {

    private ChannelRepository channelRepository;
    private FavoriteBlockRepository favoriteBlockRepository;
    private XmlTvRepository xmlTvRepository;
    private XmlFilesUpdateRepository xmlFilesUpdateRepository;

    @Override
    public List<ChannelCategory> getIptvChannelCategories(Map<String, Object> params) throws InternalErrorException {
        try {
            return null;//channelRepository.getIptvChannelCategories(params);
        } catch (RuntimeException e) {
            throw new InternalErrorException(e);
        }
    }

    @Override
    public List<IPTVLanguage> getIPTVLanguages(Map<String, Object> params) throws InternalErrorException {
        try {
            return null;//channelRepository.getIPTVLanguages(params);
        } catch (RuntimeException e) {
            throw new InternalErrorException(e);
        }
    }

    @Override
    //existence channelIdes
    public Integer getNewCountByParams(Map<String, Object> params) throws InternalErrorException {
        try {
            Integer newIptvChannelsCount = channelRepository.getNewCountByParams(params);
            //newIptvChannelsCount += favoriteBlockRepository.getNewCountByParams(params);
            return newIptvChannelsCount;
        } catch (RuntimeException e) {
            throw new InternalErrorException(e);
        }
    }

    @Override
    public List<Integer> getNewIdesByParams(Map<String, Object> params) throws InternalErrorException {
        List<Integer> ides = new ArrayList<>(100);
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
    public Channel getByChannelIdForMobile(Map<String, Object> params) throws InternalErrorException {
        try {
            return channelRepository.getByChannelIdForMobile(params);
        } catch (RuntimeException e) {
            throw new InternalErrorException(e);
        }
    }


    private List<Integer> get_xml_files_updates_types(XmlFilesUpdate firstXmlFilesUpdate, Date client_schedule_updated_date) {

        Date server_dates_for_russian_files = firstXmlFilesUpdate.getRussianFile();
        Date server_dates_for_usa_files = firstXmlFilesUpdate.getUsaFile();

        List<Integer> ret_value = new ArrayList<Integer>();

        if (client_schedule_updated_date == null) {
            client_schedule_updated_date = new Date(System.currentTimeMillis());
        }

        if (client_schedule_updated_date.compareTo(server_dates_for_russian_files) < 0)
            ret_value.add(1);

        if (client_schedule_updated_date.compareTo(server_dates_for_usa_files) < 0)
            ret_value.add(2);

        return ret_value;
    }
}