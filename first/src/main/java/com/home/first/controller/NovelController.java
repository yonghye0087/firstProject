package com.home.first.controller;

import java.io.File;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
		//로그인시 자기 소설 화면으로 이동하는 기능입니다.
		
		logger.info("GET방식으로 메인페이지/상단바에서 내 소설 화면으로 이동합니다.");
		
		//세션에서 아이디 정보를 읽는 부분
		String loginID = session.getAttribute("LoginID").toString();
		logger.info(loginID);
		
		//페이징 처리 부분
		int currentPageNo = 1;
		int maxPost = 10;
		
		if(req.getParameter("pages") != null)
			currentPageNo = Integer.parseInt(req.getParameter("pages"));
		
		Paging paging = new Paging(currentPageNo, maxPost);
		
		int offset = (paging.getCurrentPageNo() -1) * paging.getMaxPost();
		
		ArrayList<NovelProfileDto> page = new ArrayList<NovelProfileDto>();
		page = (ArrayList<NovelProfileDto>) NService.readNovelProfile(offset, paging.getMaxPost(),loginID);
		paging.setNumberOfRecords(NService.countForList());
		
		paging.makePaging();
		
	
		//페이징 처리한 정보를 모델에 담는 부분
		model.addAttribute("page", page);
		model.addAttribute("paging", paging);
		
		logger.info(model.toString());
		
		//리턴할 주소
		return "/Novel/NovelBoard";
	}
	@RequestMapping(value = "/novelByTl", method = RequestMethod.GET)
	public String readNovelByTl(@RequestParam("novel_title") String novel_title,@RequestParam("novel_id") String novel_id, Model model, HttpServletRequest req, HttpSession session) throws Exception {
		//내 소설 화면에서 개별 타이틀로 이동시키는 기능
		
		logger.info("GET방식으로 내 소설화면에서 개별 타이틀 화면으로 이동합니다.");
		logger.info(novel_title);
		logger.info(novel_id);
		
		/*String loginID = null;
		if() {
			
		}
		loginID = session.getAttribute("LoginID").toString();
		String novel_id2 = null;
		if(novel_id.equals(loginID)) {
			novel_id2 = loginID;
		} else {
			novel_id2 = novel_id;
		}
		
		logger.info(novel_id2);*/
		
		//페이징 처리 부분
		int currentPageNo = 1;
		int maxPost = 10;
		
		if(req.getParameter("pages") != null)
			currentPageNo = Integer.parseInt(req.getParameter("pages"));
		
		Paging paging = new Paging(currentPageNo, maxPost);
		
		int offset = (paging.getCurrentPageNo() -1) * paging.getMaxPost();
		
		ArrayList<NovelDto> page = new ArrayList<NovelDto>();
		page = (ArrayList<NovelDto>) NService.readNovelByTl(offset, paging.getMaxPost(),novel_title,novel_id);
		paging.setNumberOfRecords(NService.countByCh(novel_title));
		logger.info(page.toString());
		
		
		paging.makePaging();
		
		//페이징 처리한 화면을 모델에 담는 부분
		model.addAttribute("title", novel_title);
		model.addAttribute("page", page);
		model.addAttribute("paging", paging);
		logger.info(model.toString());
		
		//리턴할 주소
		return "/Novel/NovelBoardCh";
	}
	@RequestMapping(value="/novelContent", method = RequestMethod.GET)
	public String novelContent(@RequestParam("novel_idx")int novel_idx,@RequestParam("novel_id")String novel_id, Model model, HttpServletRequest req, HttpSession session) throws Exception {
		//개별타이틀 화면에서 개별 글화면으로 이동하는 기능입니다.
		
		logger.info("GET방식으로 개별타이틀 화면에서 개별 글 화면으로 이동합니다.");
		
		NovelDto novelContent = NService.read(novel_idx);
		String novel_title = novelContent.getNovel_title();
		logger.info("readNovelByTl GET");
		logger.info(novel_title);
		
		/*String loginID = session.getAttribute("LoginID").toString();
		logger.info(loginID);*/
		
		//페이징 처리부분
		int currentPageNo = 1;
		int maxPost = 10;
		
		if(req.getParameter("pages") != null)
			currentPageNo = Integer.parseInt(req.getParameter("pages"));
		
		Paging paging = new Paging(currentPageNo, maxPost);
		
		int offset = (paging.getCurrentPageNo() -1) * paging.getMaxPost();
		
		ArrayList<NovelDto> page = new ArrayList<NovelDto>();
		page = (ArrayList<NovelDto>) NService.readNovelByTl(offset, paging.getMaxPost(),novel_title,novel_id);
		paging.setNumberOfRecords(NService.countByCh(novel_title));
		
		paging.makePaging();
		
		//페이징 처리한 정보를 모델에 담는 부분
		model.addAttribute("page", page);
		model.addAttribute("paging", paging);
		model.addAttribute("novelContent", novelContent);
		
		//리턴할 주소
		return "/Novel/NovelContent";
	}
	@RequestMapping(value="/novelWrite", method = RequestMethod.GET)
	public String novelWrite(@RequestParam("novel_title") String novel_title, Model model, HttpSession session) throws Exception{
		//개별 타이틀 화면에서 소설 작성 화면으로 이동하는 기능
		logger.info("GET방식으로 개별 타이틀 화면에서 소설 작성 화면으로 이동합니다.");
		logger.info(novel_title);
		//작성하려는 소설 타이틀이 존재하는 확인하는 부분.
		if(!novel_title.equals(null) || !novel_title.equals("undefined")) {
			int chapter = NService.countByCh(novel_title);
			model.addAttribute("novel_title", novel_title);
			model.addAttribute("chapter", chapter);
			logger.info(model.toString());
		}
		String loginID = session.getAttribute("LoginID").toString();
		List<NovelDto> novelList = NService.readListByTl(0, 100, loginID);
		//모델에 반환값을 담는 부분
		model.addAttribute("novelList", novelList);
		logger.info(model.toString());
		//소설 작성 화면으로 리턴합니다.
		return "/Novel/NovelWrite";
	}
	
	@RequestMapping(value="/novelWrite", method = RequestMethod.POST)
	public String novelWrite(NovelDto novelDto) throws Exception{
		//소설작성 화면에서 DB로 값을 이동시키는 기능
		
		logger.info("POST방식으로 소설작성화면에서 DB로 값을 저장합니다.");
		logger.info(novelDto.toString());
		int chapterCount = 0;
		String title = URLEncoder.encode(novelDto.getNovel_title(), "UTF-8");
		if(novelDto != null) {
			chapterCount = NService.countByCh(novelDto.getNovel_title());
			novelDto.setNovel_chapter(chapterCount+1);
			NService.createNovel(novelDto);
		}
		String novel_id = novelDto.getNovel_id();
		//작성된 타이틀 화면으로 리다이렉트 합니다.
		return "redirect:/novelByTl?novel_title="+title+"&&novel_id="+novel_id;
	}
	
	@RequestMapping(value="/serialNovelBoard", method = RequestMethod.GET)
	public String serialNovelBoard(HttpServletRequest req, Model model) throws Exception {
		//일반공개소설화면으로 이동하는 기능입니다.
		logger.info("GET방식으로 메인페이지에서 일반소설화면으로 이동합니다.");
		
		//페이징 부분
		int currentPageNo = 1;
		int maxPost = 10;
		
		if(req.getParameter("pages") != null)
			currentPageNo = Integer.parseInt(req.getParameter("pages"));
		
		Paging paging = new Paging(currentPageNo, maxPost);
		
		int offset = (paging.getCurrentPageNo() -1) * paging.getMaxPost();
		
		ArrayList<NovelDto> page = new ArrayList<NovelDto>();
		page = (ArrayList<NovelDto>) NService.novelListfor(offset, paging.getMaxPost());
		paging.setNumberOfRecords(NService.countForList());
		
		paging.makePaging();
		
		//모델 처리 부분
		model.addAttribute("paging", paging);
		model.addAttribute("page", page);
		
		//리턴부분
		return "/Novel/NovelSerialBoard";
	}
	
	@RequestMapping(value="/serialList", method = RequestMethod.GET)
	@ResponseBody
	public List<NovelProfileDto> serialNovelList(@RequestParam("Vi_idx") int vi) throws Exception {
		//일반소설화면에서 Ajax통신을 이용해 소설정보를 가져가는 기능입니다.
		
		logger.info(Integer.toString(vi));
		
		logger.info("POST방식과 Ajax통신을 이용해 일반소설화면에 DB의 정보를 가져옵니다.");
		
		//Ajax통신으로 소설 정보를 리턴합니다.
		return NService.readNovel();
	}
	@RequestMapping(value="/novelProfile", method = RequestMethod.POST)
	@ResponseBody
	public NovelProfileDto profileNovel(@RequestParam("novel_id") String novel_id, @RequestParam("novel_title") String novel_title) throws Exception{
		//Ajax통신으로 소설의 프로필을 가져오는 기능입니다.
		
		logger.info("POST방식과 Ajax통신을 이용해 소설프로필 모듈에 DB의 정보를 가져옵니다.");
		
		logger.info(novel_id +" : "+ novel_title);
		
		NovelProfileDto DBDto = NService.readProfile(novel_id, novel_title);
		
		if(DBDto == null) {
			logger.info("profileNovel null");
			NovelProfileDto nullDto = new NovelProfileDto();
			DBDto = nullDto;
		}
		//Ajax통신으로 리턴
		return DBDto;
	}
	
	@RequestMapping(value="/profileModify", method = RequestMethod.POST)
	public String profileModify(NovelProfileDto novelProfileDto, MultipartFile novel_file, HttpSession session ) throws Exception {
		//Ajax 통신을 이용해 소설프로필의 정보를 수정하는 기능입니다.
		
		logger.info("POST방식과 Ajax통신을 이용하여 소설프로필 모듈의 정보를 수정합니다.");
		logger.info(novelProfileDto.toString());
		
		//기입값 정의
		int novelIdx = novelProfileDto.getNovel_title_idx();
		
		//파일이름 변경
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
		
		//파일 크기
		int fileSize = originalName.length();
		
		//기존 쟁보 불러오기
		NovelProfileDto NewList = NService.readProfileByMo(novelIdx);
		
		//기존 파일 삭제용 정의
		String oldFileName = NewList.getNovel_img_name();
		
		//변경정보 저장
		NewList.setNovel_title(novelProfileDto.getNovel_title());
		NewList.setNovel_nickname(novelProfileDto.getNovel_nickname());
		NewList.setNovel_img_name(newFileName);
		NewList.setNovel_img_size(fileSize);
		
		boolean result = NService.profileModity(NewList);
		
		logger.info(NewList.toString());
		logger.info(String.valueOf(result));
		
		if(result == true) {
			String uploadPath = "F:\\WorkSpace\\firstProject\\first\\src\\main\\webapp\\resources\\ImageFile\\";
			novel_file.transferTo(new File(uploadPath + newFileName));
			File oldFile = new File(uploadPath + oldFileName);
			boolean oldDelete = oldFile.delete();
			logger.info(String.valueOf(oldDelete));
		}
		String newNovelTilte = URLEncoder.encode(NewList.getNovel_title(), "UTF-8");
		return "redirect:/novelByTl?novel_title="+newNovelTilte+"&&novel_id="+NewList.getNovel_id();
	}
	
	@RequestMapping(value="/selectVisibility", method = RequestMethod.POST)
	@ResponseBody
	public void selectVisibility(@RequestParam("novel_visibility") int novel_visibility, @RequestParam("novel_title") String novel_title, HttpSession session) throws Exception {
		//일반소설화면에서 선택된 소설을 불러들이는 기능
		
		logger.info("POST방식으로 내가 작성한 소설의 공개여부를 변경합니다.");
		logger.info(Integer.toString(novel_visibility));
		logger.info(novel_title);
		String loginID = session.getAttribute("LoginID").toString();
		logger.info(loginID);
		NService.updateForVi(novel_title, novel_visibility, loginID);
	}
	
	@RequestMapping(value="/novelProFileCreate", method = RequestMethod.GET)
	public String novelProFileCreate() throws Exception {
		//소설 프로필 모듈에서 소설프로필을 만드는 기능
		
		logger.info("GET방식으로 소설의 프로필 화면으로 리다이렉트 합니다.");
		
		//소설 프로필 모듈로 리다이렉트
		return "/Novel/NovelProFileCreate";
	}
	@RequestMapping(value="/createNovel", method = RequestMethod.POST)
	public String createNovel(NovelProfileDto novelProfileDto, @RequestParam("novel_file") MultipartFile novelFile, HttpSession session) throws Exception {
		//소설프로필 화면에서 기입된 정보들을 디비에 저장하는 기능
		logger.info("POST방식으로 소설의 프로필 화면에서 DB로 정보를 저장합니다.");
		logger.info(novelFile.getOriginalFilename());
		logger.info(novelProfileDto.toString());
		
		//선언부분
		String novel_id = session.getAttribute("LoginID").toString();
		
		//파일이름 변경
		String originalName = novelFile.getOriginalFilename();
		int nameLength = originalName.length();
		int extSub = originalName.lastIndexOf(".");
		String ext = originalName.substring(extSub+1, nameLength);
		String fileName = originalName.substring(0, extSub);
		
		//오늘날짜 구해서 파일 사이에 넣기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
        Calendar c1 = Calendar.getInstance();
        String strToday = sdf.format(c1.getTime());
		String newFileName = fileName+strToday+"."+ext;
		
		//파일 크기
		int fileSize = originalName.length();
		
		int checkNum = NService.countByCh(novelProfileDto.getNovel_title());
		if(checkNum == 0) {
			//적용부
			try {
				novelProfileDto.setNovel_id(novel_id);
				novelProfileDto.setNovel_img_name(newFileName);
				novelProfileDto.setNovel_img_size(fileSize);
				logger.info(novelProfileDto.toString());
				NService.create(novelProfileDto);
				NovelProfileDto check2 = NService.readProfile(novel_id, novelProfileDto.getNovel_title());
				if(novelProfileDto.getNovel_title().equals(check2.getNovel_title()) || novelProfileDto.getNovel_title() == check2.getNovel_title()) {
					String uploadPath = "F:\\WorkSpace\\firstProject\\first\\src\\main\\webapp\\resources\\ImageFile\\";
					novelFile.transferTo(new File(uploadPath + newFileName));
						
				}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				
			}
		}
		return "redirect:/novelByTl?novel_title="+novelProfileDto.getNovel_title();
	}
	
	@RequestMapping(value="/serialNovel", method =  {RequestMethod.GET, RequestMethod.POST})
	public String serialNovel(NovelProfileDto novelProfileDto, Model model, HttpServletRequest req) throws Exception {
		//일반 소설화면에서 개별 화면으로 이동하는 기능
		logger.info("POST방식으로 개별 일반 소설로 이동합니다.");
		logger.info(novelProfileDto.toString());
		String novel_id = novelProfileDto.getNovel_id();
		String novel_title = novelProfileDto.getNovel_title();
		NovelProfileDto profileList =  NService.readProfile(novel_id, novel_title);
		
		//페이징 부분
		int currentPageNo = 1;
		int maxPost = 10;
		
		if(req.getParameter("pages") != null)
			currentPageNo = Integer.parseInt(req.getParameter("pages"));
		
		Paging paging = new Paging(currentPageNo, maxPost);
		
		int offset = (paging.getCurrentPageNo() -1) * paging.getMaxPost();
		
		ArrayList<NovelDto> page = new ArrayList<NovelDto>();
		page = (ArrayList<NovelDto>) NService.readNovelByTl(offset, paging.getMaxPost(),novel_title, novel_id);
		paging.setNumberOfRecords(NService.countByCh(novel_title));
		
		paging.makePaging();
		
		//모델 저장 부분
		model.addAttribute("paging", paging);
		model.addAttribute("profileList", profileList);
		model.addAttribute("page", page);
		
		//리턴 부분
		return "Novel/NoveSerialList";
	}
}
