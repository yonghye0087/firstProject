package com.home.first.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.home.first.dao.CommentDao;
import com.home.first.dto.CommentDto;

@Service
public class CommentServiceImpl implements CommentService {
	private static final Logger logger = LoggerFactory.getLogger(CommentServiceImpl.class);
	
	@Inject
	private CommentDao commentDao;
	
	@Override
	public void commentRegist(CommentDto commentDto) throws Exception {
		logger.info(commentDto.toString());
		commentDao.commentCreate(commentDto);
	}

	@Override
	public List<CommentDto> commentRead(Integer board_idx) throws Exception {
		logger.info(board_idx.toString());
		List<CommentDto> commentList = commentDao.commentRead(board_idx);
		return commentDao.commentRead(board_idx);
	}

	@Override
	public void commentModify(CommentDto commentDto) throws Exception {
		logger.info(commentDto.toString());
		commentDao.commentUpdate(commentDto);
	}

	@Override
	public void commentDelete(Integer comment_idx) throws Exception {
		logger.info(comment_idx.toString());
		commentDao.commentDelete(comment_idx);
	}

	@Override
	public List<CommentDto> commentCheck(Integer comment_idx) throws Exception {
		return commentDao.commentCheck(comment_idx);
	}

}
