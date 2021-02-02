package com.project.hajun.board.Service;

import java.util.List;
import java.util.Map;

import com.project.hajun.board.Vo.Attachment2;
import com.project.hajun.board.Vo.Board2;
import com.project.hajun.board.Vo.BoardComment;
import com.project.hajun.board.Vo.Purchase;
import com.project.hajun.board.Vo.PurchaseDetail;
import com.project.member.Vo.Member2;

public interface BoardService {
	
	List<Board2> selectBoardList(Map paramMap);
	List<Attachment2> selectAttList(String memberNo);

	int insertBoard(Board2 board,List<Attachment2> files);

	List<Attachment2> whereSerch( int cPage, int numPerpage);
	
	int boardDelete(String boardNo);
	
	List<Attachment2> boardDetail(String boardNo);
	
	Member2 memberDetail(String memberNo);
	
	int boardComment(BoardComment bc);

	List<BoardComment> selectBoardComment(String boardNo,int cPage, int numPerpage);
	
	int selectCount(String boardNo);
	
	List<Attachment2> goodsList(String memberNo,int cPage,int numPerpage);
	
	int selectgoodCount(String memberNo);
	
	int selectBoardCount();
	
	int insertPurchase(List list, String memberNo);
}
