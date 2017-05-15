package com.connectto.guide.service;

import com.connectto.guide.common.exception.DataNotFoundException;
import com.connectto.guide.common.exception.InternalErrorException;
import com.connectto.guide.entity.XmlTv;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface XmlTvService {

    public XmlTv getBy(long id) throws InternalErrorException, DataNotFoundException;

    public List<XmlTv> getBy(Long channelId, Date startTime, Date stopTime) throws InternalErrorException;

}