package com.home.first.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.bind.ParseConversionEvent;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.type.IntegerTypeHandler;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.home.first.dto.BoardDto;
import com.home.first.dto.CommentDto;
import com.home.first.paging.Paging;
import com.home.first.service.BoardService;
import com.home.first.service.CommentService;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService Bservice;
	
	@Inject
	private CommentService CService;
	
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String readBoard(Model model, HttpServletRequest req) throws Exception {
		//mapping logger
		logger.info("board GET");
		logger.info(req.toString());
		//paging setting
		int currentPageNo = 1;
		int maxPost = 10;
		
		if(req.getParameter("pages") != null)
			currentPageNo = Integer.parseInt(req.getParameter("pages"));
		
		Paging paging = new Paging(currentPageNo, maxPost);
		
		int offset = (paging.getCurrentPageNo() -1) * paging.getMaxPost();
		
		ArrayList<BoardDto> page = new ArrayList<BoardDto>();
		page = (ArrayList<BoardDto>) Bservice.boardList(offset, paging.getMaxPost());
		paging.setNumberOfRecords(Bservice.boardGetCount());
		
		paging.makePaging();
		model.addAttribute("page", page);
		model.addAttribute("paging", paging);
		return "/Board/board";
	}
	
	@RequestMapping(value="/boardWrite", method = RequestMethod.GET)
	public String boardWrite() throws Exception {
		
		logger.info("boardWrite GET");
		
		return "/Board/boardWrite";
	}
	
	@RequestMapping(value="/boardWrite", method = RequestMethod.POST)
	public String boardWrite(BoardDto board, Model model, HttpSession session) throws Exception{
		logger.info("boardWrite POST");
		
		Bservice.regist(board, session);
		
		return "redirect:board";
	}
	
	@RequestMapping(value = "/boardContent", method = RequestMethod.GET)
	public String boardContent(@RequestParam("boardNo") int board_idx, Model model, HttpServletRequest req) throws Exception {
		
		logger.info("boardContent GET : "+board_idx);	
		
		int currentPageNo = 1;
		int maxPost = 10;
		
		if(req.getParameter("pages") != null)
			currentPageNo = Integer.parseInt(req.getParameter("pages"));
		
		Paging paging = new Paging(currentPageNo, maxPost);
		
		int offset = (paging.getCurrentPageNo() -1) * paging.getMaxPost();
		
		ArrayList<BoardDto> page = new ArrayList<BoardDto>();
		page = (ArrayList<BoardDto>) Bservice.boardList(offset, paging.getMaxPost());
		paging.setNumberOfRecords(Bservice.boardGetCount());
		
		paging.makePaging();
		model.addAttribute("page", page);
		model.addAttribute("paging", paging);
		model.addAttribute("boardRead", Bservice.read(board_idx));
		
		return "/Board/boardContent";
	}
	
	@RequestMapping(value="/boardModify", method = RequestMethod.GET)
	public String boardModify(@RequestParam("boardNo") int board_idx, Model model) throws Exception {
		
		logger.info("boardModify GET");
		
		model.addAttribute("boardRead", Bservice.read(board_idx));
		
		return "/Board/boardModify";
	}
	
	@RequestMapping(value="/boardModify", method = RequestMethod.POST)
	public String boardModify(BoardDto board, Model model) throws Exception {
		
		logger.info("boardModify POST");
		
		Bservice.modify(board);
		
		return "redirect:board";
	}
	
	@RequestMapping(value="/boardDelete", method = RequestMethod.GET)
	public String boardDelete(@RequestParam("boardNo") int board_idx) throws Exception {
		
		Bservice.remove(board_idx);
		
		return "redirect:board";
	}
	
	@RequestMapping(value="/commentRead", method = RequestMethod.POST)
	@ResponseBody
	public List<CommentDto> commentRead(@RequestParam("boardNo") int board_idx, Model model) throws Exception{
		
		logger.info("commentRead");
		logger.info(Integer.toString(board_idx));
		
		List<CommentDto> commentList = CService.commentRead(board_idx);
		
		logger.info(commentList.toString());
		
		return commentList;
	}
	
	@RequestMapping(value="/commentCreate", method = RequestMethod.POST)
	public String commentCreate(CommentDto commentDto, Model model) throws Exception{
		
		logger.info(commentDto.toString());
		
		int num = commentDto.getBoard_idx();
		
		CService.commentRegist(commentDto);
		
		return "redirect:boardContent?boardNo="+num;
	}
	
	@RequestMapping(value="/commentUpdate", method = RequestMethod.POST)
	public void commentUpdate(@RequestParam("comment_idx") int comment_idx, @RequestParam("session_id") String id) throws Exception {
		
		logger.info("commentUpdate POST");
		logger.info(Integer.toString(comment_idx));
		logger.info(id);
		
		CommentDto commentDto = new CommentDto();
		List<CommentDto> ChList = CService.commentCheck(comment_idx);
		String chenck_id = null;
		logger.info(ChList.toString());
		
		for(CommentDto CDO : ChList) {
			chenck_id = CDO.getId();			
		};
		if(chenck_id.equals(id)) {
			commentDto.setComment_idx(comment_idx);
			commentDto.setComment_content("삭제된 댓글입니다.");
			logger.info(commentDto.toString());
			CService.commentModify(commentDto);
		}
	}
}
