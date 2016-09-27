package kr.co.thinkpattern.controller;

import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.thinkpattern.vo.UserVO;

@Controller
public class InviteController {
	@RequestMapping(value = "/invite", method = RequestMethod.GET)
	public String inviteGet(Model model, RedirectAttributes rttr, HttpServletRequest request, HttpSession session) throws Exception {
		
		UserVO vo = (UserVO)session.getAttribute("login");
		String queryString = URLDecoder.decode(request.getQueryString(), "UTF-8");
		
		if(vo == null)
		{
			model.addAttribute("vo", vo);
			rttr.addFlashAttribute("inviteurl", queryString);
			rttr.addFlashAttribute("result", "inviteLogin");
		}else{
			model.addAttribute("vo", vo);
			rttr.addFlashAttribute("inviteurl", queryString);
			rttr.addFlashAttribute("result", "move_node");
		}

		return "redirect:/";
		
	}
}
