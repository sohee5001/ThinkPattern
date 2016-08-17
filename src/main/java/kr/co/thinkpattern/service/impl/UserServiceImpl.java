package kr.co.thinkpattern.service.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.thinkpattern.dao.UserDAO;
import kr.co.thinkpattern.service.UserService;
import kr.co.thinkpattern.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	UserDAO dao;

	@Override
	public void insertUser(UserVO vo) {
		// TODO Auto-generated method stub
		dao.insertUser(vo);
	}

	@Override
	public UserVO selectId(String id) {
		// TODO Auto-generated method stub
		return dao.selectId(id);
	}

	@Override
	public UserVO loginUser(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.loginUser(vo);
	}

	@Override
	public int checkLogin(String id) {
		// TODO Auto-generated method stub
		return dao.checkLogin(id);
	}

	@Override
	public void modifyUser(UserVO vo) {
		// TODO Auto-generated method stub
		dao.modifyUser(vo);
	}

	@Override
	public void deleteUser(String id) {
		// TODO Auto-generated method stub
		dao.deleteUser(id);
	}
	
	
	
	
	
}
