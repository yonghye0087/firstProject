package com.home.first.dao;

import java.util.List;

import com.home.first.dto.UserDto;

public interface UserDao {
	public boolean create(UserDto userDto) throws Exception;
	public UserDto read(String id) throws Exception;
	public void update(UserDto userDto) throws Exception;
	public void delete(UserDto userDto) throws Exception;
	public List<UserDto> listAll(int level) throws Exception;
}
