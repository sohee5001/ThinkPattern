package kr.co.thinkpattern.controller;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.thinkpattern.vo.UserVO;

@Controller
public class InviteController {
	@RequestMapping(value = "/invite", method = RequestMethod.GET)
	public String inviteGet(Model model, RedirectAttributes rttr, HttpServletRequest request, HttpSession session) throws Exception {
		
		UserVO vo = (UserVO)session.getAttribute("login");
		String queryString = request.getQueryString();
		queryString = new String(queryString.getBytes("8859_1"), "KSC5601");//http://88oy.tistory.com/223 참고 / 웹에서 KSC5601 로 보내는걸 서블릿에선 ISO-8859-1 로 인식해서 인코딩함 /
		// 쿼리스트링값을 ISO-8859-1 바이트코드배열로 추출하여 다시 KSC5601 로 디코딩함

		if(vo == null)
		{
			model.addAttribute("vo", vo);
			rttr.addFlashAttribute("inviteurl", queryString);
			rttr.addFlashAttribute("result", "inviteLogin");
		}else{
			model.addAttribute("vo", vo);
			rttr.addFlashAttribute("inviteurl", queryString);
			rttr.addFlashAttribute("node_user", vo.getName());
			rttr.addFlashAttribute("result", "move_node");
		}

		return "redirect:/";
		
	}
}
