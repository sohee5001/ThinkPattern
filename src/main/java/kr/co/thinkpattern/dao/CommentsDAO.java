package kr.co.thinkpattern.dao;

import java.util.List;

import kr.co.thinkpattern.vo.CommentsVO;

public interface CommentsDAO {

	public int insert(CommentsVO vo);

	public int delete(Integer idx, Integer board_idx);

	public List<CommentsVO> listAll(Integer board_idx);

}
