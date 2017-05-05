package com.connectto.guide.service;

import com.connectto.guide.entity.User;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

/**
 * Created by Garik on 4/30/16.
 */
public interface UserService extends UserDetailsService {

    User add(User user) throws Exception;

    User getByID(Long id) throws  Exception;

    List<User> getList(int page) throws Exception;

    User edit(User user) throws Exception;

    void delete(User user) throws Exception;
}