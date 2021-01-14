<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="회원가입"/>
</jsp:include>
	
<div class="container my-5 py-5 z-depth-1">


  <!--Section: Content-->
  <section class="px-md-5 mx-md-5 text-center text-lg-left dark-grey-text">

    <h3 class="font-weight-bold">Contact Us</h3>

    <p class="text-muted">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Id quam sapiente
      molestiae <br>
      numquam quas, voluptates omnis nulla ea odio quia similique corrupti magnam, doloremque laborum.</p>

    <hr class="my-5">

    <!--Grid row-->
    <div class="row">

      <!--Grid column-->
      <div class="col-lg-5 col-md-12 mb-0 mb-md-0">

        <h4 class="font-weight-bold">Call or email</h4>

        <p class="text-muted mb-4">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Id quam sapiente
          molestiae.</p>

        <p class="font-weight-bold">Support:</p>

        <p class="mb-2">+ 800 123 456</p>

        <p class="mb-2"><a href="#">Contact support</a></p>

        <p class="mb-4">Our technical support is available by phone or email from 11am to 11pm.</p>

        <p class="font-weight-bold">Sales:</p>

        <p class="mb-2">+ 900 123 456</p>

        <p class="mb-2"><a href="#">Contact sales</a></p>

        <p class="mb-4">Our sales team is available by phone or email from 11am to 11pm.</p>

        <p class="font-weight-bold">General inquiries:</p>

        <p class="mb-2"><a href="#">info@mycompany.com</a></p>


      </div>
      <!--Grid column-->

      <!--Grid column-->
      <div class="col-lg-7 col-md-12 mb-4 mb-md-0">
<form action="${path }/member/memberEndenroll.do"  method="post">
        <!--Grid row-->
        <div class="row">

          <!--Grid column-->
          <div class="col-md-6">

            <!-- Material outline input  이름-->
            <div class="md-form md-outline mb-0">
              <label for="form-first-name">id</label>
              <input type="text" id="userId" name="userId" class="form-control" value="">
            </div>
             <div class="md-form md-outline mb-0">
              <label for="form-first-name">password</label>
              <input type="password" id="password" name="password" class="form-control" value="">
            </div>

          </div>
          <!--Grid column-->
          

          <!--Grid column-->
          <div class="col-md-6">
          <div class="md-form md-outline mb-0">
              <label for="form-first-name">Name</label>
              <input type="text" id="userName" name="userName" class="form-control" value="">
            </div>

            <!-- Material outline input 나이-->
            <div class="md-form md-outline mb-0">
              <label for="form-last-name">age</label>
              <input type="number" id="age" name="age" class="form-control">
            </div>

          </div>
          <!--Grid column-->

        </div>
        <!--Grid row-->

        <!-- Material outline input 주소 -->
        <div class="md-form md-outline mt-3">
          <label for="form-company">address</label>
          <input type="text" id="address" name="address" class="form-control">
        </div>

        <!-- Material outline input 이메일 -->
        <div class="md-form md-outline mt-3">
          <label for="form-email">E-mail</label>
          <input type="email" id="email" name="email" class="form-control">
        </div>

        <!-- Material outline input 전화번호 -->
        <div class="md-form md-outline mt-3">
          <label for="form-number">Phone</label>
          <input type="text" id="phone" name="phone" class="form-control">
        </div>

		<div class="md-form md-outline mt-3">
          <label for="form-number">gender</label>
          <select  id="gender" name="gender" class="form-control">
          	<option value="" disabled selected>Select gender</option>
				<option value="M">남</option>
				<option value="F">여</option>
          </select>
        </div>

        <!-- Material outline input 사진-->
        <div class="md-form md-outline" style="display: flex; padding-top: 20px;">
         <label for="form-subject">hobby</label>
          <input type="checkbox"  id="hobby" name="hobby" id="hobby0" class="form-control" value="컴퓨터" style="margin-left:30px ;padding-left:100px;width: 30px;height: 30px;">체육
           <input type="checkbox" id="hobby" name="hobby" id="hobby1" class="form-control" value="도서관련"style="margin-left:30px ;padding-left:100px; width: 30px;height: 30px;">도서관련
            <input type="checkbox" id="hobby" name="hobby" id="hobby2" class="form-control" value="예체능"style="margin-left:30px ;padding-left:100px;width: 30px;height: 30px;">예체능
        
        </div>

  

        <button type="submit" class="btn btn-info btn-sm ml-0" onclick="return fn_member();">Submit<i class="far fa-paper-plane ml-2"></i></button>
</form>
      </div>
      <!--Grid column-->

    </div>
    <!--Grid row-->


  </section>
  <!--Section: Content-->


</div>
<script>
function fn_member(){

	 if ($('#name').val()==="" ||
            
              $('#address').val()==="" ||
          $('#email').val()==="" || 
               $('phone').val()==="") {
      alert('필수 항목들을 입력해주세요!');  
      return false;
	 }
   
};


</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>