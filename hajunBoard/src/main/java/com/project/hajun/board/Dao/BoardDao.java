package com.project.hajun.board.Dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.project.hajun.board.Vo.Attachment2;
import com.project.hajun.board.Vo.Board2;
import com.project.hajun.board.Vo.BoardComment;
import com.project.hajun.board.Vo.PurchaseDetail;
import com.project.member.Vo.Member2;

public interface BoardDao {
	
	int insertBoard(SqlSession session,Board2 board);
	
	int insertAttachment(SqlSession session,Attachment2 a);
	
	List<Board2> selectBoardList(SqlSession session,Map paramMap);

	List<Attachment2> selectAttList(SqlSession session, String memberNo);

	List<Attachment2> whereSerch(SqlSession session, Map paramMap, int cPage, int numPerpage);

	int boardDelete(SqlSession session,String boardNo);

	List<Attachment2> boardDetail(SqlSession session, String boardNo);

	Member2 memberDetail(SqlSession session, String memberNo);


	int boardComment(SqlSession session, BoardComment bc);

	List<BoardComment> selectBoardComment(SqlSession session, String boardNo, int cPage, int numPerpage);
	
	int selectCount(SqlSession session, String boardNo);
	
	List<Attachment2> goodsList(SqlSession session, String memberNo,int cPage,int numPerpage);

	int selectgoodCount(SqlSession session, String memberNo);

	int selectBoardCount(SqlSession session);
	
	int insertPurchase(SqlSession session, String memberNo );
	
	int inaertPurchaseDetail(SqlSession session,String boardNoList);
}
