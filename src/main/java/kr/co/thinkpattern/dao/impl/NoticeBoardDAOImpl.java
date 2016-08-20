package kr.co.thinkpattern.dao.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.thinkpattern.dao.NoticeBoardDAO;
import kr.co.thinkpattern.dto.Pagination;
import kr.co.thinkpattern.vo.NoticeBoardVO;

@Repository
public class NoticeBoardDAOImpl implements NoticeBoardDAO{
	
	@Inject
	private SqlSession session;
	private static String namespace ="kr.co.thinkpattern.mappers.NoticeBoardMapper";
	
	@Override
	public List<NoticeBoardVO> selectPage(Pagination pagination) throws Exception {

		return session.selectList(namespace + ".selectPage",pagination);
	}

	@Override
	public int selectCount(Pagination pagination) throws Exception {
		
		return session.selectOne(namespace + ".selectCount",pagination);
	}

	@Override
	public void insert(NoticeBoardVO nb) {
		
		session.insert(namespace + ".insert",nb);
	}

	@Override
	public NoticeBoardVO selectById(int idx) {
		 return session.selectOne(namespace + ".selectById",idx);
	}

	@Override
	public void updateCounts(int idx) {
		session.update(namespace +".updateCounts",idx);
	}

	@Override
	public void update(NoticeBoardVO nb) {
		session.update(namespace +".update", nb);
	}

	@Override
	public void delete(int idx) {
		session.delete(namespace +".delete",idx);
	}

}
