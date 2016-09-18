package kr.co.thinkpattern.dao;

import java.util.List;

import kr.co.thinkpattern.vo.PatternVO;

public interface PatternDAO {
	
	public List<PatternVO> listAll();
	public PatternVO read(String p_name);
}
