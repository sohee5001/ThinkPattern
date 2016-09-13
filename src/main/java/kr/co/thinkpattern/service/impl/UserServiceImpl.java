package kr.co.thinkpattern.service.impl;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.co.thinkpattern.dao.UserDAO;
import kr.co.thinkpattern.dto.LoginDTO;
import kr.co.thinkpattern.service.UserService;
import kr.co.thinkpattern.vo.Email;
import kr.co.thinkpattern.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	
	@Inject
	protected JavaMailSender mailSender;
	
	@Inject
	UserDAO dao;

	@Override
	public void SendMail(Email email)throws Exception
	{
		MimeMessage msg = mailSender.createMimeMessage();
        try {
            msg.setSubject(email.getSubject());
            msg.setText(email.getContent());
            msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver()));
           
        }catch(MessagingException e) {
            System.out.println("MessagingException");
            e.printStackTrace();
        }
        try {
            mailSender.send(msg);
        }catch(MailException e) {
            System.out.println("MailException발생");
            e.printStackTrace();
        }
    }
		
		
		
	
	
	
	
	@Override
	public void insertUser(UserVO vo) {
		// TODO Auto-generated method stub
		dao.insertUser(vo);
	}

	@Override
	public UserVO selectId(String id) {
		// TODO Auto-generated method stub
		return dao.selectId(id);
	}

	@Override
	public UserVO loginUser(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.loginUser(dto);
	}

	@Override
	public int checkLogin(String id) {
		// TODO Auto-generated method stub
		return dao.checkLogin(id);
	}

	@Override
	public void modifyUser(UserVO vo) {
		// TODO Auto-generated method stub
		dao.modifyUser(vo);
	}

	@Override
	public void deleteUser(String id) {
		// TODO Auto-generated method stub
		dao.deleteUser(id);
	}
	
	
	
	
	
}
