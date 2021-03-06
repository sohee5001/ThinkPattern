package kr.co.thinkpattern.service;

import java.util.List;

import kr.co.thinkpattern.vo.PatternVO;

public interface PatternService {
	
	public List<PatternVO> listAll() throws Exception;
	public PatternVO read(String p_name) throws Exception;
}
