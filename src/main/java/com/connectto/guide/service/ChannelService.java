package com.connectto.guide.service;

import com.connectto.guide.common.exception.InternalErrorException;
import com.connectto.guide.entity.Channel;

import java.util.List;
import java.util.Map;

/**
 * Created by Seryozha Hovhaniisyan on 2015-02-09 16:36:41.
 */


public interface ChannelService {

    public Channel getByChannelId(Map<String, Object> params) throws InternalErrorException;

    public Long getCountByParams(Map<String, Object> params) throws InternalErrorException;//

    public List<Long> getIdesByParams(Map<String, Object> params) throws InternalErrorException;


}