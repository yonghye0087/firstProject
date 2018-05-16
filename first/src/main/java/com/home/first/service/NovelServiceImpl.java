package com.home.first.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.home.first.dao.NovelDao;
import com.home.first.dto.NovelDto;
import com.home.first.dto.NovelProfileDto;

@Service
public class NovelServiceImpl implements NovelService{
	private static final Logger logger = LoggerFactory.getLogger(NovelServiceImpl.class);
	
	@Inject
	private NovelDao novelDao;
	
	@Override
	public void createNovel(NovelDto novelDto) throws Exception {
		//소설 생성 기능
		logger.info("createNovel");
		logger.info(novelDto.toString());
		novelDao.create(novelDto);		
	}

	@Override
	public List<NovelDto> readNovelByTl(int offset, int noOfRecords, String novel_title, String loginID) throws Exception {
		// 챕터별로 리스트를 불러오는 기능 한 페이지에 표시되는 화면을 제한한다.
		logger.info("readNovelByCh");
		logger.info(novel_title);
		return novelDao.readByTl(offset, noOfRecords, novel_title, loginID);
	}
	
	public List<NovelDto> readListByTl(int offset, int noOfRecords, String loginID) throws Exception {
		//로그인 한 아이디가 생성한 소설들을 목록으로 불러들인다.
		logger.info("readListByTl"+ offset +" : "+ noOfRecords);	
		return novelDao.readListByTl(offset, noOfRecords, loginID);
	}

	@Override
	public void updateNovel(NovelDto novelDto) throws Exception {
		// 소설을 수정하는 기능
		logger.info("updateNovel");
		logger.info(novelDto.toString());
		novelDao.update(novelDto);	
	}

	@Override
	public void deleteNovel(Integer novel_idx) throws Exception {
		// 소설 삭제 기능
		logger.info("deleteNovel");
		logger.info(Integer.toString(novel_idx));
		novelDao.delete(novel_idx);
	}
	
	@Override
	public void deleteNovelByTl(String novel_title) throws Exception {
		// 소설을 타이틀 별로 삭제
		logger.info("deleteNovelByTl");
		logger.info(novel_title);
		novelDao.deleteByTl(novel_title);		
	}

	@Override
	public int countByCh(String novel_title) throws Exception {
		//타이틀 내의 숫자를 카운트
		return novelDao.count(novel_title);
		
	}

	@Override
	public int countForList() throws Exception {
		// 소설의 타이틀의 숫자를 카운트
		return novelDao.listCount();
	}

	@Override
	public int readHitSum(String novel_title, String loginID) throws Exception {
		// 각 작품들의 조회수를 종합적으로 더해서 보여주기	
		return novelDao.readHitSum(loginID, novel_title);
	}

	@Override
	public NovelDto read(int novel_idx) throws Exception {
		// 소설 내용을 볼수 있는 화면 &수정 할때 화면을 불러올수 있는 화면
		return novelDao.read(novel_idx);
	}

	@Override
	public List<NovelProfileDto> readNovel() throws Exception {
		// serial novel list의 목록을 불러온다.
		return novelDao.novelList();
	}

	@Override
	public NovelProfileDto read(String novel_id, String novel_title) throws Exception {
		// 소설의 개별적으로 기입한 프로필을 읽어들여서 보여준다.
		logger.info(novel_id+" : "+novel_title);
		return novelDao.read(novel_id, novel_title);
	}

	@Override
	public void create(NovelProfileDto novelProfileDto) throws Exception {
		// 소설의 프로필을 저장한다.
		novelDao.create(novelProfileDto);
		
	}

	@Override
	public void updateForVi(String novel_title, int novel_visibility, String novel_id) throws Exception {
		novelDao.updateForVi(novel_title, novel_visibility, novel_id);
		
	}

	
}
