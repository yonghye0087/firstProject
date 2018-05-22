package com.home.first.controller;

import java.util.ArrayList;
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
		//메인페이지 -> 자유게시판으로 이동시에 저장되어 있는 DB를 불러오는 기능, 페이징처리
		
		logger.info("GET방식으로 자유게시판으로 이동합니다.");
		logger.info(req.toString());
		
		//DB페이징 처리 부분
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
		
		//페이징 처리된 리스트들을 모델이 담아 view로 보내는 부분, page는 글의 본문, paging은 페이징 처리시 리스트의 최종 갯수를 보낸다.
		model.addAttribute("page", page);
		model.addAttribute("paging", paging);
		
		//리턴할 주소
		return "/Board/BoardFree";
	}
	
	@RequestMapping(value="/boardWrite", method = RequestMethod.GET)
	public String boardWrite() throws Exception {
		//자유게시판에서 새글쓰기로 이동하는 기능
		
		logger.info("GET방식으로 새글쓰기로 이동합니다.");
		
		//리턴할 주소
		return "/Board/BoardWrite";
	}
	
	@RequestMapping(value="/boardWrite", method = RequestMethod.POST)
	public String boardWrite(BoardDto board, Model model, HttpSession session) throws Exception{
		//새글쓰기에서 DB로 저장하는 기능
		
		logger.info("POST방식으로 새글쓰기에서 DB에 저장합니다.");
		
		//DB에 저장하는 부분
		Bservice.regist(board, session);
		
		//글이 저장된 이후 다시 자유게시판으로 리다이렉트 시킨다.
		return "redirect:BoardFree";
	}
	
	@RequestMapping(value = "/boardContent", method = RequestMethod.GET)
	public String boardContent(@RequestParam("boardNo") int board_idx, Model model, HttpServletRequest req) throws Exception {
		//자유게시판에서 선택한 글의 본문으로 이동하는 기능, 페이징 처리
		
		logger.info("GET방식으로 자유게시판에서 선택한 글 본문으로 이동합니다.");	
		
		//페이징 처리 부분
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
		
		//페이징 처리된 리스트들을 모델이 담아 view로 보내는 부분, page는 글의 본문, paging은 페이징 처리시 리스트의 최종 갯수를 보낸다. boardRead는 글의 세부 내용을 보여준다.
		model.addAttribute("page", page);
		model.addAttribute("paging", paging);
		model.addAttribute("boardRead", Bservice.read(board_idx));
		
		//리턴할 주소
		return "/Board/BoardContent";
	}
	
	@RequestMapping(value="/boardModify", method = RequestMethod.GET)
	public String boardModify(@RequestParam("boardNo") int board_idx, Model model) throws Exception {
		//글 본문에서 글 수정화면으로 이동시키는 기능
		
		logger.info("GET방식으로 글 본문에서 글 수정 화면으로 이동합니다.");
		
		model.addAttribute("boardRead", Bservice.read(board_idx));
		
		//리턴할 주소
		return "/Board/BoardModify";
	}
	
	@RequestMapping(value="/boardModify", method = RequestMethod.POST)
	public String boardModify(BoardDto board, Model model) throws Exception {
		//글 수정화면에서 DB로 변경할 값들을 보내는 기능
		
		logger.info("POST방식으로 해당글의 내용을 수정합니다.");
		
		Bservice.modify(board);
		
		//자유게시판으로 리다이렉트 시킵니다.
		return "redirect:BoardFree";
	}
	
	@RequestMapping(value="/boardDelete", method = RequestMethod.GET)
	public String boardDelete(@RequestParam("boardNo") int board_idx) throws Exception {
		//글 본문에서 해당글을 삭제시키는 기능
		
		Bservice.remove(board_idx);
		
		//자유게시판으로 리다이렉트 시킵니다.
		return "redirect:BoardFree";
	}
	
	@RequestMapping(value="/commentRead", method = RequestMethod.POST)
	@ResponseBody
	public List<CommentDto> commentRead(@RequestParam("boardNo") int board_idx, Model model) throws Exception{
		//글 본문에서 해당글과 관련된 덧글을을 ajax를 이용하여 불러들이는 기능
		
		logger.info("POST방식과 AJAX로 글 본문에 덧글들을 불러들입니다.");
		logger.info(Integer.toString(board_idx));
		
		List<CommentDto> commentList = CService.commentRead(board_idx);
		
		logger.info(commentList.toString());
		
		//Ajax 통신으로 data를 보냅니다.
		return commentList;
	}
	
	@RequestMapping(value="/commentCreate", method = RequestMethod.POST)
	public String commentCreate(CommentDto commentDto, Model model) throws Exception{
		//글 본문에서 덧글을 작성하는 기능입니다.
		
		logger.info("POST방식으로 글 본문 밑에 덧글을 작성합니다.");
		logger.info(commentDto.toString());
		
		int num = commentDto.getBoard_idx();
		
		CService.commentRegist(commentDto);
		
		//글이 작성된 이후에 글 본문으로 리다이렉트 시킵니다.
		return "redirect:BoardContent?boardNo="+num;
	}
	
	@RequestMapping(value="/commentUpdate", method = RequestMethod.POST)
	public void commentUpdate(@RequestParam("comment_idx") int comment_idx, @RequestParam("session_id") String id) throws Exception {
		//글 본무에서 덧글을 수정하는 기능입니다. (현재는 완전삭제를 막아뒀기 때문에 수정기능이 삭제기능을 대신하고 있습니다. 덧글을 무단으로 수정하는 것을 방지하기 위해 본래 수정기능은 사용되지 않습니다.
		
		logger.info("POST방식으로 글 본문 밑에 덧글을 수정합니다.");
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
