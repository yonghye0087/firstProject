package com.home.first.service;

import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.home.first.dao.UserDao;
import com.home.first.dto.UserDto;

@Service
public class UserServiceImpl implements UserService {	
	
	@Inject
	private UserDao userDao;
	
	@Override
	public void create(UserDto UserDto) throws Exception {
		userDao.create(UserDto);		
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
	public List<UserDto> listAll() throws Exception {		
		return userDao.listAll();
	}
	
	@Override
	public boolean login(UserDto UserDto) throws Exception {				 
		String LoginID = UserDto.getId();
		String LoginPW = UserDto.getPw();
		String UserID = userDao.read(LoginID).getId();
		String UserPW = userDao.read(LoginID).getPw();
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
}
	


