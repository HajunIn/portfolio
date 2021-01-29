package com.project.hajun.member.Dao;

import org.apache.ibatis.session.SqlSession;

import com.project.member.Vo.Member2;

public interface MemberDao {
	
	int memberList(SqlSession session, Member2 m);

	
	Member2 selectOneMember1(SqlSession session, String userId);
	
	int memberModifi(SqlSession session, Member2 paramMap);
	
	int selectOneMember2(SqlSession session, String userId);
}
