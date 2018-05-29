package com.home.first;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.home.first.dto.BoardDto;
import com.home.first.dto.NovelDto;
import com.home.first.dto.UserDto;
import com.home.first.paging.Paging;
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
	@RequestMapping(value="/searchbar", method = RequestMethod.GET)
	public String searchbar() throws Exception {
		return "/Module/SearchBar";
	}
	@RequestMapping(value="/search", method = RequestMethod.GET)
	public String search(@RequestParam("cate") String cate, @RequestParam("text") String text, Model model, HttpServletRequest req) throws Exception {
		logger.info(cate);
		logger.info(text);
		logger.info("fuxk the ssi");
		
		String returnUrl = "";
		
		if(cate == "Book" || cate.equals("Book")) {
			logger.info("fuxk the hell");
			NService.novelSearch(text, 0, 10);
			
			int currentPageNo = 1;
			int maxPost = 10;
			
			if(req.getParameter("pages") != null)
				currentPageNo = Integer.parseInt(req.getParameter("pages"));
			
			Paging paging = new Paging(currentPageNo, maxPost);
			
			int offset = (paging.getCurrentPageNo() -1) * paging.getMaxPost();
			
			ArrayList<NovelDto> page = new ArrayList<NovelDto>();
			page = (ArrayList<NovelDto>) NService.novelSearch(text, offset, paging.getMaxPost());
			paging.setNumberOfRecords(NService.novelSearchCount(text));
			
			paging.makePaging();
			
			//모델 처리 부분
			model.addAttribute("paging", paging);
			model.addAttribute("page", page);
			
			returnUrl = "/Novel/NovelSearch";
		} 
		if(cate == "User" || cate.equals("User")){
			int currentPageNo = 1;
			int maxPost = 10;
			
			if(req.getParameter("pages") != null)
				currentPageNo = Integer.parseInt(req.getParameter("pages"));
			
			Paging paging = new Paging(currentPageNo, maxPost);
			
			int offset = (paging.getCurrentPageNo() -1) * paging.getMaxPost();
			
			ArrayList<BoardDto> page = new ArrayList<BoardDto>();
			page = (ArrayList<BoardDto>) Bservice.boardSearch(text,offset, paging.getMaxPost());
			paging.setNumberOfRecords(Bservice.boardSearchCount(text));
			
			paging.makePaging();
			
			model.addAttribute("page", page);
			model.addAttribute("paging", paging);
			returnUrl = "/Board/BoardFree";
		} 
		if(cate == "Title" || cate.equals("Title")){
			int currentPageNo = 1;
			int maxPost = 10;
			
			if(req.getParameter("pages") != null)
				currentPageNo = Integer.parseInt(req.getParameter("pages"));
			
			Paging paging = new Paging(currentPageNo, maxPost);
			
			int offset = (paging.getCurrentPageNo() -1) * paging.getMaxPost();
			
			ArrayList<BoardDto> page = new ArrayList<BoardDto>();
			page = (ArrayList<BoardDto>) Bservice.boardSearch(text,offset, paging.getMaxPost());
			paging.setNumberOfRecords(Bservice.boardSearchCount(text));
			
			paging.makePaging();
			
			model.addAttribute("page", page);
			model.addAttribute("paging", paging);
			returnUrl = "/Board/BoardFree";
		}
		return returnUrl;
	}
}
