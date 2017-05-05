package com.connectto.guide.repository;

import com.connectto.guide.common.exception.InternalErrorException;
import com.connectto.guide.common.util.QueryConstant;
import com.connectto.guide.common.util.QueryParam;
import com.connectto.guide.common.util.QueryUtil;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.math.BigInteger;
import java.util.List;
import java.util.Map;

/**
 * Created by Arthur on 7/13/2016.
 */
@Repository
public class ContainerRepositoryImpl implements ContainerCustomRepository<Object, Long> {

    private static Logger logger = Logger.getLogger(ContainerRepositoryImpl.class);

    @PersistenceContext
    private EntityManager em;

    @Override
    public List<Object> getByParams(String fields, String table, List<QueryParam> queryParams, Map tail) throws InternalErrorException {
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
    public Long getCountByParams(String id, String table, List<QueryParam> queryParams) throws InternalErrorException {
        try {
            String queryString = QueryUtil.buildCountQuery(id, table, queryParams);
            Query query = em.createNativeQuery(queryString);
            BigInteger count = (BigInteger) query.getSingleResult();
            return count == null ? 0 : count.longValue();
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            throw new InternalErrorException(e);
        }
    }
}
