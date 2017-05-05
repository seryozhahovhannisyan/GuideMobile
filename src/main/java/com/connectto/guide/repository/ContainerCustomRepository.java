package com.connectto.guide.repository;

import com.connectto.guide.common.exception.InternalErrorException;

import java.util.List;
import java.util.Map;

/**
 * Created by Arthur on 7/13/2016.
 */
public interface ContainerCustomRepository<T, Long> {

    List<T> getByParams(String table, Map queryMap, String operator) throws InternalErrorException;

    Long getCountByParams(String table, Map queryMap, String operator) throws InternalErrorException;

}
