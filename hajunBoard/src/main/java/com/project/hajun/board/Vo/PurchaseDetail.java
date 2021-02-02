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
public class PurchaseDetail {
	
	private int PurchaseNo;
	private String boardNo;
	private Date payDate;
	

}
