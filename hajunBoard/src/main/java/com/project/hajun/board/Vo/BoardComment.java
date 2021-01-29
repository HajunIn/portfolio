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
public class BoardComment {
	
	private int commentNo;
	private int boardNo;
	private String commentTitle;
	private String commentContent;
	private Date commentDate;
	
	private String boardWriter;
	private String renamedFilename;
	

}
