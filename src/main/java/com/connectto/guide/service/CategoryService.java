package com.connectto.guide.service;

import com.connectto.guide.common.exception.InternalErrorException;
import com.connectto.guide.entity.ChannelCategory;

import java.util.List;

/**
 * Created by Seryozha Hovhaniisyan on 2015-02-09 16:36:41.
 */


public interface CategoryService {

    public List<ChannelCategory> getIptvChannelCategories(int partitionId) throws InternalErrorException;

}