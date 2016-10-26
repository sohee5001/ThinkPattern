package kr.co.thinkpattern.controller;

import java.net.URLEncoder;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.thinkpattern.dto.LoginDTO;
import kr.co.thinkpattern.service.UserService;
import kr.co.thinkpattern.vo.Email;
import kr.co.thinkpattern.vo.UserVO;
import java.util.regex.*;
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
	public String joinPOST(@RequestParam("pw2") String pw2, HttpServletResponse response, UserVO user, RedirectAttributes rttr, Model model ) throws Exception
	{
		String special = "[^\"'\\{\\}\\[\\]/?.,;:|\\)\\(*~`!^\\-_+<>@#$%^\\\\=]";
		String number = "[^0-9]";
		String english = "[^a-zA-Z]";
		
		
		
		logger.info("<<<join post>>>");
		int check = service.checkLogin(user.getId());
		if(check == 0)
		{
			if(user.getId().equals(""))
			{
				rttr.addFlashAttribute("result", "joinFail");
				return "redirect:/user/join";
			}
			if(user.getEmail().equals(""))
			{
				rttr.addFlashAttribute("result", "joinFail");
				return "redirect:/user/join";
			}
			if(user.getName().equals(""))
			{
				rttr.addFlashAttribute("result", "joinFail");
				return "redirect:/user/join";
			}
			if(user.getPassword().equals(""))
			{
				rttr.addFlashAttribute("result", "joinFail");
				return "redirect:/user/join";
			}
			if(!user.getPassword().equals(pw2))
			{
				rttr.addFlashAttribute("result", "joinFail");
				return "redirect:/user/join";
			}
			if(user.getId().length() <= 4)
			{
				rttr.addFlashAttribute("result", "joinFail");
				return "redirect:/user/join";
			}
			if(user.getPassword().length() <= 4)
			{
				rttr.addFlashAttribute("result", "joinFail");
				return "redirect:/user/join";
			}
			
			
			
			
			
			Pattern p = Pattern.compile("([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])");
			Matcher m = p.matcher(user.getPassword());
			if (m.find()){
			    System.out.println("숫자 문자 특수문자 다 있음");
			}else{
				rttr.addFlashAttribute("result", "joinFail");
				return "redirect:/user/join";
			}

	
			service.insertUser(user);
			model.addAttribute("nullVO", user);
			rttr.addFlashAttribute("result", "joinseccess");
			return "redirect:/";
			
		}
		else
		{
			rttr.addFlashAttribute("result", "joinFail");
			return "redirect:/user/join";
		}
	}
	
	@RequestMapping(value="/check", method=RequestMethod.POST)
	public @ResponseBody int checkPOST(@RequestParam("id") String id) throws Exception{
		System.out.println("check��~~~~~~");
		System.out.println("id�� <<<<<<<<>>>>>>>>>" + id + "<><><><<>");
		if(id.equals(""))
		{
			return 3;
		}

		int check = service.checkLogin(id);
		
	
		System.out.println("result �� <<<<<<<<<<>>>>>>>>>>>" + check);
		return service.checkLogin(id);
	}
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginGET(Model model, RedirectAttributes rttr, HttpSession session) throws Exception {
		
		logger.info("<<<login get>>>");
		UserVO vo = (UserVO)session.getAttribute("login");
		if(vo == null)
		{
			rttr.addFlashAttribute("result", "needLogin");
		}
		
		return "redirect:/";
		
	}

	@RequestMapping(value="/loginPost", method=RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model, RedirectAttributes rttr) throws Exception
	{
		String invite = dto.getInvite();
		
		UserVO vo = service.loginUser(dto);
		
		
		if(vo==null)
		{
			rttr.addFlashAttribute("result", "loginFail");
			//return;
		}else{
			vo.setInvite(invite);
		}
		
		if(invite.equals("")){
//			model.addAttribute("userVO", vo);
			
		}else{
			rttr.addFlashAttribute("inviteurl", invite);
			rttr.addFlashAttribute("result", "move_node");
//			return "redirect:http://127.0.0.1:8210/temp?id="+invite;
		}
		model.addAttribute("userVO", vo);
//		return "redirect:/";
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
		model.addAttribute("vo", vo);
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
	
	
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modifyGET(Model model, HttpSession session)
	{
		UserVO vo = (UserVO) session.getAttribute("login");
		model.addAttribute("vo", vo);
	}
	
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(UserVO vo, Model model, HttpSession session,RedirectAttributes rttr)
	{
		UserVO original = (UserVO)session.getAttribute("login");

		
		if(vo.getEmail().equals(""))
		{
			vo.setEmail(original.getEmail());
		}
		if(vo.getName().equals(""))
		{
			vo.setName(original.getName());
		}
		if(vo.getPassword().equals(""))
		{
			vo.setPassword(original.getEmail());
		}

		
		
		service.modifyUser(vo);
		session.setAttribute("login", vo);
		
		
		
		rttr.addFlashAttribute("result", "confirmfail");
		return "redirect:/";
	}
	
	
	
	
	
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public void deleteGET(Model model, HttpSession session,RedirectAttributes rttr)
	{
		System.out.println("=====================");
	
		System.out.println("=====================");
		UserVO vo = (UserVO) session.getAttribute("login");
		
		
		service.deleteUser(vo.getId());
		session.invalidate();
	}
	
	
	
	@RequestMapping(value="/sendmail", method=RequestMethod.GET)
	public void sendMailGet(UserVO user, Model model) throws Exception {
		
			
	}
	
/*	@RequestMapping(value="/sendmail", method=RequestMethod.POST)
	public String sendMailPost(UserVO vo, Model model,RedirectAttributes rttr) throws Exception
	{
		
		
		UserVO findVO = service.selectId(vo.getId());

		
		
		
		
		if(findVO.getEmail().equals(vo.getEmail()))
		{
			if(findVO.getName().equals(vo.getName()))
			{
				Email email = new Email();;
				email.setContent("비밀번호는" + findVO.getPassword() + "입니다");
				email.setReceiver(findVO.getEmail());
				email.setSubject(findVO.getName() + "님 비밀번호 찾기 메일입니다.");
							
				service.SendMail(email);
				rttr.addFlashAttribute("result", "emailSuccess");
			}
			else
			{
				rttr.addFlashAttribute("result", "emailNameFail");
			}
			
		}
		else
		{
			rttr.addFlashAttribute("result", "emailEmailFail");
		}
		
		
		return "redirect:/";
	}*/
	
/*	@RequestMapping(value="/sendmail", method=RequestMethod.POST)
	public String sendMailPost(String vo, Model model,RedirectAttributes rttr, String usermail) throws Exception
	{
		
		UserVO user = service.selectId(vo);
		Email email = new Email();;
		email.setContent("초대받은 방의 주소는 http://192.168.0.11:8210/lobby/?id=" + user.getName() + " 입니다");
		email.setReceiver(usermail);
		email.setSubject("[ThinkPattern] "+user.getName() + "님의 초대메일입니다.");
							
		service.SendMail(email);
		rttr.addFlashAttribute("result", "emailSuccess");
		
		return "redirect:/";
	}*/
	
	@RequestMapping(value="/createroom", method=RequestMethod.POST)
	public String createRoomPost(@RequestParam("room") String room , Model model, RedirectAttributes rttr, HttpServletRequest request, HttpSession session) throws Exception{
		
		String arr[] = request.getParameterValues("user_email");
		String p_name = URLEncoder.encode(request.getParameter("pattern_name"), "UTF-8");
		
		UserVO vo = (UserVO) session.getAttribute("login");
		String user_name = URLEncoder.encode(vo.getName(), "UTF-8");
		
		if(arr != null){
			for(int i=0; i < arr.length ; i++){
				Email email = new Email();
				email.setReceiver(arr[i]);
				email.setSubject("[ThinkPattern] Welcome to Design Patterns!!");
//				email.setContent("<a href='http://127.0.0.1:8210/temp?room='"+room+" target='_blank' title='ThinkPattern'>이동하기</a>");
				email.setContent("http://localhost:8081/invite?room="+room);
				
				service.SendMail(email);
			}
		}
		
		String room_name = URLEncoder.encode(room, "UTF-8");
		
		return "redirect:http://localhost:8210/temp?room="+room_name+"&id="+user_name+"&pattern="+p_name;
	}
	
	
	@RequestMapping(value="/loginFail", method=RequestMethod.GET)
	public void loginFail()
	{
	
	}
	
}
