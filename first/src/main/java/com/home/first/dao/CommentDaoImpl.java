package com.home.first.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.home.first.dto.CommentDto;

@Repository
public class CommentDaoImpl implements CommentDao {
	private static String NS ="com.home.first.mapper.commentMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void commentCreate(CommentDto commentDto) throws Exception {
		sqlSession.insert(NS+".commentCreate", commentDto);
	}

	@Override
	public List<CommentDto> commentRead(Integer board_idx) throws Exception {
		return sqlSession.selectList(NS+".commentRead", board_idx);
	}
	
	@Override
	public void commentDelete(Integer comment_idx) throws Exception {
		// 리플의 완전 삭제는 운영자 권한으로 정보삭제시 사용하기 위함.
		sqlSession.delete(NS+".commentDelete, comment_idx");
	}

	@Override
	public void commentUpdate(CommentDto commentDto) throws Exception {
		// 리플 삭제시 완전 삭제가 아닌 내용이 삭제되었다는 흔적을 남기기 위한 업데이트(삭제 대용으로 사용될것.)
		sqlSession.update(NS+".commentUpdate", commentDto);
	}

	@Override
	public List<CommentDto> commentCheck(Integer comment_idx) throws Exception {
		return sqlSession.selectList(NS+".commentCheck", comment_idx);
	}
}
