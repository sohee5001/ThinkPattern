package kr.co.thinkpattern.service;

import java.util.List;

import kr.co.thinkpattern.vo.CommentsVO;

public interface CommentsService {
	
	public int insert(CommentsVO vo);
	
	public int delete(Integer idx, Integer board_idx);
	
	public List<CommentsVO> listAll(Integer board_idx);
	
}
