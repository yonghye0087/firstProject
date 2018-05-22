package com.home.first.service;

import java.util.List;

import com.home.first.dto.UserDto;

public interface UserService {
	public boolean create(UserDto UserDto) throws Exception;
	public UserDto read(String id) throws Exception;
	public void modify(UserDto UserDto) throws Exception;
	public void remove(UserDto UserDto) throws Exception;
	public List<UserDto> listAll(int level) throws Exception;
	public boolean login(UserDto UserDto) throws Exception;
}
