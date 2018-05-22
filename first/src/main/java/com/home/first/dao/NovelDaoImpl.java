package com.home.first.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.home.first.dto.NovelDto;
import com.home.first.dto.NovelProfileDto;

@Repository
public class NovelDaoImpl implements NovelDao {
	private static final Logger logger = LoggerFactory.getLogger(NovelDaoImpl.class);
	
	@Inject
	private SqlSession sqlSession;
	
	int noOfRecords;
	
	private static String NS ="com.home.first.mapper.novelMapper";
	
	@Override
	public void create(NovelDto novelDto) throws Exception {
		//소설생성
		
		sqlSession.insert(NS+".createNovel", novelDto);
		
	}

	@Override
	public List<NovelDto> readByTl(int offset, int noOfRecords, String novel_title, String loginID) throws Exception {
		//소설 읽기(소설의 제목과 아이디로 구분하여 특정 소설 타이틀의 리스트를 불러온다.)
	
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("offset", offset);
		params.put("noOfRecords", noOfRecords);
		params.put("novel_title", novel_title);
		params.put("novel_id", loginID);
		return sqlSession.selectList(NS+".novelListByDesc", params);
	}

	@Override
	public void update(NovelDto novelDto) throws Exception {
		//소설 수정
		
		sqlSession.update(NS+".updateNovel", novelDto);
	}

	@Override
	public void delete(Integer novel_idx) throws Exception {
		//소설 삭제
		
		sqlSession.delete(NS+".deleteNovel", novel_idx);
	}
	@Override
	public void deleteByTl(String novel_title) throws Exception {
		//소설 삭제(타이틀을 기준으로 삭제하기)
		
		sqlSession.delete(NS+".deleteNovelByTl", novel_title);
	}
	@Override
	public int count(String novel_title) throws Exception {	
		//소설의 서브제목의 숫자를 읽어들인다.
		
		return sqlSession.selectOne(NS+".novelCount", novel_title);
	}

	@Override
	public List<NovelDto> readListByTl(int offset, int noOfRecords, String loginID) throws Exception {
		//소설 읽기(아이디를 기준으로 소설들의 제목을 읽어들인다)
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("offset", offset);
		params.put("noOfRecords", noOfRecords);
		params.put("novel_id", loginID);
		return sqlSession.selectList(NS+".novelListByTl", params);
	}

	@Override
	public int listCount() throws Exception {
		//소설의 타이틀이 몇개인지 읽어들인다.
		
		return sqlSession.selectOne(NS+".novelListCount");
	}

	@Override
	public int readHitSum(String loginID, String novel_title) throws Exception {
		//소설의 조회수를 합산하여 보여준다.
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("novel_id", loginID);
		params.put("novel_title", novel_title);
		return sqlSession.selectOne(NS+".novelHitSum", params);
	}

	@Override
	public NovelDto read(int novel_idx) throws Exception {
		//소설 읽기(디비의 저장번호로 단일 내용 읽기)
		
		return sqlSession.selectOne(NS+".readNovelByIdx", novel_idx);
	}

	@Override
	public List<NovelProfileDto> novelList() throws Exception {
		//소설의 리스트를 불러들인다(공개된 소설들만 불러들인다. 로그인을 하지 않고도 소설 리스트를 볼수 있도록)
		
		return sqlSession.selectList(NS+".novelListByVi");
	}
	@Override
	public List<NovelDto> novelListfor(int offset, int noOfRecords) throws Exception {
		//소설의 리스트를 불러들인다(공개된 소설들만 불러들인다. 로그인을 하지 않고도 소설 리스트를 볼수 있도록)
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("offset", offset);
		params.put("noOfRecords", noOfRecords);
		return sqlSession.selectList(NS+".novelListByViForHit", params);
	}

	@Override
	public NovelProfileDto readProfile(String novel_id, String novel_title) throws Exception {
		//소설의 프로필을 읽어들인다.
		logger.info(novel_id+" : "+novel_title);
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("novel_id", novel_id);
		params.put("novel_title", novel_title);
		return sqlSession.selectOne(NS+".novelProfile", params);
	}

	@Override
	public void create(NovelProfileDto novelProfileDto) throws Exception {
		//소설의 프로필을 만든다.
		logger.info(novelProfileDto.toString());
		sqlSession.insert(NS+".createNovelProfile", novelProfileDto);
		
	}

	@Override
	public void updateForVi(String novel_title, int novel_visibility, String novel_id) throws Exception {
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("novel_id", novel_id);
		params.put("novel_title", novel_title);
		params.put("novel_visibility", novel_visibility);
		int result = sqlSession.update(NS+".updateForVi", params);
		logger.info(Integer.toString(result));
		sqlSession.update(NS+".updateForProVi",params);
	}

	@Override
	public List<NovelDto> readNovelByVi(int offset, int noOfRecords) throws Exception {
		// 공개설정된 소설 리스트를 페이징 해서 불러온다.
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("offset", offset);
		params.put("noOfRecords", noOfRecords);
		return sqlSession.selectList(NS+".novelByVi", params);
	}

	@Override
	public List<NovelProfileDto> novelProfileList(int offset, int noOfRecords, String novel_id) throws Exception {
		// 아이디로 검색해 소설의 프로필 리스트를 읽는 기능
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("offset", offset);
		params.put("noOfRecords", noOfRecords);
		params.put("novel_id", novel_id);
		return sqlSession.selectList(NS+".novelListByid", params);
	}

	@Override
	public boolean profileModity(String novel_title, String novel_nickname) throws Exception {
		// 개인 프로필을 수정하는 기능
		return false;
	}

	
}
