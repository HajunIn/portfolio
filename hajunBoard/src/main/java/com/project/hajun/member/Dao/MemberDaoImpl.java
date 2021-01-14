package com.project.hajun.member.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.member.Vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public int memberList(SqlSession session,Member m) {
		return session.insert("member.memberList",m);
	}

	
	
}
