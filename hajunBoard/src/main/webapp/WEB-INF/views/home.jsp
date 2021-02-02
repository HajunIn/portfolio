<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />


<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="메인화면" />
</jsp:include>

<!--Main layout-->
<main class="mt-5">

	<!--Main container-->
	<div class="container">


		<!--Grid row-->

		<!--Grid row-->
		<div class="row">

			<!--Grid column-->
			<div class="col-lg-4 col-md-12 mb-4">

				<!--Card-->
				<div class="card">

					<!--Card image-->
					<div class="view overlay">
						 <img
							src="http://jeonseongyeop.com/nixflos/img/directing/directing_12.jpg"
							class="card-img-top" alt="">
							<div class="mask rgba-white-slight"></div>
						</a>
					</div>

					<!--Card content-->
					<div class="card-body">
						<!--Title-->
						<h4 class="card-title">Card title</h4>
						<!--Text-->
						<p class="card-text">This is a portfolio of'In Ha-jun'. Please
							click the button below</p>
							 <a class="btn btn-indigo test" style="cursor:pointer;" onclick="fn_toggle();" >게시판</a>
						
					</div>

				</div>
				<!--/.Card-->

			</div>
			<!--Grid column-->

			<!--Grid column-->
			<div class="col-lg-4 col-md-6 mb-4">

				<!--Card-->
				<div class="card">

					<!--Card image-->
					<div class="view overlay">
						<img
							src="http://jeonseongyeop.com/nixflos/img/directing/directing_11.jpg"
							class="card-img-top" alt=""> <a href="#">
							<div class="mask rgba-white-slight"></div>
						</a>
					</div>

					<!--Card content-->
					<div class="card-body">
						<!--Title-->
						<h4 class="card-title">Card title</h4>
						<!--Text-->
						<p class="card-text">This is a portfolio of'In Ha-jun'. Please
							click the button below</p>
						<a class="btn btn-indigo test2" style="cursor:pointer;" onclick="fn_toggle2();"  >등록상품 바로가기</a>
					</div>

				</div>
				<!--/.Card-->

			</div>
			<!--Grid column-->

			<!--Grid column-->
			<div class="col-lg-4 col-md-6 mb-4">

				<!--Card-->
				<div class="card">

					<!--Card image-->
					<div class="view overlay">
						<img
							src="http://jeonseongyeop.com/nixflos/img/directing/directing_06.jpg"
							class="card-img-top" alt=""> <a href="#">
							<div class="mask rgba-white-slight"></div>
						</a>
					</div>

					<!--Card content-->
					<div class="card-body">
						<!--Title-->
						<h4 class="card-title">Card title</h4>
						<!--Text-->
						<p class="card-text">This is a portfolio of'In Ha-jun'. Please
							click the button below</p>
						<a onclick="fn_toggle3();"  class="btn btn-indigo test3" >MyPage</a>
					</div>

				</div>
				<!--/.Card-->

			</div>
			<!--Grid column-->

		</div>
		<!--Grid row-->

	</div>
	<!--Main container-->
	


<%-- <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  <style type="text/css">
  html, div, body,h3{
      margin: 0;
      padding: 0;
  }
  h3{
      display: inline-block;
      padding: 0.6em;
  }
  </style>
  <div style="background-color:#15a181; width: 100%; height: 50px;text-align: center; color: white; "><h3>SIST Login</h3></div>
<br>
<!-- 네이버 로그인 화면으로 이동 시키는 URL -->
<!-- 네이버 로그인 화면에서 ID, PW를 올바르게 입력하면 callback 메소드 실행 요청 -->
<div id="naver_id_login" style="text-align:center"><a href="${path}/member/naver"><img width="223" src="${pageContext.request.contextPath}/resources/img/naver_Bn_Green.PNG"/></a></div>
<br>

</main> --%>
<!--Main layout-->


<jsp:include page="/WEB-INF/views/common/footer.jsp" />
 <script>
 			function fn_toggle() {
                	if(${commonLogin == null}){
                	alert('로그인후 이용가능합니다');
                	return;
                	}else {
                		$(".test").attr("href","${path }/board/board.do?memberNo=${commonLogin.memberNo}");
                	}
 			};
 			function fn_toggle2() {
 				if(${commonLogin == null}){
 				alert('로그인후 이용가능합니다');
 				return;
 				}else {
 					$(".test3").attr("href","${path}/board/goodsList.do?memberNo=${commonLogin.memberNo}");
 				}
 			};
 			
 			function fn_toggle3() {
 				if(${commonLogin == null}){
 				alert('로그인후 이용가능합니다');
 				return;
 				}else {
 					$(".test3").attr("href","${path }/member/memberDetail.do?memberNo=${commonLogin.memberNo }");
 				}
 			};
			
</script> 
<script>

</script>
