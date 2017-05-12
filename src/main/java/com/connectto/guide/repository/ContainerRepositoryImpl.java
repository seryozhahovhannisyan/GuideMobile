package com.connectto.guide.repository;

import com.connectto.guide.common.exception.InternalErrorException;
import com.connectto.guide.common.util.QueryParam;
import com.connectto.guide.common.util.QueryUtil;
import com.connectto.guide.entity.Channel;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;
import java.util.Map;

/**
 * Created by Arthur on 7/13/2016.
 */
@Repository
public class ContainerRepositoryImpl  implements ContainerCustomRepository<Channel, Long> {

    private static Logger logger = Logger.getLogger(ContainerRepositoryImpl.class);

    @PersistenceContext
    private EntityManager em;

    @Override
    public List<Channel> getByParams(String fields, String table, List<QueryParam> queryParams, Map tail) throws InternalErrorException {
        try {
            String queryString = QueryUtil.buildQuery(fields, table, queryParams, tail);
            Query query = em.createNativeQuery(queryString);
            return query.getResultList();
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            throw new InternalErrorException(e);
        }
    }

    @Override
    public List<Channel> getByParams(String queryString) throws InternalErrorException {
        try {
            Query query = em.createNativeQuery(queryString);
            return query.getResultList();
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            throw new InternalErrorException(e);
        }
    }

    @Override
    public List<Long> getIdesByParams(String queryString) throws InternalErrorException {
        try {
            Query query = em.createNativeQuery(queryString);
            return query.getResultList();
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            throw new InternalErrorException(e);
        }
    }

    @Override
    public Long getCountByParams(String id, String table, List<QueryParam> queryParams) throws InternalErrorException {
        try {
            String queryString = QueryUtil.buildCountQuery(id, table, queryParams);
            Query query = em.createNativeQuery(queryString);
//            BigInteger count = (BigInteger) query.getSingleResult();
//            return count == null ? 0l :  count.longValue();
            return (Long)query.getSingleResult();
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            throw new InternalErrorException(e);
        }
    }

    @Override
    public Long getCountByParams(String queryString) throws InternalErrorException {
        try {
            Query query = em.createNativeQuery(queryString);
//            BigInteger count = (BigInteger) query.getSingleResult();
//            return count == null ? 0 : count.longValue();
            return (Long)query.getSingleResult();
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            throw new InternalErrorException(e);
        }
    }
}
