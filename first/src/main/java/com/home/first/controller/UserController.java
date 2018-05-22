package com.home.first.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		//상단바에서 회원가입 화면으로 이동하는 기능입니다.
		
		logger.info("GET방식으로 상단바에서 회원가입화면으로 이동합니다.");
		
		//리턴할 주소
		return "/User/UserSignUp";
	}
	
	@RequestMapping(value="/signUpPOST", method = RequestMethod.POST)
	@ResponseBody
	public String signPOST(@RequestBody UserDto alldata, Model model) throws Exception{
		//회원가입화면에서 입력한 값들을 DB에 저장합니다.
		
		logger.info("POST방식과 AJAX통신으로 회원가입화면에서 DB로 정보를 저장합니다.");
		logger.info(alldata.toString());
		boolean result = UService.create(alldata);
		logger.info(String.valueOf(result));
		
		//Ajax통신으로 결과값을 리턴한다. true/false의 값을 스트링 방식으로 리턴한다.
		return String.valueOf(result);
	}
	@RequestMapping(value="/loginUserGET", method = RequestMethod.GET)
	public String loginGET() throws Exception {
		//상단바에서 로그인 화면으로 이동하는 기능
		
		logger.info("GET방식으로 상단바에서 로그인화면으로 이동합니다.");
		
		//리턴할 주소
		return "/User/UserLogin";
	}
	@RequestMapping(value="/loginUserPOST", method = RequestMethod.POST)
	public String loginPOST(UserDto UserDto, Model model, HttpSession session) throws Exception{
		//로그인화면에서 DB로 정보를 보내는 기능
		
		logger.info("POST방식으로 로그인 화면에서 DB로 정보를 전송합니다.");
		String resultMapping = null;
		logger.info(UserDto.toString());		
		UserDto IDCheck = UService.read(UserDto.getUser_id());
		int CID = 0;
		if(IDCheck != null) {
			boolean rs = UService.login(UserDto);
			logger.info("Login process starting");
			if(rs == true) {
				resultMapping = "/MainPage";
				session.setAttribute("LoginID", IDCheck.getUser_id());
				session.setAttribute("UserLv", IDCheck.getUser_level());
				logger.info(IDCheck.getUser_id());
				CID = 3;
				model.addAttribute("CheckID", CID);
			} else {
				resultMapping = "/User/UserLogin";
				CID = 1;
				model.addAttribute("CheckID", CID);
				logger.info("Login Fail");
			}
		} else {
			resultMapping = "/User/UserLogin";
			model.addAttribute("CheckID", CID);
			logger.info("Rechecking ID");
		}
		return resultMapping;
	}
	@RequestMapping(value="/logoutGET", method = RequestMethod.GET)
	public String logoutGET(HttpSession session, Model model) {
		//로그아웃 기능입니다. 로그아웃시 세션을 초기화 합니다.
		
		logger.info("GET방식으로 로그아웃합니다.");
		session.invalidate();
		
		//메인페이지로 리턴합니다.
		return "/MainPage";
	}
	@RequestMapping(value="/userRead", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> userRead(@RequestParam("UserId") String User_id) throws Exception{
		//유저 프로필 모듈에서 유저의 정보를 읽어드리는 기능입니다.
		
		logger.info("POST방식으로 유저프로필화면에서 정보를 불러들입니다.");
		logger.info(User_id);
		UserDto userprofile = UService.read(User_id);
		logger.info(userprofile.toString());
		Date signdate = userprofile.getUser_date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		String newDate = sdf.format(signdate);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userprofile", userprofile);
		map.put("newDate", newDate);
		//Ajax통신으로 유저정보를 리턴합니다.
		return map;
	}
	@RequestMapping(value="/userForLv", method = RequestMethod.GET)
	public String userForLv(Model model) throws Exception {
		//유저정보 화면에서 정보를 불러들이는 기능입니다. 관리자 이상만 보이는 화면입니다.
		
		logger.info("GET방식으로 모든 유저정보를 읽어드립니다.");
		List<UserDto> guestList = UService.listAll(0);
		List<UserDto> managerList = UService.listAll(1);
		
		//유저정보를 모델에 담아 view로 보냅니다. managerList는 관리자 정보를, guestList는 일반 유저 정보를 담고 있습니다. 관리자의 정보는 항상 최 상단에 표기됩니다.
		model.addAttribute("guestList", guestList);
		model.addAttribute("managerList", managerList);
		
		//유저리스트로 리턴합니다.
		return "/User/UserForLv";
	}
	@RequestMapping(value="/userModify", method = RequestMethod.GET)
	public String userModify() throws Exception {
		//유저정보를 수정하는 기능입니다. 아직 구현하지 않았습니다.
		return null;
	}
	@RequestMapping(value="/terms", method = RequestMethod.GET)
	public String terms() throws Exception {
		//로그인시 사전동의약관으로 이동하는 기능입니다.
		
		logger.info("GET방식으로 상단바에서 사전동의약관화면으로 이동합니다.");
		
		//리턴할 주소
		return "/User/UserTermsOfMembership";
	}
}
