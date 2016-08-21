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

import kr.co.thinkpattern.dto.Pagination;
import kr.co.thinkpattern.service.CommentsService;
import kr.co.thinkpattern.service.QnABoardService;
import kr.co.thinkpattern.vo.QnABoardVO;

@Controller
@RequestMapping("/qna/*")
public class QnABoardController {
	
	@Inject
	QnABoardService service;
	
	@Inject
	CommentsService commentsService;
	
	@RequestMapping("/list")
	public String list(Model model, Pagination pagination) throws Exception {
		
		pagination.setRecordCount(service.selectCount(pagination));
		model.addAttribute("list", service.selectPage(pagination));

		return "qna/list";
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String create(Model model, Pagination pagination) throws Exception {

		return "qna/create";
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(HttpServletRequest request,Model model, Pagination pagination, QnABoardVO qnaBoardVO) throws Exception {
		HttpSession session = request.getSession();
		// 세션처리 부족 ( 나중에 합칠 떄 주석 풀어주고 key값 설정 바꿔주면 됨.)
		//UserVO user=(UserVO)session.getAttribute("login");
		
		qnaBoardVO.setUserid("bms");
		qnaBoardVO.setCounts(0);
		service.insert(qnaBoardVO);

		return "redirect:/qna/list?" + pagination.getQueryString();
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(Model model, @RequestParam("idx") int idx, Pagination pagination) throws Exception {
		service.updateCounts(idx);
		model.addAttribute("qna", service.selectById(idx));
		model.addAttribute("commentslist", commentsService.listAll(idx));
		
		return "qna/read";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify(Model model, @RequestParam("idx") int idx, Pagination pagination) {
		model.addAttribute("qnaBoard", service.selectById(idx));
		return "qna/modify";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(Model model, Pagination pagination, QnABoardVO qnaBoardVO) throws UnsupportedEncodingException {
		qnaBoardVO.setUserid("bms");
		service.update(qnaBoardVO);
		return "redirect:/qna/read?idx=" + qnaBoardVO.getIdx() + "&" + pagination.getQueryString();
	}
	
	@RequestMapping("/delete")
	public String delete(Model model, @RequestParam("idx") int idx, Pagination pagination) throws UnsupportedEncodingException{
		service.delete(idx);
		return "redirect:/qna/list?" + pagination.getQueryString();
	}
	
}
