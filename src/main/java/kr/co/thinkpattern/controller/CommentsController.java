package kr.co.thinkpattern.controller;

import java.io.UnsupportedEncodingException;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.thinkpattern.service.CommentsService;
import kr.co.thinkpattern.service.QnABoardService;
import kr.co.thinkpattern.vo.CommentsVO;

@Controller
@RequestMapping("/comments/*")
public class CommentsController {
	
	@Inject
	CommentsService commentsService;
	
	@Inject
	QnABoardService service;
	
	@RequestMapping("/delete")
	public String delete(Model model, int idx, int board_idx) throws Exception {
		commentsService.delete(idx, board_idx);
		
		service.updateCounts(idx);
		model.addAttribute("qna", service.selectById(board_idx));
		model.addAttribute("commentslist", commentsService.listAll(board_idx));
		
		return "redirect:/qna/read?idx="+board_idx;
	}
	
	@RequestMapping(value="/insert", method = RequestMethod.POST)
	public String insert(Model model, CommentsVO comments) throws Exception {
		
		commentsService.insert(comments);
		model.addAttribute("qna", service.selectById(comments.getBoard_idx()));
		model.addAttribute("commentslist", commentsService.listAll(comments.getBoard_idx()));
		
		return "redirect:/qna/read?idx="+comments.getBoard_idx();
	}
}
