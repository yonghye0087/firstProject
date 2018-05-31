package com.home.first.service;

import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.home.first.dao.UserDao;
import com.home.first.dto.UserDto;

@Service
public class UserServiceImpl implements UserService {	
	
	@Inject
	private UserDao userDao;
	
	@Override
	public boolean create(UserDto UserDto) throws Exception {
		UserDto UserDtoCheck = userDao.read(UserDto.getUser_id());
		boolean result = false;
		if(UserDtoCheck == null || UserDtoCheck.equals(null)) {
			userDao.create(UserDto);
			result = true;
		}
		return result;		
	}
	@Override
	public UserDto read(String id) throws Exception {		
		return userDao.read(id);
	}
	@Override
	public void modify(UserDto UserDto) throws Exception {
		userDao.update(UserDto);		
	}
	@Override
	public void remove(UserDto UserDto) throws Exception {
		userDao.delete(UserDto);
	}
	@Override
	public List<UserDto> listAll(int level) throws Exception {		
		return userDao.listAll(level);
	}
	
	@Override
	public boolean login(UserDto UserDto) throws Exception {				 
		String LoginID = UserDto.getUser_id();
		String LoginPW = UserDto.getUser_pw();
		String UserID = userDao.read(LoginID).getUser_id();
		String UserPW = userDao.read(LoginID).getUser_pw();
		boolean resultLogin = false;
		System.out.println(resultLogin);
		if(LoginID.equals(UserID)) {
			System.out.println("ID Success");
			
			if(LoginPW.equals(UserPW)) {
				System.out.println("Password Success");
				resultLogin = true;
				System.out.println(resultLogin);
			}else {
				System.out.println("Password Error");
			}
		} else {
			System.out.println("ID Error");
		}
		return resultLogin;
	}
	@Override
	public boolean lvUpdate(UserDto userDto) throws Exception {
		int result = userDao.lvUpdate(userDto);
		boolean resultType = false;
		if(result != 0) {
			resultType = true;
		}
		return resultType;
	}
	@Override
	public UserDto readByNo(int user_no) throws Exception {
		return userDao.readByNo(user_no);
	}
}
	


