package kr.co.thinkpattern.dao;

import java.util.List;

import kr.co.thinkpattern.dto.LoginDTO;
import kr.co.thinkpattern.vo.UserVO;

public interface UserDAO {
	
	public void insertUser(UserVO vo);
	
	public UserVO selectId(String id);
	
	public UserVO loginUser(LoginDTO dto) throws Exception;
	
	public int checkLogin(String id);
	
	public void modifyUser(UserVO vo);
	
	public void deleteUser(String id);
	
	public List<String> userList();
	
}
