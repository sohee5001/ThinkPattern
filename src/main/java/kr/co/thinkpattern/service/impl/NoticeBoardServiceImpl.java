package kr.co.thinkpattern.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.thinkpattern.dao.NoticeBoardDAO;
import kr.co.thinkpattern.dto.Pagination;
import kr.co.thinkpattern.service.NoticeBoardService;
import kr.co.thinkpattern.vo.NoticeBoardVO;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService{
	
	@Inject
	NoticeBoardDAO dao;
	
	@Override
	public List<NoticeBoardVO> selectPage(Pagination pagination) throws Exception {
		return dao.selectPage(pagination);
	}

	@Override
	public int selectCount(Pagination pagination) throws Exception {
		return dao.selectCount(pagination);
	}

	@Override
	public void insert(NoticeBoardVO nb) {
		dao.insert(nb);
	}

	@Override
	public NoticeBoardVO selectById(int idx) {
		return dao.selectById(idx);
	}

	@Override
	public void updateCounts(int idx) {
		dao.updateCounts(idx);
	}

	@Override
	public void update(NoticeBoardVO nb) {
		dao.update(nb);
	}

	@Override
	public void delete(int idx) {
		dao.delete(idx);
	}

}
