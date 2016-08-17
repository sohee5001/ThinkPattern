package kr.co.thinkpattern.dao;

import kr.co.thinkpattern.vo.UserVO;

public interface UserDAO {
	
	public void insertUser(UserVO vo);
	
	public UserVO selectId(String id);
	
	public UserVO loginUser(UserVO vo) throws Exception;
	
	public int checkLogin(String id);
	
	public void modifyUser(UserVO vo);
	
	public void deleteUser(String id);
	
}
