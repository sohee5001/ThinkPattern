package kr.co.thinkpattern.service;

import java.util.List;

import kr.co.thinkpattern.dto.Pagination;
import kr.co.thinkpattern.vo.QnABoardVO;

public interface QnABoardService {

	List<QnABoardVO> selectPage(Pagination pagination) throws Exception;

	int selectCount(Pagination pagination) throws Exception;

	void insert(QnABoardVO qb);

	public QnABoardVO selectById(int idx);

	public void updateCounts(int idx);

	public void update(QnABoardVO qb);

	public void delete(int idx);

}
