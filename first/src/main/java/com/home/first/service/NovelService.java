package com.home.first.service;

import java.util.List;

import com.home.first.dto.NovelDto;

public interface NovelService {
	public void createNovel(NovelDto novelDto) throws Exception;
	public NovelDto read(int novel_idx) throws Exception;
	public List<NovelDto> readNovelByTl(int offset, int noOfRecords, String novel_title, String loginID) throws Exception;
	public List<NovelDto> readListByTl(int offset, int noOfRecords, String loginID) throws Exception;
	public void updateNovel(NovelDto novelDto) throws Exception;
	public void deleteNovel(Integer novel_idx) throws Exception;
	public void deleteNovelByTl(String novel_title) throws Exception;
	public int countByCh(String novel_title) throws Exception;
	public int countForList() throws Exception;
	public int readHitSum(String novel_title, String loginID) throws Exception;
	public List<NovelDto> readNovel() throws Exception;
}