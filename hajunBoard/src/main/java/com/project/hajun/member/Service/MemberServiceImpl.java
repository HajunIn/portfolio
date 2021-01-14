package com.project.hajun.member.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.hajun.member.Dao.MemberDao;
import com.project.member.Vo.Member;
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao dao;
	@Autowired
	private SqlSession session;
	@Override
	public int memberList(Member m) {
		return dao.memberList(session,m);
	}
	
	
	
	

}
