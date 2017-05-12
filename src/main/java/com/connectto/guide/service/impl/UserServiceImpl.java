package com.connectto.guide.service.impl;


import com.connectto.guide.common.exception.InternalErrorException;
import com.connectto.guide.config.SessionUser;
import com.connectto.guide.repository.UserRepository;
import com.connectto.guide.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Garik on 4/30/16.
 */
@Service
@Transactional(readOnly = true)
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository repository;

    /**
     * retrieve user's data to complete authentication
     */
    @Override
    public UserDetails loadUserByUsername(String sessionId) throws UsernameNotFoundException {
        try {
            return new SessionUser(repository.getBySessionId(sessionId));
        } catch (InternalErrorException e) {
            throw new UsernameNotFoundException(e.getMessage());
        }
    }
}