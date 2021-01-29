package com.project.hajun.board.Service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.hajun.board.Dao.BoardDao;
import com.project.hajun.board.Vo.Attachment2;
import com.project.hajun.board.Vo.Board2;
import com.project.hajun.board.Vo.BoardComment;
import com.project.member.Vo.Member2;



@Service

public class BoardServiceImpl implements BoardService {


	@Autowired
	SqlSession session;
	
	@Autowired
	BoardDao dao;

	@Override
	public int insertBoard(Board2 board, List<Attachment2> files) {

		int result =dao.insertBoard(session, board);
		if(result>0) {
			if(files!=null) {
				for(Attachment2 a:files) {
					a.setBoardNo(board.getBoardNo());
					result=dao.insertAttachment(session,a);
				}
			}
		}
		return result;
	}

	@Override
	public List<Board2> selectBoardList(Map paramMap) {
		return dao.selectBoardList(session,paramMap);
	}

	@Override
	public List<Attachment2> selectAttList(String memberNo) {
		return dao.selectAttList(session,memberNo);
	}

	@Override
	public List<Attachment2> whereSerch(Map paramMap, int cPage, int numPerpage) {
		return dao.whereSerch(session, paramMap, cPage, numPerpage);
	}

	@Override
	public int boardDelete(String boardNo) {
		return dao.boardDelete(session, boardNo);
	}

	@Override
	public List<Attachment2> boardDetail(String boardNo) {
		return dao.boardDetail(session,boardNo);
	}

	@Override
	public Member2 memberDetail(String memberNo) {
		return dao.memberDetail(session, memberNo);
	}

	@Override
	public int boardComment(BoardComment bc) {
		return dao.boardComment(session, bc);
	}

	@Override
	public List<BoardComment> selectBoardComment(String boardNo, int cPage, int numPerpage) {
		return dao.selectBoardComment(session, boardNo, cPage, numPerpage);
	}

	@Override
	public int selectCount(String boardNo) {
		return dao.selectCount(session,boardNo);
	}

	@Override
	public List<Attachment2> goodsList(String memberNo ,int cPage,int numPerpage) {
		return dao.goodsList(session, memberNo,cPage,numPerpage);
	}

	@Override
	public int selectgoodCount(String memberNo) {
		return dao.selectgoodCount(session,memberNo);
	}

	@Override
	public int selectBoardCount() {
		return dao.selectBoardCount(session);
	}
	
	
	
	
	
	
	

	

}
