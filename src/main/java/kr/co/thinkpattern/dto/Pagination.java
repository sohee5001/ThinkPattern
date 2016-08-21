package kr.co.thinkpattern.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

public class Pagination {
	int currentPage = 1;
	int pageSize = 10;
	int recordCount;
	int srchType;
	String srchText = "";

	public int getSrchType() {
		return srchType;
	}

	public void setSrchType(int srchType) {
		this.srchType = srchType;
	}

	public String getSrchText() {
		return srchText;
	}

	public void setSrchText(String srchText) {
		this.srchText = srchText;
	}


	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getRecordCount() {
		return recordCount;
	}

	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}

	/* query stringê³? ê°™ì? ?´ë¦„ì˜ ë©”ì†Œ?“œ?“¤ êµ¬í˜„ */ public int getPg() {
		return currentPage;
	}

	public void setPg(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getSz() {
		return pageSize;
	}

	public void setSz(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getSs() {
		return srchType;
	}

	public void setSs(int srchType) {
		this.srchType = srchType;
	}

	public String getSt() {
		return srchText;
	}

	public void setSt(String srchText) {
		this.srchText = srchText;
	}

	/* ë©¤ë²„ ë³??ˆ˜ ê°’ë“¤?„ quey string?œ¼ë¡? ì¶œë ¥?•˜ê¸? ?œ„?•œ ë©”ì†Œ?“œ */ 
	public String getQueryString() throws UnsupportedEncodingException {
		String temp = (srchText == null) ? "" : URLEncoder.encode(srchText, "UTF-8");
		return String.format("pg=%d&sz=%d&ss=%d&st=%s", currentPage, pageSize, srchType, temp);
	}

	/* ?™”ë©? ?•˜?‹¨?— ?˜?´ì§? ë²ˆí˜¸ ë§í¬?“¤?„ ì¶œë ¥?•˜ê¸? ?œ„?•œ ë©”ì†Œ?“œ?? ?´?˜?Š¤ */
	public List<Page> getPageList() {
		ArrayList<Page> list = new ArrayList<Page>();
		int pageCount = (recordCount + pageSize - 1) / pageSize;
		int basePage = ((currentPage - 1) / 10) * 10;
		if (basePage > 0)
			list.add(new Page("Prev", basePage));
		for (int i = 1; i <= 10 && basePage + i <= pageCount; ++i)
			list.add(new Page(basePage + i, currentPage == basePage + i));
		if (basePage + 11 <= pageCount)
			list.add(new Page("Next", basePage + 11));
		return list;
	}

	public class Page {
		String label;
		int number;
		String cssClass;

		public Page(int number, boolean active) {
			this.label = "" + number;
			this.number = number;
			this.cssClass = active ? "active" : "";
		}

		public Page(String label, int number) {
			this.label = label;
			this.number = number;
			this.cssClass = "";
		}

		public Object getLabel() {
			return label;
		}

		public int getNumber() {
			return number;
		}

		public String getCssClass() {
			return cssClass;
		}
	}
}