package kr.co.thinkpattern.dao;

import java.util.List;

import kr.co.thinkpattern.dto.Pagination;
import kr.co.thinkpattern.vo.QnABoardVO;

public interface QnABoardDAO {

	List<QnABoardVO> selectPage(Pagination pagination) throws Exception;
	
	int selectCount(Pagination pagination) throws Exception;
	
	void insert(QnABoardVO nb);

	QnABoardVO selectById(int idx);
	
	void updateCounts(int idx);
	
	void update(QnABoardVO nb);
	
	void delete(int idx);
}
