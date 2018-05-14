package com.home.first.controller;

import java.io.File;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.home.first.dto.NovelDto;
import com.home.first.dto.NovelProfileDto;
import com.home.first.paging.Paging;
import com.home.first.service.NovelService;

@Controller
public class NovelController {
	private static final Logger logger = LoggerFactory.getLogger(NovelController.class);
	
	@Inject
	private NovelService NService;
	
	@RequestMapping(value = "/novel", method = RequestMethod.GET)
	public String readNovel(Model model, HttpServletRequest req, HttpSession session) throws Exception{
		logger.info("readNovel GET");
		String loginID = session.getAttribute("LoginID").toString();
		logger.info(loginID);
		int currentPageNo = 1;
		int maxPost = 10;
		
		if(req.getParameter("pages") != null)
			currentPageNo = Integer.parseInt(req.getParameter("pages"));
		
		Paging paging = new Paging(currentPageNo, maxPost);
		
		int offset = (paging.getCurrentPageNo() -1) * paging.getMaxPost();
		
		ArrayList<NovelDto> page = new ArrayList<NovelDto>();
		page = (ArrayList<NovelDto>) NService.readListByTl(offset, paging.getMaxPost(),loginID);
		paging.setNumberOfRecords(NService.countForList());
		
		paging.makePaging();
		
		for(NovelDto N : page) {
			String novel_title = N.getNovel_title();
			int  hitCount = NService.readHitSum(novel_title, loginID);
			N.setNovel_hit(hitCount);
		}
		model.addAttribute("page", page);
		model.addAttribute("paging", paging);
		logger.info(model.toString());
		
		return "/Novel/novelBoard";
	}
	@RequestMapping(value = "/novelByTl", method = RequestMethod.GET)
	public String readNovelByTl(@RequestParam("novel_title") String novel_title, Model model, HttpServletRequest req, HttpSession session) throws Exception {
		logger.info("readNovelByTl GET");
		logger.info(novel_title);
		
		String loginID = session.getAttribute("LoginID").toString();
		logger.info(loginID);
		
		int currentPageNo = 1;
		int maxPost = 10;
		
		if(req.getParameter("pages") != null)
			currentPageNo = Integer.parseInt(req.getParameter("pages"));
		
		Paging paging = new Paging(currentPageNo, maxPost);
		
		int offset = (paging.getCurrentPageNo() -1) * paging.getMaxPost();
		
		ArrayList<NovelDto> page = new ArrayList<NovelDto>();
		page = (ArrayList<NovelDto>) NService.readNovelByTl(offset, paging.getMaxPost(),novel_title,loginID);
		paging.setNumberOfRecords(NService.countByCh(novel_title));
		
		for(NovelDto N : page) {
			int NV = N.getNovel_visibility();
			model.addAttribute("novel_visibility", NV);
		}
		paging.makePaging();
		
		model.addAttribute("title", novel_title);
		model.addAttribute("page", page);
		model.addAttribute("paging", paging);
		logger.info(model.toString());
		return "/Novel/novelBoardCh";
	}
	@RequestMapping(value="/novelContent", method = RequestMethod.GET)
	public String novelContent(@RequestParam("novel_idx")int novel_idx, Model model, HttpServletRequest req, HttpSession session) throws Exception {
		logger.info("novelContent");
		NovelDto novelContent = NService.read(novel_idx);
		String novel_title = novelContent.getNovel_title();
		logger.info("readNovelByTl GET");
		logger.info(novel_title);
		
		String loginID = session.getAttribute("LoginID").toString();
		logger.info(loginID);
		
		int currentPageNo = 1;
		int maxPost = 10;
		
		if(req.getParameter("pages") != null)
			currentPageNo = Integer.parseInt(req.getParameter("pages"));
		
		Paging paging = new Paging(currentPageNo, maxPost);
		
		int offset = (paging.getCurrentPageNo() -1) * paging.getMaxPost();
		
		ArrayList<NovelDto> page = new ArrayList<NovelDto>();
		page = (ArrayList<NovelDto>) NService.readNovelByTl(offset, paging.getMaxPost(),novel_title,loginID);
		paging.setNumberOfRecords(NService.countByCh(novel_title));
		
		paging.makePaging();
		model.addAttribute("page", page);
		model.addAttribute("paging", paging);
		model.addAttribute("novelContent", novelContent);
		
		return "/Novel/novelContent";
	}
	@RequestMapping(value="/novelWrite", method = RequestMethod.GET)
	public String novelWrite(@RequestParam("novel_title") String novel_title, Model model, HttpSession session) throws Exception{
		if(!novel_title.equals(null)) {
			int chapter = NService.countByCh(novel_title);
			model.addAttribute("novel_title", novel_title);
			model.addAttribute("chapter", chapter);
		}
		String loginID = session.getAttribute("LoginID").toString();
		List<NovelDto> novelList = NService.readListByTl(0, 100, loginID);
		
		model.addAttribute("novelList", novelList);
		return "/Novel/novelWrite";
	}
	
