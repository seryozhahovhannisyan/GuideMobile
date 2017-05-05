package com.connectto.guide.service;

import com.connectto.guide.common.exception.InternalErrorException;
import com.connectto.guide.entity.Channel;
import com.connectto.guide.entity.ChannelCategory;
import com.connectto.guide.entity.IPTVLanguage;

import java.util.List;
import java.util.Map;

/**
 * Created by Seryozha Hovhaniisyan on 2015-02-09 16:36:41.
 */


public interface ChannelManager {

    public Channel getByChannelIdForMobile(Map<String, Object> params) throws InternalErrorException;

    public List<ChannelCategory> getIptvChannelCategories(Map<String, Object> params) throws InternalErrorException;

    public List<IPTVLanguage> getIPTVLanguages(Map<String, Object> params) throws InternalErrorException;

    public Integer getNewCountByParams(Map<String, Object> params) throws InternalErrorException;//

    public List<Integer> getNewIdesByParams(Map<String, Object> params) throws InternalErrorException;


}