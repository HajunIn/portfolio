package com.project.hajun.member.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.project.member.Vo.Member;

public interface MemberDao {
	
	int memberList(SqlSession session, Member m);

}
