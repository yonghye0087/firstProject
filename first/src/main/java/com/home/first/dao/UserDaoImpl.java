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
	public UserDto read(String user_id) throws Exception {
		return sqlSession.selectOne(NS+".readUser", user_id);	
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
	public List<UserDto> listAll(int user_level) throws Exception {
		return sqlSession.selectList(NS+".listAllUser", user_level);
	}

	@Override
	public int lvUpdate(UserDto userDto) throws Exception {
		return sqlSession.update(NS+".updateUserLv", userDto);
	}

	@Override
	public UserDto readByNo(int user_no) throws Exception {
		return sqlSession.selectOne(NS+".userReadByNo", user_no);
	}

}
