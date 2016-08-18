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

import kr.co.thinkpattern.dto.LoginDTO;
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
		System.out.println("check��~~~~~~");
		System.out.println("id�� <<<<<<<<>>>>>>>>>" + id + "<><><><<>");
		int check = service.checkLogin(id);
		System.out.println("result �� <<<<<<<<<<>>>>>>>>>>>" + check);
		return service.checkLogin(id);
	}
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void loginGET(UserVO user, Model model) throws Exception {
		logger.info("<<<login get>>>");
		
	}

	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model) throws Exception
	{
		UserVO vo = service.loginUser(dto);

		if(vo==null)
		{
			return;
		}
		model.addAttribute("userVO", vo);
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session, Model model)
	{
		session.invalidate();
		return "redirect:/";
		
	}
	
	
	@RequestMapping(value="/modifyConfirm", method=RequestMethod.GET)
	public void modifyConfirmGET(UserVO user, Model model, HttpSession session) throws Exception {
		logger.info("<<<join get>>>");
		UserVO vo = (UserVO) session.getAttribute("login");
		model.addAttribute("id", vo.getId());
	}
	
	
	 //public void read(@RequestParam("idx") Integer idx, Model model, HttpSession session) throws Exception {
	
	
	@RequestMapping(value="/modifyConfirm", method=RequestMethod.POST)
	public String modifyConfrimPOST(@RequestParam("password") String passowrd, Model model, HttpSession session, RedirectAttributes rttr)
	{
		UserVO vo = (UserVO)session.getAttribute("login");
		if(vo.getPassword().equals(passowrd))
		{
			rttr.addFlashAttribute("result", "confirmsuccess");
			return "redirect:/user/modify";
		}
		else
		{
			rttr.addFlashAttribute("result", "confirmfail");
			return "redirect:/user/modifyConfirm";
		}
		
	}
	
	
	
	
	
	
	
	
}
