package com.home.first.dto;

public class UserDto {
	private int no;
	private String id;
	private String pw;
	private String email;
	private String hint;
	private int level;
	private String signdate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
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
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getSigndate() {
		return signdate;
	}
	public void setSigndate(String signdate) {
		this.signdate = signdate;
	}
	@Override
	public String toString() {
		return "UserDto [no=" + no + ", id=" + id + ", pw=" + pw + ", email=" + email + ", hint=" + hint + ", level="
				+ level + ", signdate=" + signdate + "]";
	}
}
