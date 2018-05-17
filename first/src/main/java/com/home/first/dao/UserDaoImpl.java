package com.home.first.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.home.first.dto.UserDto;

@Repository
public class UserDaoImpl implements UserDao{
	
	@Inject
	private SqlSession sqlSession;
	
	private static String NS="com.home.first.mapper.userMapper";
	
	@Override
	public boolean create(UserDto userDto) throws Exception {
		boolean result = false;
		try {
			sqlSession.insert(NS+".createUser", userDto);
			result = true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;	
	}

	@Override
	public UserDto read(String id) throws Exception {		
		return sqlSession.selectOne(NS+".readUser", id);	
	}

	@Override
	public void update(UserDto userDto) throws Exception {
		sqlSession.update(NS+".updateUser", userDto);
		
	}

	@Override
	public void delete(UserDto userDto) throws Exception {
		sqlSession.delete(NS+".deleteUser", userDto);
		
	}

	@Override
	public List<UserDto> listAll(int level) throws Exception {
		return sqlSession.selectList(NS+".listAllUser", level);
	}

}
