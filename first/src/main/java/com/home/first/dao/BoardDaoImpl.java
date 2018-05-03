package com.home.first.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.home.first.dto.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	@Inject
	private SqlSession sqlSession;
	
	int noOfRecords;
	
	private static String NS ="com.home.first.mapper.boardMapper";
	
	@Override
	public void create(BoardDto boardDto) throws Exception {
		sqlSession.insert(NS+".create", boardDto);
	}

	@Override
	public BoardDto read(Integer idx) throws Exception {
		return sqlSession.selectOne(NS+".read", idx);
	}

	@Override
	public void update(BoardDto boardDto) throws Exception {
		sqlSession.update(NS+".update", boardDto);	
	}

	@Override
	public void delete(Integer idx) throws Exception {
		sqlSession.delete(NS+".delete", idx);
		
	}

	@Override
	public List<BoardDto> listAll() throws Exception {
		return sqlSession.selectList(NS+".listAll");
	}
	@Override
	public String currentTime() throws Exception{
		return sqlSession.selectOne(NS+".currentTime");
	}

	@Override
	public List<BoardDto> boardList(int offset, int noOfRecords) throws Exception {
		List<BoardDto> boardList = new ArrayList<BoardDto>();
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("offset", offset);
		params.put("noOfRecords", noOfRecords);
		boardList = sqlSession.selectList(NS+".boardListByDesc", params);
		return boardList;
	}

	@Override
	public int boardGetcount() throws Exception {
		return sqlSession.selectOne(NS+".boardGetCount");
	}

	@Override
	public void hitCount(Integer idx) throws Exception {
		sqlSession.selectOne(NS+".updateHit", idx);
		
	}
	
	
}
