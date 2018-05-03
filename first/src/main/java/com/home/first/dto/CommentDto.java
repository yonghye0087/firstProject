package com.home.first.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CommentDto {
	private int comment_idx;
	private int board_idx;
	private String id;
	private String comment_content;
	
	@JsonFormat(pattern="yyyy-MM-dd hh:mm:ss")
	private Date comment_date;
	
	public int getComment_idx() {
		return comment_idx;
	}
	public void setComment_idx(int comment_idx) {
		this.comment_idx = comment_idx;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
	@Override
	public String toString() {
		return "CommentDto [comment_idx=" + comment_idx + ", board_idx=" + board_idx + ", id=" + id
				+ ", comment_content=" + comment_content + ", comment_date=" + comment_date + "]";
	}
}
