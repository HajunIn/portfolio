package com.project.hajun.board.Dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.hajun.board.Vo.Attachment2;
import com.project.hajun.board.Vo.Board2;
import com.project.hajun.board.Vo.BoardComment;
import com.project.member.Vo.Member2;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Override
	public int insertBoard(SqlSession session, Board2 board) {
		return session.insert("member.insertBoard",board);
	}

	@Override
	public int insertAttachment(SqlSession session, Attachment2 a) {
		return session.insert("member.insertAttachment",a);
	}

	@Override
	public List<Board2> selectBoardList(SqlSession session, Map paramMap) {
		return session.selectList("member.selectBoardList",paramMap);
	}

	@Override
	public List<Attachment2> selectAttList(SqlSession session, String memberNo) {
		return session.selectList("member.selectAttList",memberNo);
	}

	@Override
	public List<Attachment2> whereSerch(SqlSession session, Map paramMap,int cPage, int numPerpage) {
		return session.selectList("member.whereSerch",paramMap,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int boardDelete(SqlSession session, String boardNo) {
		return session.delete("member.boardDelete",boardNo);
	}

	@Override
	public List<Attachment2> boardDetail(SqlSession session, String boardNo) {
		return session.selectList("member.boardDetail",boardNo);
	}

	@Override
	public Member2 memberDetail(SqlSession session, String memberNo) {
		return session.selectOne("member.memberDetail",memberNo);
	}

	@Override
	public int boardComment(SqlSession session, BoardComment bc) {
		return session.insert("member.boardComment",bc);
	}

	@Override
	public List<BoardComment> selectBoardComment(SqlSession session, String boardNo,int cPage, int numPerpage) {
		return session.selectList("member.selectBoardComment",boardNo,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int selectCount(SqlSession session, String boardNo) {
		return session.selectOne("member.selectCount",boardNo);
	}

	@Override
	public List<Attachment2> goodsList(SqlSession session, String memberNo,int cPage, int numPerpage) {
		return session.selectList("member.goodsList",memberNo,new RowBounds((cPage-1)*numPerpage,numPerpage));
	}

	@Override
	public int selectgoodCount(SqlSession session, String memberNo) {
		return session.selectOne("member.selectgoodCount",memberNo);
	}

	@Override
	public int selectBoardCount(SqlSession session) {
		return session.selectOne("member.selectBoardCount");
	}

	
	
	
	
	
	
}
