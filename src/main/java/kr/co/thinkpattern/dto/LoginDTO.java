package kr.co.thinkpattern.dto;

public class LoginDTO {
	private String uid;
	private String upw;
	
	/*
	 * 강사님이 여기서 useCookie는 왜 사용하셨을까.. 
	 * cookie의 활용법과 그 의미를 좀 명확히 다져야 할 필요가 있을듯.
	 * */
	private boolean useCookie;
	
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUpw() {
		return upw;
	}
	public void setUpw(String upw) {
		this.upw = upw;
	}
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	

}
