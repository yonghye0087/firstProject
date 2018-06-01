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
	//소설의 프로필을 읽어들인다.
	public NovelProfileDto readProfile(String novel_id, String novel_title) throws Exception;
	//소설의 프로필을 번호로 읽어들인다.
	public NovelProfileDto readProfileByMo(int novel_title_idx) throws Exception;
	//아이디를 검색해 해당 소설프로필들을 읽어들인다.
	public List<NovelProfileDto> readNovelProfile(int offset, int noOfRecords, String novel_id) throws Exception;
	//소설의 프로필을 저장한다
	public void create(NovelProfileDto novelProfileDto) throws Exception;
	//소설의 공개여부만 변경
	public void updateForVi(String novel_title ,int novel_visibility, String novel_id) throws Exception;
	//공개 상태로 돌려진 소설들의 리스트를 페이징해서 불러들인다.
	public List<NovelDto> readNovelVi(int offset, int noOfRecords) throws Exception;
	//공개 소설 중 조회수 합산 기준으로 상위 5개만 조회하는 기능
	public List<NovelDto> novelListfor(int offset, int noOfRecords) throws Exception;
	//개인 프로필을 수정하는 기능
	public boolean profileModity(NovelProfileDto novelProfileDto) throws Exception;
	//소설에서 제목 또는 작성자를 검색하는 기능
	public List<NovelDto> novelSearch(String text, int offset, int noOfRecords) throws Exception;
	//소설의 제목 또는 작성자를 검색할때 총 갯수를 가져오는 기능
	public int novelSearchCount(String text) throws Exception;
	//소설의 조회수를 추가하는 기능
	public void novelHitPlus(int novel_idx) throws Exception;
}
