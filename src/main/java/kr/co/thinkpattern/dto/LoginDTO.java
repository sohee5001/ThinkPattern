package kr.co.thinkpattern.dto;

public class LoginDTO {
	private String uid;
	private String upw;

	/*
	 * ������� ���⼭ useCookie�� �� ����ϼ�����.. cookie�� Ȱ����� �� �ǹ̸� �� ��Ȯ��
	 * ������ �� �ʿ䰡 ������.
	 */
	private boolean useCookie;
	private String invite;

	public String getInvite() {
		return invite;
	}

	public void setInvite(String invite) {
		this.invite = invite;
	}

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
