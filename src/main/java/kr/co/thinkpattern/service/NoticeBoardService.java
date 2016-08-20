package kr.co.thinkpattern.service;

import java.util.List;

import kr.co.thinkpattern.dto.Pagination;
import kr.co.thinkpattern.vo.NoticeBoardVO;

public interface NoticeBoardService {
	
	List<NoticeBoardVO> selectPage(Pagination pagination) throws Exception;

	int selectCount(Pagination pagination) throws Exception;

	void insert(NoticeBoardVO nb);

	public NoticeBoardVO selectById(int idx);

	public void updateCounts(int idx);

	public void update(NoticeBoardVO nb);

	public void delete(int idx);
}
