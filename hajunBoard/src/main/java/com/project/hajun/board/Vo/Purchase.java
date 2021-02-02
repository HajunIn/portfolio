package com.project.hajun.board.Vo;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Purchase {
	
	private int PurchaseNo;
	private int memberNo;
}
