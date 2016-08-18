package kr.co.thinkpattern.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.thinkpattern.dao.QnABoardDAO;
import kr.co.thinkpattern.dto.Pagination;
import kr.co.thinkpattern.vo.QnABoardVO;

@Repository
public class QnABoardDAOImpl implements QnABoardDAO{
	
	@Inject
	private SqlSession session;
	private static String namespace ="kr.co.thinkpattern.mappers.QnABoardMapper";

	
	@Override
	public List<QnABoardVO> selectPage(Pagination pagination) throws Exception {
		
		return session.selectList(namespace + ".selectPage",pagination);
	}

	@Override
	public int selectCount(Pagination pagination) throws Exception {
		
		return session.selectOne(namespace + ".selectCount",pagination);
	}

	@Override
	public void insert(QnABoardVO qb) {
		
		session.insert(namespace + ".insert",qb);
	}

	@Override
	public QnABoardVO selectById(int idx) {
		 return session.selectOne(namespace + ".selectById",idx);
	}

	@Override
	public void updateCounts(int idx) {
		session.update(namespace +".updateCounts",idx);
	}

	@Override
	public void update(QnABoardVO qb) {
		session.update(namespace +".update", qb);
	}

	@Override
	public void delete(int idx) {
		session.delete(namespace +".delete",idx);
	}

}
