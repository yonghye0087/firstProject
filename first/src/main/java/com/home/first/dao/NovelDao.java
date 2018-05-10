package com.home.first.dao;

import java.util.List;

import com.home.first.dto.NovelDto;

public interface NovelDao {
	public void create(NovelDto novelDto) throws Exception;
	public List<NovelDto> readByTl(int offset, int noOfRecords,String novel_title) throws Exception;
	public List<NovelDto> readListByTl(int offset, int noOfRecords) throws Exception;
	public void update(NovelDto novelDto) throws Exception;
	public void delete(Integer novel_idx) throws Exception;
	public void deleteByTl(String novel_title) throws Exception;
	public int count(String novel_title) throws Exception;
	public int listCount() throws Exception;
}
