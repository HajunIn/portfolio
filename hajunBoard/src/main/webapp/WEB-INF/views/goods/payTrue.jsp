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
  <div class="container my-5 py-5 z-depth-1">
 
 
        <!--Section: Content-->
        <div class="px-md-5 mx-md-5 text-center text-lg-left dark-grey-text">
    
          <!--Grid row-->
          <div class="row">
    
            <!--Grid column-->
            <div class="col-md-6 mb-4 mb-md-0">
    
              <h3 class="font-weight-bold">
				Payment finished</h3>
    
              <p class="text-muted">결제가 완료 되었습니다.</p>
              <p>해당 영업장을 방문해 물건을 회수하시기 바랍니다.</p>
    
              <a class="btn btn-purple btn-md ml-0" href="#" role="button">마이페이지 바로가기<i class="fa fa-gem ml-2"></i></a>
    
            </div>
            <!--Grid column-->
    
            <!--Grid column-->
            <div class="col-md-6 mb-4 mb-md-0">
    
              <!--Image-->
              <div class="view overlay z-depth-1-half">
                <img src="https://mdbootstrap.com/img/Photos/Others/img%20(29).jpg" class="img-fluid"
                  alt="">
                <a href="#">
                  <div class="mask rgba-white-light"></div>
                </a>
              </div>
    
            </div>
            <!--Grid column-->
    
          </div>
          <!--Grid row-->
    
    
        </div>
        <!--Section: Content-->
    
    
      </div>

</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>