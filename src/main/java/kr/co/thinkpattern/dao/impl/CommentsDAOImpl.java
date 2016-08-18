package kr.co.thinkpattern.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.thinkpattern.dao.CommentsDAO;
import kr.co.thinkpattern.vo.CommentsVO;

@Repository
public class CommentsDAOImpl implements CommentsDAO{
	
	@Inject
	SqlSession sqlSession;
	private static String namespace="kr.co.thinkpattern.mappers.CommentsMapper";
	
	@Override
	public int insert(CommentsVO vo) {
		vo.setUserid("bms");
		sqlSession.insert(namespace +".insertComment", vo);
		return vo.getIdx();
	}

	@Override
	public int delete(Integer idx, Integer board_idx) {
		Map<String, Object>parameterMap = new HashMap<>();
		parameterMap.put("idx", idx);
		parameterMap.put("board_idx", board_idx);
		
		return sqlSession.delete(namespace + ".deleteComment", parameterMap);
	}

	@Override
	public List<CommentsVO> listAll(Integer board_idx) {
		return sqlSession.selectList(namespace+".listAll", board_idx);
	}
	
}
