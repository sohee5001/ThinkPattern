package kr.co.thinkpattern;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.thinkpattern.service.UserService;
import kr.co.thinkpattern.vo.Email;
import kr.co.thinkpattern.vo.UserVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class testEmail {

	
	@Inject
	UserService service;
	
	@Test
	public void testInsertUser() throws Exception
	{
		UserVO vo = new UserVO();
		vo.setId("test123");
		vo.setEmail("great0417@naver.com");
		vo.setName("송희엽");
		
		UserVO findVO = service.selectId(vo.getId());
		System.out.println(vo.getId() + " " + vo.getEmail() +  " " + vo.getName());
		System.out.println(findVO.getId() +  " " + findVO.getEmail() + " " + findVO.getName());
		
		
		System.out.println(findVO.getPassword());
		
		
		if(findVO.getEmail().equals(vo.getEmail()))
		{
			if(findVO.getName().equals(vo.getName()))
			{
				Email email = new Email();
				System.out.println("요기까지 되었다!!!");
				email.setContent("비밀번호는" + findVO.getPassword() + "입니다");
				email.setReceiver(findVO.getEmail());
				email.setSubject(findVO.getName() + "님 비밀번호 찾기 메일입니다.");
				System.out.println("요기까지 되었다!!!");
				
				System.out.println(email.getContent());
				System.out.println(email.getReceiver());
				System.out.println(email.getSubject());
				
				System.out.println("=====================");
				
				
				service.SendMail(email);
			}
			
		}
	}
}
