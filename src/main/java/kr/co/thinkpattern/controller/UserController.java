package kr.co.thinkpattern.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.thinkpattern.service.UserService;
import kr.co.thinkpattern.vo.UserVO;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Inject
	UserService service;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void joinGET(UserVO user, Model model) throws Exception {
		logger.info("<<<join get>>>");
		
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinPOST(HttpServletResponse response, UserVO user, RedirectAttributes rttr, Model model ) throws Exception
	{
		logger.info("<<<join post>>>");
		int check = service.checkLogin(user.getId());
		if(check == 0)
		{
			service.insertUser(user);
			model.addAttribute("nullVO", user);
			rttr.addFlashAttribute("result", "joinseccess");
			return "redirect:/";
			
		}
		else
		{
			rttr.addFlashAttribute("result", "joinFail");
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/check", method=RequestMethod.POST)
	public @ResponseBody int checkPOST(@RequestParam("id") String id) throws Exception{
		System.out.println("check´Â~~~~~~");
		System.out.println("id´Â <<<<<<<<>>>>>>>>>" + id + "<><><><<>");
		int check = service.checkLogin(id);
		System.out.println("result ´Â <<<<<<<<<<>>>>>>>>>>>" + check);
		return service.checkLogin(id);
	}

	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public String loginPOST(UserVO vo, HttpSession session, RedirectAttributes rttr, Model model) throws Exception
	{
		UserVO vo1 = service.loginUser(vo);
		if(vo1==null)
		{
			rttr.addFlashAttribute("result", "loginfail");
			return "redirect:/";
		}
		model.addAttribute("userVO", vo);
		
		rttr.addFlashAttribute("result", "loginsuccess");
		return "redirect:/";
		
	}
	
	
}
