package kr.co.thinkpattern.dao.impl;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.thinkpattern.dao.UserDAO;
import kr.co.thinkpattern.vo.UserVO;


@Repository
public class UserDAOImpl implements UserDAO{
	
	@Inject
	SqlSession sqlsession;
	
	private static final String namesapce = "kr.co.thinkpattern.mapper.UserMapper";	
	
	
	@Override
	public void insertUser(UserVO vo) {
		// TODO Auto-generated method stub
		sqlsession.insert(namesapce+".insertUser", vo); 
	}

	@Override
	public UserVO selectId(String id) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namesapce + ".selectUser", id);
	}

	@Override
	public UserVO loginUser(UserVO vo) throws Exception {
		// TODO Auto-generated method stub

		return sqlsession.selectOne(namesapce +".loginUser", vo);
	}

	@Override
	public int checkLogin(String id) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(namesapce+".checkLogin", id);
	}

	@Override
	public void modifyUser(UserVO vo) {
		// TODO Auto-generated method stub
		sqlsession.update(namesapce + ".modifyUser", vo);
		
	}

	@Override
	public void deleteUser(String id) {
		// TODO Auto-generated method stub
		sqlsession.delete(namesapce + ".deleteUser", id);
	}

}
