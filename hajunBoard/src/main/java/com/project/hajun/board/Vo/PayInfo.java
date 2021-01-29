package com.project.hajun.board.Vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PayInfo {
	
	private int payInfoNo;
	private int boardNo;
	private int memberNo;
	private int payPrice;
	private Date payDate;

}
