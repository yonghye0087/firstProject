package com.home.first.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class NovelProfileDto {
	private int novel_title_idx;
	private String novel_title;
	private String novel_id;
	private String novel_img_name;
	private int novel_img_size;
	private String novel_nickname;
	private int novel_visibility;
	private MultipartFile novel_file;
	public int getNovel_title_idx() {
		return novel_title_idx;
	}
	public void setNovel_title_idx(int novel_title_idx) {
		this.novel_title_idx = novel_title_idx;
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
	public String getNovel_img_name() {
		return novel_img_name;
	}
	public void setNovel_img_name(String novel_img_name) {
		this.novel_img_name = novel_img_name;
	}
	public int getNovel_img_size() {
		return novel_img_size;
	}
	public void setNovel_img_size(int novel_img_size) {
		this.novel_img_size = novel_img_size;
	}
	public String getNovel_nickname() {
		return novel_nickname;
	}
	public void setNovel_nickname(String novel_nickname) {
		this.novel_nickname = novel_nickname;
	}
	public MultipartFile getNovel_file() {
		return novel_file;
	}
	public void setNovel_file(MultipartFile novel_file) {
		this.novel_file = novel_file;
	}
	public int getNovel_visibility() {
		return novel_visibility;
	}
	public void setNovel_visibility(int novel_visibility) {
		this.novel_visibility = novel_visibility;
	}
	@Override
	public String toString() {
		return "NovelProfileDto [novel_title_idx=" + novel_title_idx + ", novel_title=" + novel_title + ", novel_id="
				+ novel_id + ", novel_img_name=" + novel_img_name + ", novel_img_size=" + novel_img_size
				+ ", novel_nickname=" + novel_nickname + ", novel_file=" + novel_file + "]";
	}
}
