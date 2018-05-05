package com.home.first.controller;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.home.first.dto.UserDto;
import com.home.first.service.UserService;

@Controller
public class UserController {	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	private UserService UService;
	
	 
	@RequestMapping(value="/signUpGET", method = RequestMethod.GET)
	public String signUpGET() throws Exception{
		logger.info("Sign-Up GET");
		return "/User/signup";
	}
	
	@RequestMapping(value="/signUpPOST", method = RequestMethod.POST)
	@ResponseBody
	public String signPOST(@RequestBody UserDto alldata, Model model) throws Exception{
		logger.info("sign-up POST");
		logger.info(alldata.toString());
		boolean result = UService.create(alldata);
		logger.info(String.valueOf(result));
		return String.valueOf(result);
	}
	@RequestMapping(value="/loginUserGET", method = RequestMethod.GET)
	public String loginGET() throws Exception {
		logger.info("login GET");
		return "/User/login";
	}
	@RequestMapping(value="/loginUserPOST", method = RequestMethod.POST)
	public String loginPOST(UserDto UserDto, Model model, HttpSession session) throws Exception{
		String resultMapping = null;
		logger.info("login POST");
		logger.info(UserDto.toString());		
		UserDto IDCheck = UService.read(UserDto.getId());
		int CID = 0;
		if(IDCheck != null) {
			boolean rs = UService.login(UserDto);
			logger.info("Login process starting");
			if(rs == true) {
				resultMapping = "/index";
				session.setAttribute("LoginID", IDCheck.getId());
				logger.info(IDCheck.getId());
				CID = 3;
				model.addAttribute("CheckID", CID);
			} else {
				resultMapping = "/User/login";
				CID = 1;
				model.addAttribute("CheckID", CID);
				logger.info("Login Fail");
			}
		} else {
			resultMapping = "/User/login";
			model.addAttribute("CheckID", CID);
			logger.info("Rechecking ID");
		}
		return resultMapping;	//백스페이스로 못돌아가게 완전이동 시키기	
	}
	@RequestMapping(value="/logoutGET", method = RequestMethod.GET)
	public String logoutGET(HttpSession session, Model model) {
		session.invalidate();
		return "/index";
	}
	@RequestMapping(value="/userRead", method = RequestMethod.POST)
	@ResponseBody
	public UserDto userRead(@RequestParam("UserId") String User_id) throws Exception{
		logger.info("userRead POST");
		logger.info(User_id);
		UserDto userprofile = UService.read(User_id);
		logger.info(userprofile.toString());
		return userprofile;
	}
}
