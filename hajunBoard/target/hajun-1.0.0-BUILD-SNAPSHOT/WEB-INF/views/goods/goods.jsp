<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<<style>
#x{
right: 0;
    top: 0;
    color:black;
    text-align: center;
    width: 100%;
    height: 35px;
    font-size: 14px;
    font-weight: bold;
    border-radius: 5px;

   

</style>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value=" "/>
</jsp:include>
<section id="content">
<div class="container my-5">

  <!-- Section: Block Content -->
  <section>

    <h3 class="font-weight-bold dark-grey-text text-center mb-5">Last Items</h3>

    <!-- Grid row -->
    <div class="row">

      <!-- Grid column -->
      <c:forEach items="${board }" var="b">
      <div class="col-lg-3 col-md-6 mb-4">

        <!-- Card -->
        <div class="card card-ecommerce">

          <div class="view overlay">
            <img src="${path }/resources/upload/board/${b.renamedFilename }/" class="img-fluid"
              alt="sample image">
            <a>
              <div class="mask rgba-white-slight"></div>
            </a>
          </div>

          <div class="card-body">

            <h5 class="card-title mb-1"><strong><a class="dark-grey-text">${b.boardTitle }</a></strong></h5>
            <span class="badge badge-danger mb-2">bestseller</span>


            <ul class="rating">
              <li>
                <i class="fas fa-star blue-text">${b. boardContent}</i>
              </li>
              <li>
                <i class="fas fa-star blue-text"><fmt:formatDate value="${b. uploadDate}" pattern="yy.MM.dd"/></i>
              </li>
             
            </ul>

            <div class="card-footer pb-0">
              <div class="row mb-0">
                <span class="float-left">
                  <strong> ￦<fmt:formatNumber type="number" maxFractionDigits="3" value="${b.price }" />원</strong>
                </span>
                <span class="float-right">
                  <a class="" data-toggle="tooltip" data-placement="top" title="Add to Cart">
                    <i class="fas fa-shopping-cart ml-3"></i>
                  </a>
                </span>
              </div>
            </div>
          </div>
                  <button type="button" id="x" data-toggle="tooltip" data-placement="top"
                title="Remove item" onclick="location.href='${path }/board/boardDelete.do?boardNo=${b.boardNo }&memberNo=${commonLogin.memberNo }'">Delete
              </button>

        </div>
        <!-- Card -->

      </div>
      <!-- Grid column -->
	</c:forEach>
     

    

    </div>
    <!-- Grid row -->

   <div id="pageBar">${pageBar }</div>

  </section>
  <!-- Section: Block Content -->

</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>