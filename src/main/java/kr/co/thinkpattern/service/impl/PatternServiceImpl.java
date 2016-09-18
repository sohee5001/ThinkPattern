package kr.co.thinkpattern.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.thinkpattern.dao.PatternDAO;
import kr.co.thinkpattern.service.PatternService;
import kr.co.thinkpattern.vo.PatternVO;

@Service
public class PatternServiceImpl implements PatternService {

	@Inject
	PatternDAO dao;
	
	@Override
	public List<PatternVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll();
	}

	@Override
	public PatternVO read(String p_name) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(p_name);
	}

}
