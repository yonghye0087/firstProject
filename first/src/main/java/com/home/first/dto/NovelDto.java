package com.home.first.dto;

import java.util.Date;

public class NovelDto {
	
	private int novel_idx;
	private String novel_title;
	private String novel_id;
	private String novel_content;
	private Date novel_date;
	private int novel_chapter;
	private int novel_hit;
	private String novel_subtitle;
	private int novel_visibility;

	public int getNovel_idx() {
		return novel_idx;
	}
	public void setNovel_idx(int novel_idx) {
		this.novel_idx = novel_idx;
	}
	public String getNovel_title() {
		return novel_title;
	}
	public void setNovel_title(String novel_title) {
		this.novel_title = novel_title;
	}
	public String getNovel_id() {
		return novel_id;
	}
	public void setNovel_id(String novel_id) {
		this.novel_id = novel_id;
	}
	public String getNovel_content() {
		return novel_content;
	}
	public void setNovel_content(String novel_content) {
		this.novel_content = novel_content;
	}
	public Date getNovel_date() {
		return novel_date;
	}
	public void setNovel_date(Date novel_date) {
		this.novel_date = novel_date;
	}
	public int getNovel_chapter() {
		return novel_chapter;
	}
	public void setNovel_chapter(int novel_chapter) {
		this.novel_chapter = novel_chapter;
	}
	
	public int getNovel_hit() {
		return novel_hit;
	}
	public void setNovel_hit(int novel_hit) {
		this.novel_hit = novel_hit;
	}
	public String getNovel_subtitle() {
		return novel_subtitle;
	}
	public void setNovel_subtitle(String novel_subtitle) {
		this.novel_subtitle = novel_subtitle;
	}
	
	public int getNovel_visibility() {
		return novel_visibility;
	}
	public void setNovel_visibility(int novel_visibility) {
		this.novel_visibility = novel_visibility;
	}
	@Override
	public String toString() {
		return "NovelDto [novel_idx=" + novel_idx + ", novel_title=" + novel_title + ", novel_id=" + novel_id
				+ ", novel_content=" + novel_content + ", novel_date=" + novel_date + ", novel_chapter=" + novel_chapter
				+ ", novel_hit=" + novel_hit + ", novel_subtitle=" + novel_subtitle + ", novel_visibility="
				+ novel_visibility + ", getNovel_idx()=" + getNovel_idx() + ", getNovel_title()=" + getNovel_title()
				+ ", getNovel_id()=" + getNovel_id() + ", getNovel_content()=" + getNovel_content()
				+ ", getNovel_date()=" + getNovel_date() + ", getNovel_chapter()=" + getNovel_chapter()
				+ ", getNovel_hit()=" + getNovel_hit() + ", getNovel_subtitle()=" + getNovel_subtitle()
				+ ", getNovel_visibility()=" + getNovel_visibility() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
}
