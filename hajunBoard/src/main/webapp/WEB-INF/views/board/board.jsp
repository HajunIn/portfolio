<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.project.member.Vo.Member2,java.util.*" %>
<%
	String[] memberType=((Member2)request.getAttribute("mem")).getMemberType();
	List<String> list=new ArrayList();
	if(memberType!=null){
		list=Arrays.asList(memberType);//배열을 리스스로 변환
	}

%>

<style>
.click,#btn-add{
  right: 0;
    top: 0;
    color:black;
    text-align: center;
    width: 200px;
    height: 50px;
    font-size: 14px;
    font-weight: bold;
    border-radius: 5px;
    margin-right: 10px;
    margin-top: 20px;
     margin-bottom: 20px;
    margin-left: 90px;
}
#x{
right: 0;
    top: 0;
    color:black;
    text-align: center;
    width: 60px;
    height: 50px;
    font-size: 14px;
    font-weight: bold;
    border-radius: 5px;
    margin-top: 50px;
     margin-bottom: 20px;
   

    
}
#x2{
right: 0;
    top: 0;
    color:black;
    text-align: center;
    width: 200px;
    height: 50px;
    font-size: 14px;
    font-weight: bold;
    border-radius: 5px;
    margin-top: 50px;
     margin-bottom: 20px;
     margin-left: 800px;
   

    
}
.mt-3{
padding-top: 50px;
}
.hradTitle{
width: 160px;
text-align: center;
margin-left: -10px;
}


.table-responsive::-webkit-scrollbar {
    display: none;
}
</style>

<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=" "/>
</jsp:include>
<section id="content" >

<div class="container my-5 py-3 z-depth-1 rounded">


  <!--Section: Content-->
  <div class="dark-grey-text" >

    <!-- Shopping Cart table -->
    <div class="table-responsive" >
    <div style="display: flex; justify-content: center;">
    <button class="click">조건 설정하기</button>

   <c:if test="${memberType eq 2 }"> 
    <button type="button" id="btn-add"  onclick="location.href='${path}/borad/boardForm.do'">글쓰기</button>
  </c:if> 
    </div>
    <div class="selectBox" style=" justify-content:center; width:100%;  height:250px; display: none; text-align: center;">
    <form action="${path }/board/selectBoard.do" method="post" onsubmit="return fn_selectBoard();">
	<div class="container z-depth-1 my-5 p-5">

  <!-- Section -->
  <div class="selectBox" style="margin-top: -100px; " >

    <h4 class="font-weight-normal text-center dark-grey-text my-4 pb-2">
Search for what you want</h4>
    
    <!--First row-->
    <div class="row d-flex justify-content-center" style="margin-left: -150px;">
	<div style="display: flex;">
      <div class="col-md-6 col-lg-3 mb-4">

        <!-- Material outline input -->
        <div class="md-form md-outline form-lg hradTitle" >
          <label for="form1">Title</label>
          <input type="hidden" name="memberNo" value="${commonLogin.memberNo }">
          <input type="text" id="form1" name="title" class="form-control form-control-lg" placeholder="제목" style="width: 150px; height:30px; font-size: 13px;">
        </div>
        
      </div>
      
      <div class="col-md-6 col-lg-3 mb-4">
        
        <!-- Material outline input -->
        <div class="md-form md-outline form-lg hradTitle">
          <label for="form2">Content</label>
          <input type="text" id="form2" name="con" class="form-control form-control-lg" placeholder="내용" style="width: 150px; height:30px; font-size: 13px;">
        </div>
        
      </div>
      
      <div class="col-md-6 col-lg-3 mb-4">
        
        <!-- Material outline input -->
       <div class="md-form md-outline form-lg hradTitle">
          <label for="form3">StartDate</label>
          <input type="date" id="form3" name="sDate" class="form-control form-control-lg" style="width: 150px; height:30px;  font-size: 13px;">
        
        
        </div>
        
      
        
      </div>
      <div class="col-md-6 col-lg-3 mb-4">
      
        <div class="md-form md-outline form-lg hradTitle">
          <label for="form4">EndDate</label>
          <input type="date" id="form4" name="eDate" class="form-control form-control-lg" style="width: 150px; height:30px; font-size: 13px;">
        </div>  
        

      </div>
       <div class="col-md-6 col-lg-3 mb-4">
      
        <div class="md-form md-outline form-lg hradTitle" >
          <label for="form4">Price</label>
          <input type="number" min="0" max="1000000" step="5000" id="form5" name="price" placeholder="0" value="0" class="form-control form-control-lg" style=" width: 150px; height:30px; font-size: 13px;">
        </div>  
        

      </div>
      </div>

    </div>
      <div style="display:flex; justify-content: center;">
        
        <input type="submit"  style="margin-right: 30px; width:100px;" value="Select">
         <input type="button" id="close" style="width="200px;" value="Close">
      </div>
    <!--First row-->
      

  </div>
  <!-- Section -->

