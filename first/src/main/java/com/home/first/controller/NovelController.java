package com.home.first.controller;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.home.first.dto.NovelDto;
import com.home.first.paging.Paging;
import com.home.first.service.NovelService;

@Controller
public class NovelController {
	private static final Logger logger = LoggerFactory.getLogger(NovelController.class);
	
	@Inject
	private NovelService NService;
	
	@RequestMapping(value = "/novel", method = RequestMethod.GET)
	public String readNovel(Model model, HttpServletRequest req) throws Exception{
		logger.info("readNovel GET");
		logger.info(req.toString());
		
		int currentPageNo = 1;
		int maxPost = 10;
		
		if(req.getParameter("pages") != null)
			currentPageNo = Integer.parseInt(req.getParameter("pages"));
		
		Paging paging = new Paging(currentPageNo, maxPost);
		
		int offset = (paging.getCurrentPageNo() -1) * paging.getMaxPost();
		
		ArrayList<NovelDto> page = new ArrayList<NovelDto>();
		page = (ArrayList<NovelDto>) NService.readListByTl(offset, paging.getMaxPost());
		paging.setNumberOfRecords(NService.countForList());
		
		paging.makePaging();
		model.addAttribute("page", page);
		model.addAttribute("paging", paging);
		
		return "/Novel/novelBoard";
	}
	@RequestMapping(value = "/novelByTl", method = RequestMethod.GET)
	public String readNovelByTl(@RequestParam("novel_title") String novel_title, Model model, HttpServletRequest req) throws Exception {
		logger.info("readNovelByTl GET");
		
		int currentPageNo = 1;
		int maxPost = 10;
		
		if(req.getParameter("pages") != null)
			currentPageNo = Integer.parseInt(req.getParameter("pages"));
		
		Paging paging = new Paging(currentPageNo, maxPost);
		
		int offset = (paging.getCurrentPageNo() -1) * paging.getMaxPost();
		
		ArrayList<NovelDto> page = new ArrayList<NovelDto>();
		page = (ArrayList<NovelDto>) NService.readNovelByTl(offset, paging.getMaxPost(),novel_title);
		paging.setNumberOfRecords(NService.countByCh(novel_title));
		
		paging.makePaging();
		model.addAttribute("page", page);
		model.addAttribute("paging", paging);
		
		return "/Novel/novelBoardCh";
	}
}
