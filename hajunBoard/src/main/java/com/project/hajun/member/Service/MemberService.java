package com.project.hajun.member.Service;

import java.util.List;
import java.util.Map;

import com.project.member.Vo.Member2;

public interface MemberService {
	
	int memberList(Member2 m);
	
	Member2 selectOneMember1(String userId);
	
	int memberModifi(Member2 paramMap);
	
	int selectOneMember2(String userId);

}
