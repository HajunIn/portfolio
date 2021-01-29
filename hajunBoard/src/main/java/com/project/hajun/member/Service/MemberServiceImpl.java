package com.project.hajun.member.Service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.hajun.member.Dao.MemberDao;
import com.project.member.Vo.Member2;
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao dao;
	@Autowired
	private SqlSession session;
	@Override
	public int memberList(Member2 m) {
		return dao.memberList(session,m);
	}
	@Override
	public Member2 selectOneMember1(String userId) {
		return dao.selectOneMember1(session,userId);
	}
	@Override
	public int memberModifi(Member2 paramMap) {
		return dao.memberModifi(session, paramMap);
	}
	@Override
	public int selectOneMember2(String userId) {
		return dao.selectOneMember2(session,userId);
	}
	
	
	
	
	

}
