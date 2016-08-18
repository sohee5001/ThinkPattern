package kr.co.thinkpattern.vo;

import java.util.Date;

public class CommentsVO {
	
	private int idx;
	private int board_idx;
	private Date crea_dtm;
	private String userid;
	private String contents;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
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
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
}
