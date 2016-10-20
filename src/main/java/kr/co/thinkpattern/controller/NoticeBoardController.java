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
import kr.co.thinkpattern.vo.UserVO;
import kr.co.thinkpattern.dto.Pagination;
import kr.co.thinkpattern.service.NoticeBoardService;

@Controller
@RequestMapping("/notice/*")
public class NoticeBoardController {
	
	@Inject
	NoticeBoardService service;
	
	@RequestMapping(value ="/list", method = RequestMethod.GET)
	public void list(Model model, Pagination pagination, HttpSession session) throws Exception {
		UserVO user = (UserVO) session.getAttribute("login");
		model.addAttribute("vo", user);
		System.out.println(pagination.getPageSize() + " : 페이지네이션");
		System.out.println("service.selectPage(pagenation)은!!!!");

		pagination.setRecordCount(service.selectCount(pagination));
		model.addAttribute("list", service.selectPage(pagination));
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public void createGET(HttpSession session, Model model, Pagination pagination) throws Exception {
		UserVO user = (UserVO)session.getAttribute("login");
		model.addAttribute("vo", user);
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(HttpServletRequest request,Model model, Pagination pagination, NoticeBoardVO board) throws Exception {
		service.insert(board);
		return "redirect:/notice/list?" + pagination.getQueryString();
	}
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(HttpSession session, Model model, @RequestParam("idx") int idx, Pagination pagination) throws Exception {
		service.updateCounts(idx);
		
		UserVO user = (UserVO)session.getAttribute("login");
		model.addAttribute("vo", user);
		
		model.addAttribute("notice", service.selectById(idx));
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(Model model, @RequestParam("idx") int idx, Pagination pagination, HttpSession session) {
		model.addAttribute("board", service.selectById(idx));
		
		UserVO user = (UserVO)session.getAttribute("login");
		model.addAttribute("vo", user);
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(Model model, Pagination pagination, NoticeBoardVO board) throws UnsupportedEncodingException {
		service.update(board);
		return "redirect:/notice/read?idx=" + board.getIdx() + "&" + pagination.getQueryString();
	}
	
	@RequestMapping("/delete")
	public String delete(Model model, @RequestParam("idx") int idx, Pagination pagination) throws UnsupportedEncodingException{
		service.delete(idx);
		return "redirect:/notice/list?" + pagination.getQueryString();
	}
	
}
