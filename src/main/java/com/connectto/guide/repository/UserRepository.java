package com.connectto.guide.repository;

import com.connectto.guide.common.exception.InternalErrorException;
import com.connectto.guide.entity.User;

//@Repository
public interface UserRepository {//<> extends JpaRepository<T, Long> {

//    @Modifying
//    @Query("SELECT u, a.account_id , a.session_id , a.login_key FROM User u LEFT JOIN account a LEFT JOIN user_account ua on ua.account_id = a.id  WHERE u.id = ua.user_id AND a.session_id =:sessionId ")
    public User getBySessionId(//@Param("sessionId")
                                       String sessionId)  throws InternalErrorException;

}