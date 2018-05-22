package com.home.first.service;

import java.util.List;

import com.home.first.dto.CommentDto;

public interface CommentService {
	public void commentRegist(CommentDto commentDto) throws Exception;
	public List<CommentDto> commentRead(Integer board_idx) throws Exception;
	public void commentModify(CommentDto commentDto) throws Exception;
	public void commentDelete(Integer comment_idx) throws Exception;
	public List<CommentDto> commentCheck(Integer comment_idx) throws Exception;
}