</div>
	</form>
	</div>
	<script>
		$('.click').click(e=>{
			   $(".selectBox").fadeIn();
		});
		
		$('#close').click(e=>{
		       $(".selectBox").fadeOut();
			

		});
		
	</script>
	 <form action="${path }/board/goodsPay.do"  method="post"> 

      <table class="table product-table mb-0">

        <!-- Table head -->
        <thead class="mdb-color lighten-5">
          <tr>
            <th>
               <strong>File</strong>
            </th>
          
            <th class="font-weight-bold">
              <strong>Goods</strong>
            </th>
          
            <th class="font-weight-bold">
              <strong>Writer</strong>
            </th>
            <th></th>
            <th class="font-weight-bold">
              <strong>Content</strong>
            </th>
             <th></th>
              <th class="font-weight-bold">
              <strong>Price</strong>
            </th>
            <th class="font-weight-bold">
              <strong>Date</strong>
            </th>
            
            <th></th>
          </tr>
        </thead>
        <!-- /.Table head -->

        <!-- Table body -->
 

          <!-- First row -->
          <c:forEach items="${board }" var="b">
             
             
          <tr >
   
            <th scope="row" >
             <input type="checkbox" name="totalPrice" id="totalPrice" style="width: 30px;height: 30px;" value="${b.price }">
            <input name="boardNo" type="checkbox" value="${b.boardNo }">
             <!--  <img src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Products/13.jpg" alt="" class="img-fluid z-depth-0"> -->
              <img src="${path }/resources/upload/board/${b.renamedFilename }" style="width: 150px; height: 150px; background-size: cover; "class="img-fluid z-depth-0">
            </th>
        
            <td>  
            <a href="${path }/board/boardDetail.do?boardNo=${b.boardNo}">
              <h5 class="mt-3" >
                <strong>${b.boardTitle }</strong>
              </h5>
              </a>
           
            </td>
            <td><h5 class="mt-3">${b.boardWriter }</h5></td>
            <td></td>
            <td><h5 class="mt-3">${b.boardContent }</h5></td>
             <td></td>
             <td><h5 class="mt-3">   ￦<fmt:formatNumber type="number" maxFractionDigits="3" value="${b.price }" /> 원</h5></td>
          
            <td><h5 class="mt-3">
         
           
			<fmt:formatDate value="${b.uploadDate}" pattern="yy.MM.dd"/>
            </h5> </td>
        
           
            <td class=""  >
            <c:if test="${b.memberNo == commonLogin.memberNo}">
              <button type="button" id="x" data-toggle="tooltip" data-placement="top"
                title="Remove item" onclick="location.href='${path }/board/boardDelete.do?boardNo=${b.boardNo }&memberNo=${commonLogin.memberNo }'">Delete
              </button>
     		</c:if>
     		
            </td>
             
          </tr>
   	
            </c:forEach>
          <!-- /.First row -->

         
       
         

          <!-- Fourth row -->
          <tr>
           
           
          </tr>
          <!-- Fourth row -->

       
        <!-- /.Table body -->

      </table>
      <div id="pageBar">${pageBar }</div>
       <input type="submit" id="x2" data-toggle="tooltip" data-placement="top" value="Buy"
                title="Remove item" >
       
              	 </form>

    </div>
    <div height="25">&nbsp;합계:&nbsp;<input id="total_sum" name="total_sum" type="text" size="20" readonly></div>
    <!-- /.Shopping Cart table -->

  </div>
  <!--Section: Content-->


</div>


</section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


<script>

var output = 0;

 $(function(){
	  $('input[name=totalPrice]').click(e => {
		  
		var result =  $(e.target).val();
		let test = Number(result);
		if($(e.target).is(":checked")) {
			output += test;
		} else {
			output -= test;
		}
	   	   
	  
	 $("#total_sum").val(output)
	  });
	 }); 

</script>
<script>

function fn_selectBoard() {
	
if($("input[name=sDate]").val()===""||
$("input[name=eDate]").val()===""){
	alert("기간을 설정해주세요");
	return false;
}
}
</script>
