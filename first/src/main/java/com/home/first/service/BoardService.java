package com.home.first.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.home.first.dto.BoardDto;

public interface BoardService {
	public void regist(BoardDto board,  HttpSession session) throws Exception;
	public BoardDto read(Integer idx) throws Exception;
	public void modify(BoardDto board) throws Exception;
	public void remove(Integer idx) throws Exception;
	public List<BoardDto> listAll() throws Exception;
	//날짜 분류
	public String currentTime() throws Exception;
	public String currentDay() throws Exception;
	public String dataDay() throws Exception;
	public String dataTime() throws Exception;
	//페이징
	public List<BoardDto> boardList(int offset, int noOfRecords) throws Exception;
	public int boardGetCount() throws Exception;
	
	public List<BoardDto> boardSearch(String text,int offset, int noOfRecords) throws Exception;
	public int boardSearchCount(String text) throws Exception;
}
