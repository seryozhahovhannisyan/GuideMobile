package com.connectto.guide.repository;

import com.connectto.guide.common.exception.InternalErrorException;
import com.connectto.guide.common.util.QueryConstant;
import com.connectto.guide.common.util.QueryParam;

import java.util.List;
import java.util.Map;

/**
 * Created by Arthur on 7/13/2016.
 */
public interface ContainerCustomRepository<T, Long> {

    List<T> getByParams(String fields, String table, List<QueryParam> queryParams, Map tail) throws InternalErrorException;

    Long getCountByParams(String id, String table, List<QueryParam> queryParams) throws InternalErrorException;

}
