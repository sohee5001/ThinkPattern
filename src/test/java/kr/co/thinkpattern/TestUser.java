package kr.co.thinkpattern;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.thinkpattern.dao.UserDAO;
import kr.co.thinkpattern.dao.impl.UserDAOImpl;
import kr.co.thinkpattern.vo.UserVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class TestUser {
	
	
	@Inject
	UserDAOImpl dao;
	
/*	@Test
	public void testInsertUser() throws Exception
	{
		UserVO vo = new UserVO();
		vo.setId("root");
		vo.setName("root");
		vo.setPassword("root");
		vo.setEmail("master@naver.com");
		
		dao.insertUser(vo);
	}*/
	
	

	/*@Test
>>>>>>> 2eba690ae0d4551cb33f4a51294774d0f1ae1cab
	public void testSelectUser() throws Exception
	{
		UserVO vo = dao.selectId("id");
	}
	
	
/*	@Test
	public void testLoginMemeber() throws Exception
	{
		UserVO vo = new UserVO();
		vo.setId("root");
		vo.setPassword("root");
		
		UserVO vo2 = dao.loginUser(vo);
		
		
	}*/
	
/*	@Test
	public void checkLogin() throws Exception
	{
		String id ="root";
		int k = dao.checkLogin(id);
		System.out.println(k + "        dddddddddddddddddddd");
	}
	*/
	
	
/*	
	@Override
	public void modifyUser(String id) {
		// TODO Auto-generated method stub
		sqlsession.update(namesapce + ".modifyUser", id);
		
	}

	@Override
	public void deleteUser(String id) {
		// TODO Auto-generated method stub
		sqlsession.delete(namesapce + ".deleteUser", id);
	}*/
	
/*	<update id="modifyUser">
	update USERS set password=#{password}, email=#{email}, name=#{name}
	where id=#{id}
</update>*/
	
/*	@Test
	public void testModify() throws Exception
	{
		
		
		UserVO vo = dao.selectId("root");
		vo.setPassword("123433");
		vo.setEmail("changffe");
		vo.setName("changeNfffffame");
		
		dao.modifyUser(vo);
		
	}
	
	@Test
	public void testDelete() throws Exception
	{
		String id ="root";
		dao.deleteUser(id);
		
	}
	*/
}
