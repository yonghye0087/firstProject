package com.home.first.dto;

import java.util.Date;

public class BoardDto {
	private int board_idx;
	private String board_title;
	private String board_content;
	private String id;
	private int board_hit;
	private Date board_date;
	private String board_category;
	private String board_link;
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBoard_hit() {
		return board_hit;
	}
	public void setBoard_hit(int board_hit) {
		this.board_hit = board_hit;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	public String getBoard_category() {
		return board_category;
	}
	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}
	public String getBoard_link() {
		return board_link;
	}
	public void setBoard_link(String board_link) {
		this.board_link = board_link;
	}
	@Override
	public String toString() {
		return "BoardDto [board_idx=" + board_idx + ", board_title=" + board_title + ", board_content=" + board_content
				+ ", id=" + id + ", board_hit=" + board_hit + ", board_date=" + board_date + ", board_category="
				+ board_category + ", board_link=" + board_link + "]";
	}
}
