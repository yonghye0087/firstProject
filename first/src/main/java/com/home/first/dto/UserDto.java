package com.home.first.dto;

public class UserDto {
	private String id;
	private String pw;
	private String email;
	private String hint;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHint() {
		return hint;
	}
	public void setHint(String hint) {
		this.hint = hint;
	}
	@Override
	public String toString() {
		return "UserDto [id=" + id + ", pw=" + pw + ", email=" + email + ", hint=" + hint + "]";
	}
	
}
