package com.connectto.guide.entity;

public class User {

	private long id;
	private String name;
    private String address;
    private String email;

    private int partitionId;

    public User() {
    }

    public User(String id, String name, String address, String email) {
        this.id = Long.parseLong(id);
        this.name = name;
        this.address = address;
        this.email = email;
    }

    public User(int id, String name, int address, int email) {
        this.id =   id;
        this.name =""+  name;
        this.address = ""+ address;
        this.email =""+  email;
    }

    public User(User user) {
        id = user.getId();
        email = user.getEmail();
        name = user.getName();
    }

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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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
}
