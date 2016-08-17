package kr.co.thinkpattern.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import kr.co.thinkpattern.service.UserService;

@Controller
public class UserController {

	@Inject
	UserService service;
	
	
	
	
}
