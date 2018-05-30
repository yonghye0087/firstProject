package com.home.first.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class UserDto {
	private int user_no;
	private String user_id;
	private String user_pw;
	private String user_email;
	private String user_hint;
	private int user_level;
	private Date user_date;
	private String user_file_name;
	private int user_file_size;
	private MultipartFile user_file;
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_hint() {
		return user_hint;
	}
	public void setUser_hint(String user_hint) {
		this.user_hint = user_hint;
	}
	public int getUser_level() {
		return user_level;
	}
	public void setUser_level(int user_level) {
		this.user_level = user_level;
	}
	public Date getUser_date() {
		return user_date;
	}
	public void setUser_date(Date user_date) {
		this.user_date = user_date;
	}
	public String getUser_file_name() {
		return user_file_name;
	}
	public void setUser_file_name(String user_file_name) {
		this.user_file_name = user_file_name;
	}
	public int getUser_file_size() {
		return user_file_size;
	}
	public void setUser_file_size(int user_file_size) {
		this.user_file_size = user_file_size;
	}
	public MultipartFile getUser_file() {
		return user_file;
	}
	public void setUser_file(MultipartFile user_file) {
		this.user_file = user_file;
	}
	@Override
	public String toString() {
		return "UserDto [user_no=" + user_no + ", user_id=" + user_id + ", user_pw=" + user_pw + ", user_email="
				+ user_email + ", user_hint=" + user_hint + ", user_level=" + user_level + ", user_date=" + user_date
				+ ", user_file_name=" + user_file_name + ", user_file_size=" + user_file_size + ", user_file="
				+ user_file + "]";
	}
}
