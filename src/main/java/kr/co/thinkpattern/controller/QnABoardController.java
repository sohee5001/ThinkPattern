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
import kr.co.thinkpattern.vo.UserVO;

@Controller
@RequestMapping("/qna/*")
public class QnABoardController {
	
	@Inject
	QnABoardService service;
	
	@Inject
	CommentsService commentsService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(HttpSession session,Model model, Pagination pagination) throws Exception {
		UserVO user = (UserVO) session.getAttribute("login");
		model.addAttribute("user", user);
		pagination.setRecordCount(service.selectCount(pagination));
		model.addAttribute("list", service.selectPage(pagination));

	}
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public void createGET(HttpSession session, Model model, Pagination pagination) throws Exception {
		UserVO user = (UserVO) session.getAttribute("login");
		model.addAttribute("user", user);
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String createPOST(Model model, Pagination pagination, QnABoardVO board) throws Exception {
		service.insert(board);
		return "redirect:/qna/list?" + pagination.getQueryString();
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(HttpSession session, Model model, @RequestParam("idx") int idx, Pagination pagination) throws Exception {
		service.updateCounts(idx);
		model.addAttribute("qna", service.selectById(idx));
		model.addAttribute("commentslist", commentsService.listAll(idx));
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(Model model, @RequestParam("idx") int idx, Pagination pagination, HttpSession session) {
		model.addAttribute("board", service.selectById(idx));
		
		UserVO user = (UserVO)session.getAttribute("login");
		model.addAttribute("user", user);
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(Model model, Pagination pagination, QnABoardVO board) throws UnsupportedEncodingException {
		service.update(board);
		return "redirect:/qna/read?idx=" + board.getIdx() + "&" + pagination.getQueryString();
	}
	
	@RequestMapping("/delete")
	public String delete(Model model, @RequestParam("idx") int idx, Pagination pagination) throws UnsupportedEncodingException{
		service.delete(idx);
		return "redirect:/qna/list?" + pagination.getQueryString();
	}
	
}
