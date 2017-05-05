package com.connectto.guide.service;

import com.connectto.guide.common.exception.DataNotFoundException;
import com.connectto.guide.common.exception.InternalErrorException;
import com.connectto.guide.entity.XmlTv;

import java.util.List;
import java.util.Map;

public interface XmlTvService {

    public XmlTv getById(long id) throws InternalErrorException, DataNotFoundException;

    public List<XmlTv> getByParamsForMobile(Map<String, Object> params) throws InternalErrorException;

}