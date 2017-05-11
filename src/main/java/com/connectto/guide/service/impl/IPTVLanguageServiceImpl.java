package com.connectto.guide.service.impl;

import com.connectto.guide.common.exception.InternalErrorException;
import com.connectto.guide.common.util.CollectionHelper;
import com.connectto.guide.common.util.QueryConstant;
import com.connectto.guide.common.util.QueryParam;
import com.connectto.guide.entity.Channel;
import com.connectto.guide.entity.ChannelCategory;
import com.connectto.guide.entity.IPTVLanguage;
import com.connectto.guide.entity.XmlFilesUpdate;
import com.connectto.guide.repository.*;
import com.connectto.guide.service.IPTVLanguageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * Created by Seryozha Hovhaniisyan on 2015-02-09 16:36:41.
 */

@Service
@Transactional(readOnly = true)
public class IPTVLanguageServiceImpl implements IPTVLanguageService {


    @Autowired
    private IPTVLanguageRepository repository;


    @Override
    public List<IPTVLanguage> getIPTVLanguages(int partitionId) throws InternalErrorException {

        List<QueryParam> queryParams = new LinkedList<>();
        queryParams.add(new QueryParam("partition_id", partitionId, QueryConstant.EQUAL));
        queryParams.add(new QueryParam("deleted", 0, QueryConstant.EQUAL));

        try {
            return repository.getByPartitionId(partitionId);
        } catch (RuntimeException e) {
            throw new InternalErrorException(e);
        }
    }
}