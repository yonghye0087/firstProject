package com.home.first.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.home.first.dao.BoardDao;
import com.home.first.dto.BoardDto;

@Service
public class BoardServiceImpl implements BoardService{
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Inject
	private BoardDao boardDao;	
	
	@Override
	public void regist(BoardDto board,  HttpSession session) throws Exception {
		String id = (String) session.getAttribute("LoginID");
		board.setId(id);
		logger.info(board.toString());
		boardDao.create(board);
	}
	@Override
	public BoardDto read(Integer idx) throws Exception {
		boardDao.hitCount(idx);
		return boardDao.read(idx);
	}
	@Override
	public void modify(BoardDto board) throws Exception {
		logger.info(board.toString());
		boardDao.update(board);
		
	}
	@Override
	public void remove(Integer idx) throws Exception {
		boardDao.delete(idx);
		
	}
	@Override
	public List<BoardDto> listAll() throws Exception {
		return boardDao.listAll();
	}
	@Override
	public String currentTime() throws Exception{
		String currentTime = boardDao.currentTime().substring(11, 19);
		return currentTime;
	}
	@Override
	public String currentDay() throws Exception{
		String currentDay = boardDao.currentTime().substring(0, 10);
		return currentDay;
	}
	@Override
	public String dataDay() throws Exception {
		SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String curruntDay = null;
		List<BoardDto> t = boardDao.listAll();
		for(BoardDto tm : t) {
			Date today = tm.getBoard_date();
			curruntDay = SDF.format(today).substring(0, 10);
		}
		return curruntDay;
	}
	@Override
	public String dataTime() throws Exception {
		SimpleDateFormat SDF = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String curruntDay = null;
		List<BoardDto> t = boardDao.listAll();
		for(BoardDto tm : t) {
			Date today = tm.getBoard_date();
			curruntDay = SDF.format(today).substring(11, 19);
		}
		return curruntDay;
	}
	@Override
	public List<BoardDto> boardList(int offset, int noOfRecords) throws Exception {
		return boardDao.boardList(offset, noOfRecords);
	}
	@Override
	public int boardGetCount() throws Exception {
		return boardDao.boardGetcount();
	}
}
