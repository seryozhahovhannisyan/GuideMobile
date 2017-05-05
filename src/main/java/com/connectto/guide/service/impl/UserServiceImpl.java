package com.connectto.guide.service.impl;


import com.connectto.guide.config.SessionUser;
import com.connectto.guide.controller.UserController;
import com.connectto.guide.entity.User;
import com.connectto.guide.service.UserService;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Garik on 4/30/16.
 */
@Service
public class UserServiceImpl implements UserService {

    /**
     * retrieve user's data to complete authentication
     */
    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {

        return new SessionUser(UserController.find("12"));
    }

    @Override 
    public User add(User user) throws Exception {
         return UserController.find("12");
    }

    @Override
    public User getByID(Long id) throws Exception {
        return UserController.find("12");
    } 

    @Override
    public List<User> getList(int page) throws Exception {
        return UserController.getUsers();
    }

    @Override
    public User edit(User user) throws Exception {
        return UserController.find("12");
    }

    @Override
    public void delete(User user) throws Exception {
    }
}