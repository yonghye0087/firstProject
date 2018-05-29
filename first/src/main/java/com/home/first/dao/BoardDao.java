package com.home.first.dao;

import java.util.List;

import com.home.first.dto.BoardDto;

public interface BoardDao {
	public void create(BoardDto boardDto) throws Exception;
	public BoardDto read(Integer idx) throws Exception;
	public void update(BoardDto boardDto) throws Exception;
	public void delete(Integer idx) throws Exception;
	
	public String currentTime() throws Exception;
	
	public List<BoardDto> listAll() throws Exception;
	
	public List<BoardDto> boardList(int offset, int noOfRecords) throws Exception; 
	public int boardGetcount() throws Exception;
	
	public void hitCount(Integer idx) throws Exception;
	
	public List<BoardDto> boardSearch(String text,int offset, int noOfRecords) throws Exception;
	public int boardSearchCount(String text) throws Exception;
}
