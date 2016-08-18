package kr.co.thinkpattern.vo;

import java.util.Date;

public class QnABoardVO {
	
	private int idx;
	private String title;
	private String contents;
	private int counts;
	private Date crea_dtm;
	private String userid;
	private String file_name;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getCounts() {
		return counts;
	}
	public void setCounts(int counts) {
		this.counts = counts;
	}
	public Date getCrea_dtm() {
		return crea_dtm;
	}
	public void setCrea_dtm(Date crea_dtm) {
		this.crea_dtm = crea_dtm;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	
}
