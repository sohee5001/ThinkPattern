package kr.co.thinkpattern.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.thinkpattern.dao.QnABoardDAO;
import kr.co.thinkpattern.dto.Pagination;
import kr.co.thinkpattern.service.QnABoardService;
import kr.co.thinkpattern.vo.QnABoardVO;

@Service
public class QnABoardServiceImpl implements QnABoardService{
	
	@Inject
	QnABoardDAO dao;
	
	@Override
	public List<QnABoardVO> selectPage(Pagination pagination) throws Exception {
		return dao.selectPage(pagination);
	}

	@Override
	public int selectCount(Pagination pagination) throws Exception {
		return dao.selectCount(pagination);
	}

	@Override
	public void insert(QnABoardVO qb) {
		dao.insert(qb);
	}

	@Override
	public QnABoardVO selectById(int idx) {
		return dao.selectById(idx);
	}

	@Override
	public void updateCounts(int idx) {
		dao.updateCounts(idx);
	}

	@Override
	public void update(QnABoardVO qb) {
		dao.update(qb);
	}

	@Override
	public void delete(int idx) {
		dao.delete(idx);
	}

}
