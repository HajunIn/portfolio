<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=" "/>
</jsp:include>
<section id="content">
<div class="container my-5">

  <section>
    
    <div class="card mb-4">
      
      <div class="row">

        <div class="col-md-6">
          <img class="img-fluid rounded-left" src="${path }/resources/upload/board/${att[0].renamedFilename }" alt="project image">
        </div>

        <div class="col-md-6 p-5 align-self-center">

          <h5 class="font-weight-normal mb-3">Project detail</h5>

          <p class="text-muted">Out or geared it but to best up samples the for she phase of copy would do in divine
            of taken and the take medical or upper at him in the logbook were, we price his mostly to commas.</p>

          <ul class="list-unstyled font-small mt-5 mb-0">
            <li>
              <p class="text-uppercase mb-2"><strong>Title</strong></p>
              <p class="text-muted mb-4"><c:out value="${att[0].boardTitle }" /></p>
            </li>

            <li>
              <p class="text-uppercase mb-2"><strong>boardContent</strong></p>
              <p class="text-muted mb-4"><c:out value="${att[0].boardContent }" /></p>
            </li>

            <li>
              <p class="text-uppercase mb-2"><strong>Date</strong></p>
              <p class="text-muted mb-4"><c:out value="${att[0].uploadDate }" /></p>
            </li>

            <li>
            <c:if test="${att[0].memberNo == commonLogin.memberNo }">
              <p class="text-uppercase mb-2"><strong>boardWriter</strong></p>
              <a href="${path }/member/memberDetail.do?memberNo=${commonLogin.memberNo }" ><c:out value="${att[0].boardWriter }" /></a>
            </c:if>
            </li>

            <li>
              <p class="text-uppercase mt-4 mb-2"><strong>Share</strong></p>
              <div class="d-flex justify-content-start">
                <a class="text-muted pr-3" href="#"><i class="fab fa-facebook-f"></i></a>
                <a class="text-muted pr-3" href="#"><i class="fab fa-twitter"></i></a>
                <a class="text-muted pr-3" href="#"><i class="fab fa-instagram"></i></a>
                <a class="text-muted" href="#"><i class="fab fa-dribbble"></i></a>
              </div>
            </li>

          </ul>

        </div>

      </div>
      <div style=" width: 100%; ">
      <form action="${path}/board/comment.do">


      	<input type="hidden" value="${att[0].boardNo }" name="boardNo">
      	<div class="container my-5">

  <!-- Section -->
  <section>

   
    <hr class="w-header my-4">
    <p class="lead text-center text-muted pt-2 mb-5">댓글 등록하기</p>
		
    <!--First row-->
    <div class="row d-flex justify-content-center">

      <!--First column-->
      <div class="col-6">

        <!-- Material outline input -->
        <div class="md-form md-outline form-lg">
        
         제목<input type="text" id="form1"name="commentTitle" class="form-control form-control-lg">
          <label for="form1">Title</label>
        </div>
        
        <!-- Material outline input -->
        <div class="md-form md-outline form-lg">
          내용<input type="text" id="form2" name="commentContent"  class="form-control form-control-lg">
          <label for="form2">Content</label>
        </div>
    
        <input type="submit" id="submit" class="btn btn-block btn-primary btn-lg" value="등록하기">


      </div>
      <!--First column-->

    </div>
    <!--First row-->

  </section>
  <!-- Section -->
  

</div>
		</form>
		<table style="width: 100%; margin-left: 30px;">
    	
			<tr>
				<th>제목</th>
				<th>내용</th>
				<th>작성일자</th>
				<th>작성자</th>
			
			</tr>
			<c:forEach items="${b }" var="b">
			<tr>
				<th class="a" style="width: 20%">${b.commentTitle }</th>
				<th class="b" style="width: 40%"> ${b.commentContent }</th>
				<th class="c" style="width: 20%"><fmt:formatDate value="${b.commentDate }" pattern="yy.MM.dd"/></th>
				<th class="b" style="width: 20%"> ${b.boardWriter }</th>
			</tr>
			</c:forEach>
		
    		</table>
			<div id="pageBar">${pageBar } </div>
      	<!-- <script>
      	$("#submit").click(e=>{
      	$.ajax({
			url:"${path}/board/comment.do",
			data:{"commentTitle":$("input[name=title]").val(),
				"commentContent":$("input[name=comment]").val(),
				"boardNo":$("input[name=boardNo]").val()},
			success:data => {
				console.log(data); 

				let comment=data.split("/");
				$('#d').html(comment); 

			//	$("#d").append(comment);
			
			}
		}) 
      	});
      	</script> -->
    
      </div>

    </div>

  </section>

</div>

</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>