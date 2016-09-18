package kr.co.thinkpattern.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.thinkpattern.dao.PatternDAO;
import kr.co.thinkpattern.vo.PatternVO;

@Repository
public class PatternDAOImpl implements PatternDAO {
	
	@Inject
	SqlSession sqlSession;
	private static String namespace="kr.co.thinkpattern.mappers.PatternMapper";

	@Override
	public List<PatternVO> listAll() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".listAll");
	}

	@Override
	public PatternVO read(String p_name) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".read", p_name);
	}
}
