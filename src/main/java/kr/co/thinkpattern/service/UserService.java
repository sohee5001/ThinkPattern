package kr.co.thinkpattern.service;

import kr.co.thinkpattern.dto.LoginDTO;
import kr.co.thinkpattern.vo.Email;
import kr.co.thinkpattern.vo.UserVO;

public interface UserService {
	public void insertUser(UserVO vo);
	
	public UserVO selectId(String id);
	
	public UserVO loginUser(LoginDTO dto) throws Exception;
	
	public int checkLogin(String id);
	
	public void modifyUser(UserVO vo);
	
	public void deleteUser(String id);

	public void SendMail(Email email) throws Exception;
	
}
