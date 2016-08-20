package kr.co.thinkpattern.controller;

import java.io.UnsupportedEncodingException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.thinkpattern.vo.NoticeBoardVO;
import kr.co.thinkpattern.dto.Pagination;
import kr.co.thinkpattern.service.NoticeBoardService;

@Controller
@RequestMapping("/notice/*")
public class NoticeBoardController {
	
	@Inject
	NoticeBoardService service;
	
	@RequestMapping(value ="/list", method = RequestMethod.GET)
	public String list(Model model, Pagination pagination) throws Exception {
		
		pagination.setRecordCount(service.selectCount(pagination));
		model.addAttribute("list", service.selectPage(pagination));

		return "notice/list";
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String create(Model model, Pagination pagination) throws Exception {

		return "notice/create";
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(HttpServletRequest request,Model model, Pagination pagination, NoticeBoardVO noticeBoardVO) throws Exception {
		//HttpSession session = request.getSession();
		// 세션처리 부족 ( 나중에 합칠 떄 주석 풀어주고 key값 설정 바꿔주면 됨.)
		//UserVO user=(UserVO)session.getAttribute("login");
		
		noticeBoardVO.setUserid("bms");
		noticeBoardVO.setCounts(0);
		service.insert(noticeBoardVO);

		return "redirect:/notice/list?" + pagination.getQueryString();
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(Model model, @RequestParam("idx") int idx, Pagination pagination) throws Exception {
		service.updateCounts(idx);
		model.addAttribute("notice", service.selectById(idx));
		return "notice/read";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify(Model model, @RequestParam("idx") int idx, Pagination pagination) {
		model.addAttribute("noticeBoard", service.selectById(idx));
		return "notice/modify";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(Model model, Pagination pagination, NoticeBoardVO noticeBoardVO) throws UnsupportedEncodingException {
		noticeBoardVO.setUserid("bms");
		service.update(noticeBoardVO);
		return "redirect:/notice/read?idx=" + noticeBoardVO.getIdx() + "&" + pagination.getQueryString();
	}
	
	@RequestMapping("/delete")
	public String delete(Model model, @RequestParam("idx") int idx, Pagination pagination) throws UnsupportedEncodingException{
		service.delete(idx);
		return "redirect:/notice/list?" + pagination.getQueryString();
	}
	
}
