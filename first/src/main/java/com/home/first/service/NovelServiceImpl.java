package com.home.first.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.home.first.dao.NovelDao;
import com.home.first.dto.NovelDto;

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
	public List<NovelDto> readNovelByTl(int offset, int noOfRecords, String novel_title) throws Exception {
		// 챕터별로 리스트를 불러오는 기능 한 페이지에 표시되는 화면을 제한한다.
		logger.info("readNovelByCh");
		logger.info(novel_title);
		return novelDao.readByTl(offset, noOfRecords, novel_title);
	}
	
	public List<NovelDto> readListByTl(int offset, int noOfRecords) throws Exception {
		logger.info("readListByTl"+ offset +" : "+ noOfRecords);	
		return novelDao.readListByTl(offset, noOfRecords);
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

	
}