	@RequestMapping(value="/novelWrite", method = RequestMethod.POST)
	public String novelWrite(NovelDto novelDto) throws Exception{
		logger.info("novelWrite POST");
		logger.info(novelDto.toString());
		int chapterCount = 0;
		String title = URLEncoder.encode(novelDto.getNovel_title(), "UTF-8");
		if(novelDto != null) {
			chapterCount = NService.countByCh(novelDto.getNovel_title());
			novelDto.setNovel_chapter(chapterCount+1);
			NService.createNovel(novelDto);
		}
		return "redirect:/novelByTl?novel_title="+title;
	}
	
	@RequestMapping(value="/serialNovelBoard", method = RequestMethod.GET)
	public String serialNovelBoard() throws Exception {
		logger.info("serialNovelList GET");
		return "/Novel/serialNovelBoard";
	}
	
	@RequestMapping(value="/serialNovelList", method = RequestMethod.POST)
	@ResponseBody
	public List<NovelProfileDto> serialNovelList() throws Exception {
		logger.info("serialNovelList POST");
		return NService.readNovel();
	}
	@RequestMapping(value="/profileNovel", method = RequestMethod.POST)
	@ResponseBody
	public NovelProfileDto profileNovel(@RequestParam("novel_id") String novel_id, @RequestParam("novel_title") String novel_title, @RequestParam("novel_visibility") int novel_visibility) throws Exception{
		logger.info("profileNovel POST");
		logger.info(novel_id +" : "+ novel_title+" : "+novel_visibility);
		NovelProfileDto DBDto = NService.read(novel_id, novel_title);
		
		if(DBDto == null) {
			logger.info("profileNovel null");
			NovelProfileDto nullDto = new NovelProfileDto();
			DBDto = nullDto;
		}
		
		return DBDto;
	}
	
	@RequestMapping(value="/profileModifyForFile", method = RequestMethod.POST)
	@ResponseBody
	public String profileModify(@RequestParam("novel_title") String novel_title,@RequestParam("novel_nickname") String novel_nickname ,@RequestParam("novel_file") MultipartFile novel_file, HttpSession session ) throws Exception {
		logger.info("profileModify POST");
		String title = URLEncoder.encode(novel_title, "UTF-8");
		if(novel_file != null) {
			//중복되는 파일 이름 변경하기
			String originalName = novel_file.getOriginalFilename();
			int nameLength = originalName.length();
			int extSub = originalName.lastIndexOf(".");
			String ext = originalName.substring(extSub+1, nameLength);
			String fileName = originalName.substring(0, extSub);
			
			//오늘날짜 구해서 파일 사이에 넣기
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
	        Calendar c1 = Calendar.getInstance();
	        String strToday = sdf.format(c1.getTime());
			String newFileName = fileName+strToday+"."+ext;
			NovelProfileDto NPDto = new NovelProfileDto();
			
			//파일 크기
			int fileSize = originalName.length();
			
			//파일 경로에 저장하기
			String uploadPath = "F:\\WorkSpace\\firstProject\\first\\src\\main\\webapp\\resources\\ImageFile\\";
			novel_file.transferTo(new File(uploadPath + newFileName));
			
			//확인
			logger.info(originalName);
			logger.info(fileName +" "+strToday+" . "+ext);
			logger.info(newFileName);
			logger.info(Integer.toString(fileSize));
			
			//객체에 값 대입하기
			NPDto.setNovel_nickname(novel_nickname);
			NPDto.setNovel_title(novel_title);
			NPDto.setNovel_id(session.getAttribute("LoginID").toString());
			NPDto.setNovel_img_name(newFileName);
			NPDto.setNovel_img_size(fileSize);
			
			NService.create(NPDto);
		}
		return "redirect:/novelByTl?novel_title="+title;
	}
}
