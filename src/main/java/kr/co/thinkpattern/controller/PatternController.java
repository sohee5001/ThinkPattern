package kr.co.thinkpattern.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.thinkpattern.service.PatternService;

@Controller
@RequestMapping("/pattern/*")
public class PatternController {

	@Inject
	PatternService service;
	
	@RequestMapping(value="/list", method = RequestMethod.GET)
	public void list(Model model) throws Exception {
		model.addAttribute("list", service.listAll());
	}
	
}
