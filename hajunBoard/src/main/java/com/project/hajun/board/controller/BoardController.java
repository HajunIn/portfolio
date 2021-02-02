package com.project.hajun.board.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.project.hajun.board.Service.BoardService;
import com.project.hajun.board.Vo.Attachment2;
import com.project.hajun.board.Vo.Board2;
import com.project.hajun.board.Vo.BoardComment;
import com.project.hajun.board.Vo.Purchase;
import com.project.hajun.board.Vo.PurchaseDetail;
import com.project.hajun.pageBar.PageBar;
import com.project.member.Vo.Member2;

@Controller
@SessionAttributes("commonLogin")
public class BoardController {

	@Autowired
	BoardService service;

	@RequestMapping("/board/board.do")
	public ModelAndView boardList(HttpServletRequest request, ModelAndView mv,
			// 페이지바 만들기
			@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "10") int numPerpage) {

		// mv.addObject("list", service.boardList(cPage, numPerpage));
		 

		 
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String memberNo1 = request.getParameter("memberNo");
		paramMap.put("memberNo", memberNo1);

		List<Attachment2> board = service.whereSerch( cPage, numPerpage);
		int totalData = service.selectBoardCount(); /* 이거페이지바 */

		 mv.addObject("pageBar", PageBar.getPageBar3(totalData, cPage,numPerpage, "board.do"));
		 mv.addObject("totalData", totalData);
		
			
			
		System.out.println("결과" + board);
		// System.out.println("결과2"+att);
		mv.addObject("board", board);
		// mv.addObject("att", att);
		mv.setViewName("board/board");

		return mv;
	}

	@RequestMapping("/board/selectBoard.do")
	public ModelAndView selectBoard(HttpServletRequest request, ModelAndView mv, String title, String con, Date sDate,
			Date eDate, String text,  int price,
			@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "10") int numPerpage) {

		System.out.println("1" + title);
		System.out.println("2" + con);
		System.out.println("3" + sDate);
		System.out.println("4" + eDate);
	
		System.out.println("5" + price);
		Map<String, Object> paramMap = new HashMap<String, Object>();
		String title1 = request.getParameter("title");
		paramMap.put("title", title1);
		String con1 = request.getParameter("con");
		paramMap.put("con", con1);
		String sDate1 = request.getParameter("sDate");
		paramMap.put("sDate", sDate1);
		String eDate1 = request.getParameter("eDate");
		paramMap.put("eDate", eDate1);
		String memberNo1 = request.getParameter("memberNo");
		paramMap.put("memberNo", memberNo1);
		String price1 = request.getParameter("price");
		paramMap.put("price", price1);
		List<Attachment2> board = service.whereSerch( cPage, numPerpage);
		mv.addObject("board", board);
		int totalData = service.selectBoardCount(); /* 이거페이지바 */
		
		/*
		 * Member2 mem = service.memberDetail(memberNo); mv.addObject("mem", mem);
		 * mv.addObject("memberType", String.join(",", mem.getMemberType()));
		 * ArrayList<String> arrayList = new ArrayList<>();
		 * 
		 * for(String temp : mem.getMemberType()){
		 * 
		 * arrayList.add(temp);
		 * 
		 * } System.out.println("진짜 결과는!?"+arrayList);
		 * 
		 * mv.addObject("arrayList", arrayList);
		 */

		 mv.addObject("pageBar", PageBar.getPageBar3(totalData, cPage,numPerpage, "board.do"));
		 mv.addObject("totalData", totalData);
		mv.setViewName("board/board");
		System.out.println("======" + board);
		return mv;
	}

	@RequestMapping("/borad/boardForm.do")
	public String boardForm() {
		return "/board/BoardInsert";
	}

	@RequestMapping("/board/boardInsert.do")
	public ModelAndView boardInsert(Board2 board, ModelAndView mv,String memberNo2,
			@RequestParam(value = "upFile", required = false) MultipartFile upFile, HttpSession session) {
		System.out.println(":"+memberNo2);
		// 업로드 하기위해서는 실제 경로를 가져와야함
		String path = session.getServletContext().getRealPath("/resources/upload/board");

		File dir = new File(path);
		if (!dir.exists())
			dir.mkdirs();// 폴더를 생성
		List<Attachment2> files = new ArrayList();// 어테치먼드 배열을 보관하는 배열
		// 다중파일 업로드하기 MultipartFile객체의 transferTo()메소드이용 파일을 저장
		// renames처리 해줘야함 -> 리네임드란 file명을 재정의 하는것 (중복 파일이름이 되었을때 덮어쓰는걸 막는것)

		if (!upFile.isEmpty()) {
			// 파일명생성하기
			String originalName = upFile.getOriginalFilename();
			String ext = originalName.substring(originalName.lastIndexOf(".") + 1);

			// 리네임규칙
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rndValue = (int) (Math.random() * 10000);
			String reName = sdf.format(System.currentTimeMillis()) + "_" + rndValue + "." + ext;
			try {
				upFile.transferTo(new File(path + "/" + reName));
			} catch (IOException e) {
				e.printStackTrace();
			}
			Attachment2 a = Attachment2.builder().originalFilename(originalName).renamedFilename(reName).build();
			files.add(a);
		}

		int result = service.insertBoard(board, files);
		mv.addObject("msg", result > 0 ? "입력성공" : "입력실패");
		mv.addObject("loc", "/board/board.do?memberNo="+memberNo2);
		mv.setViewName("common/msg");
		return mv;
	}

	
	  @RequestMapping("/board/boardDelete.do") public ModelAndView
	  boardDelete(Board2 b,ModelAndView mv,HttpServletRequest request, String
	  boardNo,String memberNo,@RequestParam(value = "cPage", defaultValue = "1") int cPage,
		@RequestParam(value = "numPerpage", defaultValue = "10") int numPerpage) {
	  
	  System.out.println("ㅎㅎㅎㅎ"+boardNo);
	  
	  Map<String, Object> paramMap = new HashMap<String, Object>(); //
	  paramMap.put("memberNo", memberNo);
	  
	  int result=service.boardDelete(boardNo); 
	  String msg = ""; 
	  String loc = "";
	  
	  if (result > 0) { 
		  mv.addObject("board", service.whereSerch( cPage, numPerpage)); 
		  int totalData = service.selectBoardCount(); /* 이거페이지바 */
			/*
			 * Member2 mem = service.memberDetail(memberNo); mv.addObject("mem", mem);
			 * mv.addObject("memberType", String.join(",", mem.getMemberType()));
			 * ArrayList<String> arrayList = new ArrayList<>();
			 * 
			 * for(String temp : mem.getMemberType()){
			 * 
			 * arrayList.add(temp);
			 * 
			 * } System.out.println("진짜 결과는!?"+arrayList);
			 * 
			 * mv.addObject("arrayList", arrayList);
			 */

			 mv.addObject("pageBar", PageBar.getPageBar2(totalData, cPage,numPerpage,memberNo, "board.do"));
			 mv.addObject("totalData", totalData);
		  msg ="삭제 성공!"; 
	  loc = "/"; 
	  } else { msg = "삭제실패!"; 
	  loc ="/board/boardDelete.do?boardNo=" + b.getBoardNo(); }
	  
	  mv.addObject("msg",msg);
	  mv.addObject("loc",loc);
	 mv.setViewName("common/msg");
	 return mv; 
	 
	  }
	 
	  
	  @RequestMapping("/board/boardDetail.do")
	  public ModelAndView boardDetail(ModelAndView mv, String boardNo
			  , @RequestParam(value = "cPage", defaultValue = "1") int cPage,
				@RequestParam(value = "numPerpage", defaultValue = "5") int numPerpage) {
		  System.out.println("나오니"+boardNo);
		  List<Attachment2> att = service.boardDetail(boardNo);
			List<BoardComment> b = service.selectBoardComment(boardNo, cPage, numPerpage);
		  System.out.println("sss"+att);
		  mv.addObject("att", att);
		  mv.addObject("b", b);
			
		  int totalData = service.selectCount(boardNo); /* 이거페이지바 */
			System.out.println("페이지바" + totalData);
			mv.addObject("totalData", totalData);
		  mv.addObject("pageBar", PageBar.getPageBar(totalData, cPage, numPerpage,boardNo, "boardDetail.do"));
		  mv.setViewName("board/boardDetailList");
		  return mv;
			
	  }
		 @RequestMapping("/member/memberDetail.do")
		  public ModelAndView memberDetail(ModelAndView mv, String memberNo) {
			  System.out.println("나오니"+memberNo);
			  Member2 mem = service.memberDetail(memberNo);
			  System.out.println("sss"+mem);
			  mv.addObject("mem", mem);
			  mv.addObject("memberType", String.join(",", mem.getMemberType()));
			 System.out.println("???"+mem.getMemberType());
			  ArrayList<String> arrayList = new ArrayList<>();

				for(String temp : mem.getMemberType()){

				  arrayList.add(temp);

				}
				System.out.println("진짜 결과는!?"+arrayList);
				
				mv.addObject("arrayList", arrayList);
			  mv.setViewName("member/memebrDetail");
			  return mv;
				
		  }
		 @RequestMapping("/board/comment.do")
		 @ResponseBody
		 public ModelAndView comment( ModelAndView mv,String commentTitle,String commentContent,String boardNo,BoardComment bc
			, @RequestParam(value = "cPage", defaultValue = "1") int cPage,
			@RequestParam(value = "numPerpage", defaultValue = "5") int numPerpage	){
		

//			 System.out.println("dddddddd===================");
//			 System.out.println("gggg"+title+con);
//			 System.out.println("????"+boardNo);
			 
//		Map<String, Object> paramMap = new HashMap<String, Object>(); //
//			paramMap.put("title",title);
//			paramMap.put("con",con);
//			paramMap.put("boardNo",boardNo);
			  List<Attachment2> att = service.boardDetail(boardNo);
			
			
			int result = service.boardComment(bc);
			int totalData = service.selectCount(boardNo); /* 이거페이지바 */
			System.out.println("페이지바" + totalData);
			List<BoardComment> b = service.selectBoardComment(boardNo,cPage, numPerpage);
			mv.addObject("pageBar", PageBar.getPageBar(totalData, cPage, numPerpage,boardNo, "comment.do"));
			System.out.println("머나와?"+b);
			mv.addObject("b", b);
			mv.addObject("att", att);
			mv.setViewName("board/boardDetailList");
			return mv;
	

					
			// return bc.getCommentTitle()+"/"+bc.getCommentContent();
		 }
		 
		 @RequestMapping("/board/goodsList.do")
		 public ModelAndView goodsList(ModelAndView mv, String memberNo,@RequestParam(value = "cPage", defaultValue = "1") int cPage,
					@RequestParam(value = "numPerpage", defaultValue = "8") int numPerpage) {
			 System.out.println("나와라"+memberNo);
			 
			 List<Attachment2> board = service.goodsList(memberNo,cPage, numPerpage);
			 
			 
			 int totalData = service.selectgoodCount(memberNo); /* 이거페이지바 */
				System.out.println("페이지바" + totalData);
				mv.addObject("totalData", totalData);
			  mv.addObject("pageBar", PageBar.getPageBar2(totalData, cPage, numPerpage,memberNo, "goodsList.do"));
			 System.out.println("결과"+board);
			 mv.addObject("board", board);
			 mv.setViewName("goods/goods");
			 return mv;
		 }
		 
		 @RequestMapping("/board/goodsPay.do")
		 public ModelAndView goodsPay(HttpServletRequest request, ModelAndView mv,@RequestParam(value = "boardNo2", required = false) String boardNo, 
				 Purchase Purchase, String memberNo) {
			// String[] arrayParam = request.getParameterValues("boardNo");
			 	
			 String pd=boardNo;

			 String[] arr = pd.split(",");
			 
			 List list = new ArrayList();
			 for(String a : arr) {
				 System.out.println(a.toString());
				 PurchaseDetail boardNoList = new PurchaseDetail();
				 boardNoList.setBoardNo(a);
				 list.add(boardNoList);
			
			 }
			 
		
			 System.out.println("????"+list);
			 int p = service.insertPurchase(list,memberNo);
			 
		
			 System.out.println("왜 안되지?"+boardNo);
			
			
			
				
			 
			
			 
//			 Map<String, Object> paramMap = new HashMap<String, Object>();
//				paramMap.put("boardNoList", boardNoList);
//				paramMap.put("patTotalPrice", patTotalPrice);
			
			
			
		//	 System.out.println("결과는"+p);
			 
			 mv.setViewName("goods/pay");
			 return mv;
		 }
		 
		 @RequestMapping("/board/payTrue.do")
		public ModelAndView payTrue(ModelAndView mv) {
			
			 
			 mv.setViewName("goods/payTrue");
			
			return mv;		 
		 }
		 
		 @RequestMapping("/board/purchase.do")
			public ModelAndView purchase(Board2 board, ModelAndView mv,String memberNo2,
					 HttpSession session) {
				System.out.println(":"+memberNo2);
				// 업로드 하기위해서는 실제 경로를 가져와야함
				String path = session.getServletContext().getRealPath("/resources/upload/board");

				File dir = new File(path);
				if (!dir.exists())
					dir.mkdirs();// 폴더를 생성
				List<Attachment2> files = new ArrayList();// 어테치먼드 배열을 보관하는 배열
				// 다중파일 업로드하기 MultipartFile객체의 transferTo()메소드이용 파일을 저장
				// renames처리 해줘야함 -> 리네임드란 file명을 재정의 하는것 (중복 파일이름이 되었을때 덮어쓰는걸 막는것)


				int result = service.insertBoard(board, files);
				mv.addObject("msg", result > 0 ? "입력성공" : "입력실패");
				mv.addObject("loc", "/board/board.do?memberNo="+memberNo2);
				mv.setViewName("common/msg");
				return mv;
			}
		 
		 @RequestMapping("/board/test.do")
		 public String text() {
			 System.out.println("++++++");
			 return "/board/test";
		 }
		 
	  
	 
}
