package com.home.first.dao;

import java.util.List;

import com.home.first.dto.UserDto;

public interface UserDao {
	public boolean create(UserDto userDto) throws Exception;
	public UserDto read(String user_id) throws Exception;
	public void update(UserDto userDto) throws Exception;
	public void delete(UserDto userDto) throws Exception;
	public List<UserDto> listAll(int user_level) throws Exception;
	public int lvUpdate(UserDto userDto) throws Exception;
	public UserDto readByNo(int user_no) throws Exception;
}
