package com.home.first.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.home.first.dto.NovelDto;

@Repository
public class NovelDaoImpl implements NovelDao {
	
	@Inject
	private SqlSession sqlSession;
	
	int noOfRecords;
	
	private static String NS ="com.home.first.mapper.novelMapper";
	
	@Override
	public void create(NovelDto novelDto) throws Exception {
		sqlSession.insert(NS+".createNovel", novelDto);
		
	}

	@Override
	public List<NovelDto> readByTl(int offset, int noOfRecords, String novel_title) throws Exception {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("offset", offset);
		params.put("noOfRecords", noOfRecords);
		params.put("novel_title", novel_title);
		return sqlSession.selectList(NS+".novelListByDesc", params);
	}

	@Override
	public void update(NovelDto novelDto) throws Exception {
		sqlSession.update(NS+".updateNovel", novelDto);
	}

	@Override
	public void delete(Integer novel_idx) throws Exception {
		sqlSession.delete(NS+".deleteNovel", novel_idx);
	}
	@Override
	public void deleteByTl(String novel_title) throws Exception {
		sqlSession.delete(NS+".deleteNovelByTl", novel_title);
	}
	@Override
	public int count(String novel_title) throws Exception {	
		return sqlSession.selectOne(NS+".novelCount", novel_title);
	}

	@Override
	public List<NovelDto> readListByTl(int offset, int noOfRecords) throws Exception {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("offset", offset);
		params.put("noOfRecords", noOfRecords);
		return sqlSession.selectList(NS+".novelListByTl", params);
	}

	@Override
	public int listCount() throws Exception {
		return sqlSession.selectOne(NS+".novelListCount");
	}

	
}
