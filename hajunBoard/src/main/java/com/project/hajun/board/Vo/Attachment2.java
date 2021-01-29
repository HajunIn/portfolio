package com.project.hajun.board.Vo;





import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Attachment2 {
	private int attachmentNo;
	private int boardNo;
	private String originalFilename;
	private String renamedFilename;
	private Date uploadDate;
	
	private String boardTitle;
	private String boardContent;
	private String boardDate;
	private String boardWriter;
	private int price;
	private int memberNo;
	private String[] memberType;
}
