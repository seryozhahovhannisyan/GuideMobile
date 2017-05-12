package com.connectto.guide.repository;

import com.connectto.guide.common.exception.InternalErrorException;
import com.connectto.guide.common.exception.ObjectConvertException;
import com.connectto.guide.entity.User;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 * Created by Arthur on 7/13/2016.
 */
@Repository
public class UserRepositoryImpl implements UserRepository {

    private static Logger logger = Logger.getLogger(UserRepositoryImpl.class);

    @PersistenceContext
    private EntityManager em;

    @Override
    public User getBySessionId(String sessionId) throws InternalErrorException {
        String queryString = "SELECT  u.id, u.name, u.surname, u.email, u.partition_id, a.id account_id, a.session_id, a.login_key " +
                "FROM `user` u , account a, user_account ua " +
                "WHERE ua.account_id = a.id AND ua.user_id = u.id " +
                "AND a.session_id = '%s'";
        try {
            queryString = String.format(queryString, sessionId);
            Query query = em.createNativeQuery(queryString);
            return convert(query.getSingleResult());
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            throw new InternalErrorException(e);
        }
    }

    private User convert(Object object) throws ObjectConvertException {

        try {
            Object[] columns = (Object[]) object;
            Long id = ((Integer) columns[0]).longValue();
            String name = (String) columns[1];
            String surname = (String) columns[2];
            String email = (String) columns[3];
            int partitionId = ((Integer) columns[4]).intValue();
            //
            Long accountId = ((Integer) columns[5]).longValue();
            String sessionId = (String) columns[6];
            String loginKey = (String) columns[7];

            return new User(id, name, surname, email, partitionId, accountId, sessionId, loginKey);
        } catch (RuntimeException e) {
            throw new ObjectConvertException(e);
        }

    }

}
