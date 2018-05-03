package com.home.first.dao;

import java.util.List;

import com.home.first.dto.CommentDto;

public interface CommentDao {
	public void commentCreate(CommentDto commentDto) throws Exception;
	public List<CommentDto> commentRead(Integer board_idx) throws Exception;
	public void commentUpdate(CommentDto commentDto) throws Exception;
	public void commentDelete(Integer comment_idx) throws Exception;
	public List<CommentDto> commentCheck(Integer comment_idx) throws Exception;
}
