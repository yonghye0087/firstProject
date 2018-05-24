package com.home.first;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.home.first.dto.BoardDto;
import com.home.first.dto.NovelDto;
import com.home.first.dto.UserDto;
import com.home.first.service.BoardService;
import com.home.first.service.NovelService;
import com.home.first.service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private BoardService Bservice;
	
	@Inject
	private UserService UService;
	
	@Inject
	private NovelService NService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		session.invalidate();
		return "/MainPage";
	}
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String indexToHome(Locale locale, Model model) throws Exception{
		List<BoardDto> boardList = Bservice.boardList(0, 5);
		List<UserDto> guestList = UService.listAll(0);
		List<NovelDto> novelList = NService.readNovelVi(0, 5);
		logger.info(boardList.toString());
		logger.info(guestList.toString());
		logger.info(novelList.toString());
		model.addAttribute("boardList", boardList);
		model.addAttribute("guestList", guestList);
		model.addAttribute("novelList", novelList);
		return "/MainPage";
	}
}
