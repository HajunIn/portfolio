<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!-- 주소검색 api js -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
#idCheck{
right: 0;
    top: 0;
    color:black;
    text-align: center;
    width: 50px;
    height: 35px;
    border-radius: 5px;
 
   

    
}}
</style>
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
<form action="${path }/member/memberEndenroll.do"  method="post" onsubmit="return logincheck();">
        <!--Grid row-->
        <div class="row">

          <!--Grid column-->
          <div class="col-md-6">

            <!-- Material outline input  이름-->
            <div class="md-form md-outline mb-0" >
          
              <label for="form-first-name">id</label><p id="idCheck2" ></p>
                <div style="display: flex;">
              <input type="text" id="userId" name="userId" class="form-control" value="">
             <!--  <input style="font-size: 12px; margin-left: 10px; cursor: pointer" id="idCheck"  value="check" > --> 
           </div>
           <span class="guide ok" style="display: none; color: red; font-size:13px;" >중복된 아이디 입니다. 다시 입력해주세요</span>
           <span class="guide error" style="display: none; color: blue ">사용가능 아이디 입니다.</span>
           
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
        <div class="hAddressBox">
								  <label for="form-company">address</label>
								<div class="postcodeCon">
									<input class="form-control" type="button" onclick="execDaumPostcode()" value="우편번호 찾기" ><br>
									<input class="form-control" type="text" id="postcode" placeholder="우편번호"> 
								</div>
								<input class="form-control" type="text" name="address" id="address" placeholder="도로명주소">
								<span id="guide" style="color: #999; display: none"></span> 
								<input class="form-control" type="text" name="detailAddress" id="detailAddress" placeholder="상세주소">
							</div>

        <!-- Material outline input 주소 -->
       <!--  <div class="md-form md-outline mt-3">
          <label for="form-company">address</label>
          <input type="text" id="address" name="address" class="form-control">
        </div> -->

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
         <label for="form-subject">MemberType</label>
          <input type="checkbox"  id="hobby0" name="memberType" id="hobby0" class="form-control" value="1" style="margin-left:30px ;padding-left:100px;width: 30px;height: 30px;">소매업자(꽃집)
           <input type="checkbox" id="hobby1" name="memberType" id="hobby1" class="form-control" value="2"style="margin-left:30px ;padding-left:100px; width: 30px;height: 30px;">도매업자(꽃시장)
          
       
							
        </div>

  

        <input type="submit" class="btn btn-info btn-sm ml-0" value="회원가입"><i class="far fa-paper-plane ml-2"></i>
</form>
      </div>
      <!--Grid column-->

    </div>
    <!--Grid row-->


  </section>
  <!--Section: Content-->


</div>


<!-- <script>
function fn_member(){
	 var r ="";
		 $.ajax({
				type : "post",
				  async: false,
				 url : "${path}/member/loginCheck",
				data : {"userId":$("#userId").val()} ,
			success : function(data) {
		        if (data > 0) {
		        	 r=false;
		        	 $(".guide.error").hide();
			        	$(".guide.ok").show();
		        } else{
		        	$(".guide.error").show();
		        	$(".guide.ok").hide();
		        	 r=true;
		        }
		    }	
			});
			if(r== false){
				return false;
			} else{
				return true;
			};
	
 };

 </script> -->

<script>
	function logincheck() {
			//이메일, 비밀번호 정규표현식
			
	let userId = $("#userId").val();
		let pwval = $("#password").val()
		let re = /^[a-z0-9]{4,12}$/;
		var repw = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;

			
			 if ($('#name').val() === "" || $('#address').val() === ""
					|| $('#email').val() === "" || $('phone').val() === "") {
				alert('필수 항목들을 입력해주세요!');
				return false;
			}

		
		//비밀번호 8자리 이상
		//숫자,영대문자,영소문자,특수문자 포함
		//공백X 같은문자 4번 반복X 아이디 X 한글 X
		if (pwval == "") {
			alert("비밀번호를 입력해주세요")
			return false;
		} else if (!repw.test(pwval)) {
			alert('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
			return false;
		} else if (/(\w)\1\1\1/.test(pwval)) {
			alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
			return false;
		} else if (pwval.search(emailId) > -1) {
			alert("비밀번호에 아이디가 포함되었습니다.");
			return false;
		} else if (pwval.search(/\s/) != -1) {
			alert("비밀번호는 공백 없이 입력해주세요.");
			$.trim(pwval)
			return false;
		} else if (hangulcheck.test(pwval)) {
			alert("비밀번호에 한글을 사용 할 수 없습니다.");
		} else {
			console.log("통과");
		}
		;

		
		
		 

			 if (userId != "") {
					if (!re.test(userId)) {
						alert("아이디 형식이 올바르지 못합니다.")
						return false;
					}
					;
				} else {
					alert("아이디를 작성해주세요");
					return false;
				};
			
			
	};
</script>

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
						
<script>
function execDaumPostcode() {
    new daum.Postcode(
          {
             oncomplete : function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.address; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== ''
                      && /[동|로|가]$/g.test(data.bname)) {
                   extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== ''
                      && data.apartment === 'Y') {
                   extraRoadAddr += (extraRoadAddr !== '' ? ', '
                         + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraRoadAddr !== '') {
                   extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = roadAddr;

                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if (roadAddr !== '') {
                   document.getElementById("detailAddress").value = '';
                } else {
                   document.getElementById("detailAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if (data.autoRoadAddress) {
                   var expRoadAddr = data.autoRoadAddress
                         + extraRoadAddr;
                   guideTextBox.innerHTML = '(예상 도로명 주소 : '
                         + expRoadAddr + ')';
                   guideTextBox.style.display = 'block';

                } else {
                   guideTextBox.innerHTML = '';
                   guideTextBox.style.display = 'none';
                }
             }
          }).open();
 };
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>