<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<%@ page import="com.project.member.Vo.Member2,java.util.*" %>
<%
	String[] memberType=((Member2)request.getAttribute("mem")).getMemberType();
	List<String> list=new ArrayList();
	if(memberType!=null){
		list=Arrays.asList(memberType);//배열을 리스스로 변환
	}

%>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=" "/>
</jsp:include>
<section id="content">
<style>
  
	.navbar {
    background: linear-gradient(40deg, rgba(0,51,199,.3), rgba(209,149,249,.3));
  }
  .navbar:not(.top-nav-collapse) {
    background: transparent;
  }
  .navbar .navbar-brand img {
    height: 40px;
    margin: 10px;
  }
  .hm-gradient {
    background: linear-gradient(40deg, rgba(0,51,199,.3), rgba(209,149,249,.3));
  }
  .heading {
    margin: 0 6rem;
    font-size: 3.8rem;
    font-weight: 700;
    color: #5d4267;
  }
  .subheading {
    margin: 2.5rem 6rem;
    color: #bcb2c0;
  }
  .btn.btn-margin {
    margin-left: 6rem;
    margin-top: 3rem;
  }
  .btn.btn-lily {
    background: linear-gradient(40deg, rgba(0,51,199,.7), rgba(209,149,249,.7));
    color: #fff;
  }
  .title {
    margin-top: 6rem;
    margin-bottom: 2rem;
    color: #5d4267;
  }
  .subtitle {
    color: #bcb2c0;
    margin-left: 20%;
    margin-right: 20%;
    margin-bottom: 6rem;
  }
.form-control1{
width: 100%;
text-align: center;
}
</style>

<!-- Main navigation -->
<header>

  <!--Navbar -->
  <nav class="navbar navbar-expand-lg scrolling-navbar navbar-dark z-depth-0 fixed-top">
   
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-4"
      aria-controls="navbarSupportedContent-4" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent-4">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link" href="#">
            <i class="fab fa-pinterest-p"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">
            <i class="fab fa-dribbble"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">
            <i class="fab fa-facebook-f"></i>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">
            <i class="fab fa-instagram"></i>
          </a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-4" data-toggle="dropdown" aria-haspopup="true"
            aria-expanded="false">
            <i class="fas fa-user"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-right dropdown-info" aria-labelledby="navbarDropdownMenuLink-4">
            <a class="dropdown-item" href="#">My account</a>
            <a class="dropdown-item" href="#">Log out</a>
          </div>
        </li>
      </ul>
    </div>
  </nav>
  <!--/.Navbar -->

  <!-- Intro -->
  <section class="view">

    <div class="row">

      <div class="col-md-6">

        <div class="d-flex flex-column justify-content-center align-items-center " style="padding-top: 50px;">
          <h1 class="heading">Profile</h1>
          
          <form action="${path }/member/Modifi.do"  method="post">
         
         <input type="hidden" value="${commonLogin.memberNo }" name="memberNo">
         
          <h4 class="subheading font-weight-bold">Name</h4>
          <div class="form-control1">${mem.userName }</div>
     
           <h4 class="subheading font-weight-bold">Gender</h4>
           <select  id="gender" name="gender" class="form-control1">
          	<option value="${mem.gender }"  disabled selected>${mem.gender }</option>

				<option value="M" ${mem.gender =='M'?"selected":"" }>남</option>
				<option value="F" ${mem.gender =='F'?"selected":"" }>여</option>
          </select>
           <h4 class="subheading font-weight-bold">Age</h4>
  
          <input type="number" value="${mem.age }" id="age" name="age" class="form-control1">
           <h4 class="subheading font-weight-bold">Email</h4>
       
                    <input type="email" value="${mem.email }" id="email" name="email" class="form-control1">
          
           <h4 class="subheading font-weight-bold">Phone</h4>
       
                    <input type="text" value="${mem.phone }" id="phone" name="phone" class="form-control1">
          
           <h4 class="subheading font-weight-bold">Address</h4>
       
                     <input type="text" value="${mem.address } ${mem.detailAddress}" id="address" name="address" class="form-control1">
          
           <h4 class="subheading font-weight-bold">MemberType</h4>
            <%-- <div>${arrayList }</div> --%>
            <div style="text-align: center;">
          				<input type="checkbox" class="form-check-input" 
						name="memberType" id="memberType1" value="1" ${fn:indexOf(memberType,"1")!=-1?"checked":""}<%-- <%=list.contains("운동")?"checked":"" %> --%>> <!-- //contains 포함되냐 안돼냐 라는뜻 -->
						<label for="memberType1" class="form-check-label">소매업자(꽃집)</label>&nbsp; <!--   indexOf에서 운동이만약에 있으면 0번쨰로 뜸, 근대 값이 -1 이므로 "" 이렇게 됨 -->
						
						<div style="padding-top: 10px;">
						<input type="checkbox" class="form-check-input" 
						name="memberType" id="memberType2" value="2" ${fn:indexOf(memberType,"2")!=-1?"checked":""}<%-- <%=list.contains("등산")?"checked":"" %> --%>>
						<label for="memberType2" class="form-check-label">도매업자(꽃시장)</label>&nbsp;
						</div>
						
						<script >
						
						
						$(document).ready(function() {
						    //라디오 요소처럼 동작시킬 체크박스 그룹 셀렉터
						    $('input[name=memberType]').click(function(){
						        //클릭 이벤트 발생한 요소가 체크 상태인 경우
						        if ($(this).prop('checked')) {
						            //체크박스 그룹의 요소 전체를 체크 해제후 클릭한 요소 체크 상태지정
						            $('input[name=memberType]').prop('checked', false);
						            $(this).prop('checked', true);
						        }
						    });
						});
						
						</script>
							
        				</div>
          <input type="submit" value="수정" class="form-control1">
      </form>
        </div>

      </div>

      <div class="col-md-6">

        <div class="view">
          <img src="https://images.pexels.com/photos/325045/pexels-photo-325045.jpeg" class="img-fluid" alt="smaple image">
          <div class="mask flex-center hm-gradient">
          </div>
        </div>

      </div>

    </div>

  </section>
  <!-- Intro -->

</header>
<!-- Main navigation -->

</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>