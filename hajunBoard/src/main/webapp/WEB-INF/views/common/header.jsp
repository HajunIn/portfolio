<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 

<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- Popper JS -->
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<c:set var="path" value="${pageContext.request.contextPath }" />



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포토폴리오</title>


</head>

<body>
   <div id="container">
      <header>
         <div id="header-container">
            
         </div>
         <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#"> 
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
               data-target="#navbarNav" aria-controls="navbarNav"
               aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
               <ul class="navbar-nav mr-auto">
                  <li class="nav-item"><a class="nav-link" href="${path }">Home</a>
                  </li>
                  <li class="nav-item"><a class="nav-link test" style="cursor:pointer;" href="${path }/board/board.do">게시판</a></li><%-- <button onclick="location.href='${path}/board/test.do'">클릭</button> --%>
                  <c:if test="${commonLogin ne null }">
                   <li class="nav-item"><a class="nav-link test" style="cursor:pointer;" href="${path}/board/goodsList.do?memberNo=${commonLogin.memberNo}" >등록상품 바로가기</a></li>
           		  </c:if>
               
            
               </ul>
 <script>
 			/* function fn_toggle() {
                	if(${commonLogin == null}){
                	alert('로그인후 이용가능합니다');
                
                		$(".test").attr("href","${path }/board/board.do?memberNo=${commonLogin.memberNo}");
                	}
 			}; */
                </script> 
                
               <c:if test="${commonLogin == null }">
                  <button class="btn btn-outline-success my-2 my-sm-0" type="button"
                     data-toggle="modal" data-target="#loginModal">로그인</button>
               &nbsp;&nbsp;
               &nbsp;&nbsp;
               
               <button class="btn btn-outline-success my-2 my-sm-0" type="button"
                     onclick="location.href='${path}/members/enrollMember.do'">회원가입</button>
                     
                  <div class="modal fade" id="loginModal" tabindex="-1"
                     role="dialog" aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                     <div class="modal-dialog" role="document">
                        <div class="modal-content">
                             <div class="container my-5 py-5 z-depth-1">
 
 
    <!--Section: Content-->
    <div class="px-md-5 mx-md-5 text-center text-lg-left dark-grey-text">


      <!--Grid row-->
      <div class="row d-flex justify-content-center">

        <!--Grid column-->
        <div class="col-md-6">

          <!-- Default form subscription -->
          <form class="text-center" action="${path }/member/memberLogin.do" method="post" >

            <p class="h4 mb-4">Subscribe</p>

            <p>Join our mailing list. We write rarely, but only the best content.</p>

            <p>
              <a href="" target="_blank">See the last newsletter</a>
            </p>

            <!-- Name -->
            <input type="text" name="userId"  id="defaultSubscriptionFormPassword" class="form-control mb-4" placeholder="Name">

            <!-- Email -->
            <input type="password" name="password" id="defaultSubscriptionFormEmail" class="form-control mb-4" placeholder="password">

            <!-- Sign in button -->
            <button class="btn btn-info btn-block" type="submit">Sign in</button>
            <button class="btn btn-info btn-block" type="button">Close</button>


          </form>
          <!-- Default form subscription -->

        </div>
        <!--Grid column-->

      </div>
      <!--Grid row-->


    </div>
    <!--Section: Content-->


  </div>
                     </div>

                  </div>

               </c:if>
               <c:if test="${commonLogin !=null }">
               <span><a href="${path }/member/memberDetail.do?memberNo=${commonLogin.memberNo }">${commonLogin.userName }</a>님, 안녕하세요</span>
               &nbsp;
               <button class="btn btn-outline-success my-2 my-sm-0"
               type="button" onclick="location.replace('${path}/member/logout.do');">로그아웃</button>
               
            </c:if>
            </div>
         </nav>
      </header>
   
  


  

      
      
      