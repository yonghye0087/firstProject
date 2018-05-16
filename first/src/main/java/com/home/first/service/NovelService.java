package com.home.first.service;

import java.util.List;

import com.home.first.dto.NovelDto;
import com.home.first.dto.NovelProfileDto;

public interface NovelService {
	//소설생성
	public void createNovel(NovelDto novelDto) throws Exception;
	//소설 읽기(디비의 저장번호로 단일 내용 읽기)
	public NovelDto read(int novel_idx) throws Exception;
	//소설 읽기(소설의 제목과 아이디로 구분하여 특정 소설 타이틀의 리스트를 불러온다.)
	public List<NovelDto> readNovelByTl(int offset, int noOfRecords, String novel_title, String loginID) throws Exception;
	//소설 읽기(아이디를 기준으로 소설들의 제목을 읽어들인다)
	public List<NovelDto> readListByTl(int offset, int noOfRecords, String loginID) throws Exception;
	//소설 수정
	public void updateNovel(NovelDto novelDto) throws Exception;
	//소설 삭제
	public void deleteNovel(Integer novel_idx) throws Exception;
	//소설 삭제(타이틀을 기준으로 삭제하기)
	public void deleteNovelByTl(String novel_title) throws Exception;
	//소설의 서브제목의 숫자를 읽어들인다.
	public int countByCh(String novel_title) throws Exception;
	//소설의 타이틀이 몇개인지 읽어들인다.
	public int countForList() throws Exception;
	//소설의 조회수를 합산하여 보여준다.
	public int readHitSum(String novel_title, String loginID) throws Exception;
	//소설의 리스트를 불러들인다(공개된 소설들만 불러들인다. 로그인을 하지 않고도 소설 리스트를 볼수 있도록)
	public List<NovelProfileDto> readNovel() throws Exception;
	//소설의 피로필을 읽어들인다.
	public NovelProfileDto read(String novel_id, String novel_title) throws Exception;
	//소설의 프로필을 저장한다
	public void create(NovelProfileDto novelProfileDto) throws Exception;
	//소설의 공개여부만 변경
	public void updateForVi(String novel_title ,int novel_visibility, String novel_id) throws Exception;
}
