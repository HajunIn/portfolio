package com.project.member.Vo;

import java.sql.Date;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member2 {
	
	private int memberNo;
	private String userId;
	private String password;
	private String userName;
	private String gender;
	private int age;
	private String email;
	private String phone;
	private String address;
	private Date enrollDate;
	private String[] memberType;
	private String detailAddress;

}
