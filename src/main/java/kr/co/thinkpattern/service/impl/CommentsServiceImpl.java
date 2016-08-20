package kr.co.thinkpattern.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.thinkpattern.dao.CommentsDAO;
import kr.co.thinkpattern.service.CommentsService;
import kr.co.thinkpattern.vo.CommentsVO;

@Service
public class CommentsServiceImpl implements CommentsService{
	
	@Inject
	CommentsDAO dao;
	
	@Override
	public int insert(CommentsVO vo) {
		return dao.insert(vo);
	}

	@Override
	public int delete(Integer idx, Integer board_idx) {
		return dao.delete(idx, board_idx);
	}

	@Override
	public List<CommentsVO> listAll(Integer board_idx) {
		return dao.listAll(board_idx);
	}

}
