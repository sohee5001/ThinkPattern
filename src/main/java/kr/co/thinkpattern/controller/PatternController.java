package kr.co.thinkpattern.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.thinkpattern.service.PatternService;
import kr.co.thinkpattern.service.UserService;
import kr.co.thinkpattern.vo.PatternVO;
import kr.co.thinkpattern.vo.UserVO;

@Controller
@RequestMapping("/pattern/*")
public class PatternController {

	@Inject
	PatternService service;
	@Inject
	UserService userservice;
	
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public void list(HttpSession session, Model model) throws Exception {
		model.addAttribute("list", service.listAll());
		model.addAttribute("userList", userservice.userList());
		UserVO user = (UserVO)session.getAttribute("login");

		if(user != null)
		{
			model.addAttribute("vo", user);
		}
	}
	
	@RequestMapping(value="/read", method = RequestMethod.POST)
	public @ResponseBody PatternVO read(String p_name ) throws Exception {
		PatternVO vo = null;
		vo = service.read(p_name);
		return vo;
	}
	
}
