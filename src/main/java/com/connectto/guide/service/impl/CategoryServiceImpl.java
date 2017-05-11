package com.connectto.guide.service.impl;

import com.connectto.guide.common.exception.InternalErrorException;
import com.connectto.guide.common.util.QueryConstant;
import com.connectto.guide.common.util.QueryParam;
import com.connectto.guide.entity.ChannelCategory;
import com.connectto.guide.repository.CategoryRepository;
import com.connectto.guide.repository.ContainerCustomRepository;
import com.connectto.guide.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.LinkedList;
import java.util.List;

@Service
@Transactional(readOnly = true)
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryRepository  repository;

    @Override
    public List<ChannelCategory> getIptvChannelCategories(int partitionId) throws InternalErrorException {
        List<QueryParam> queryParams = new LinkedList<>();
        queryParams.add(new QueryParam("partition_id", new Integer[]{0, partitionId}, QueryConstant.CONTAINS));
        queryParams.add(new QueryParam("deleted", 0, QueryConstant.EQUAL));

        try {
            return repository.getByPartitionIdAndDeleted(partitionId);
        } catch (RuntimeException e) {
            throw new InternalErrorException(e);
        }
    }
}