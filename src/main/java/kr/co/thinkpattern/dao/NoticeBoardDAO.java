package kr.co.thinkpattern.dao;

import java.util.List;

import kr.co.thinkpattern.dto.Pagination;
import kr.co.thinkpattern.vo.NoticeBoardVO;

public interface NoticeBoardDAO {
	
	List<NoticeBoardVO> selectPage(Pagination pagination) throws Exception;
	
	int selectCount(Pagination pagination) throws Exception;
	
	void insert(NoticeBoardVO nb);

	NoticeBoardVO selectById(int idx);
	
	void updateCounts(int idx);
	
	void update(NoticeBoardVO nb);
	
	void delete(int idx);
	
}
