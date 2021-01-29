package com.project.hajun.member.Dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.member.Vo.Member2;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public int memberList(SqlSession session,Member2 m) {
		return session.insert("member.memberList",m);
	}

	@Override
	public Member2 selectOneMember1(SqlSession session, String userId) {
		return session.selectOne("member.selectOneMember1",userId);
	}

	@Override
	public int memberModifi(SqlSession session, Member2 paramMap) {
		return session.update("member.memberModifi", paramMap);
	}

	@Override
	public int selectOneMember2(SqlSession session, String userId) {
		return session.selectOne("member.selectOneMember2",userId);
	}

	
	
	
	
}
