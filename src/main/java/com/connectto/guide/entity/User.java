package com.connectto.guide.entity;

import javax.persistence.*;

@Entity
@Table(name = "user")
public class User {

    //userData
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

    @Column(name = "name")
    private String name;

    @Column(name = "surname")
    private String surname;

    @Column(name = "email")
    private String email;

    @Column(name = "partition_id")
    private int partitionId;
    //account data
    @Column(name = "account_id")
    private Long currentAccountId;

    @Column(name = "session_id")
    private String sessionId;

    @Column(name = "login_key")
    private String tokenGuide;

    public User() {
    }

    public User(long id,String name, String surname, String email, int partitionId, Long currentAccountId, String sessionId, String tokenGuide) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.partitionId = partitionId;
        this.currentAccountId = currentAccountId;
        this.sessionId = sessionId;
        this.tokenGuide = tokenGuide;
    }

    public User(User user) {
        id = user.getId();
        name = user.getName();
        surname = user.getSurname();
        email = user.getEmail();
        partitionId = user.getPartitionId();
        currentAccountId = user.getCurrentAccountId();
        sessionId = user.getSessionId();
        tokenGuide = user.getTokenGuide();
    }

    /*##################################################################################################################
     *                                  GETTERS & SETTERS
     *##################################################################################################################
     */

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getPartitionId() {
        return partitionId;
    }

    public void setPartitionId(int partitionId) {
        this.partitionId = partitionId;
    }

    public Long getCurrentAccountId() {
        return currentAccountId;
    }

    public void setCurrentAccountId(Long currentAccountId) {
        this.currentAccountId = currentAccountId;
    }

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    public String getTokenGuide() {
        return tokenGuide;
    }

    public void setTokenGuide(String tokenGuide) {
        this.tokenGuide = tokenGuide;
    }
}
