package com.connectto.guide.repository;

import com.connectto.guide.common.exception.InternalErrorException;
import com.connectto.guide.common.util.QueryConstant;
import com.connectto.guide.common.util.QueryParam;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Arthur on 7/13/2016.
 */
//@Repository
public interface ContainerCustomRepository<T, Long> {

    List<T> getByParams(String fields, String table, List<QueryParam> queryParams, Map tail) throws InternalErrorException;

    List<T> getByParams(String query) throws InternalErrorException;

    List<Long> getIdesByParams(String query) throws InternalErrorException;

    Long getCountByParams(String id, String table, List<QueryParam> queryParams) throws InternalErrorException;

    Long getCountByParams(String query) throws InternalErrorException;

}
