package model;

import java.sql.Date;

public class BoardDTO {
	private String no;
	private String email;
	private String title;
	private String content;
	private String hitCount;
	private String heartCount;
	private java.sql.Date postDate;
	
	public BoardDTO() {}
	public BoardDTO(String no, String email, String title, String content, String hitCount, String heartCount,
			Date postDate) {
		this.no = no;
		this.email = email;
		this.title = title;
		this.content = content;
		this.hitCount = hitCount;
		this.heartCount = heartCount;
		this.postDate = postDate;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getHitCount() {
		return hitCount;
	}
	public void setHitCount(String hitCount) {
		this.hitCount = hitCount;
	}
	public String getHeartCount() {
		return heartCount;
	}
	public void setHeartCount(String heartCount) {
		this.heartCount = heartCount;
	}
	public java.sql.Date getPostDate() {
		return postDate;
	}
	public void setPostDate(java.sql.Date postDate) {
		this.postDate = postDate;
	}
	
}
