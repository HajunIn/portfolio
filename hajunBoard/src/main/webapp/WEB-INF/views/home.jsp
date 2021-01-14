<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="메인화면" />
</jsp:include>
<!-- <div class="" style="width: 100%; height: 500px; border: solid; " >
	<div class=""style="width: 80%;border: solid; height:500px; text-align: center; justify-content: center; margin: 0 auto;"></div>
</div>
 -->
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
							src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(72).jpg"
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
						<a href="#!" class="btn btn-indigo">Button</a>
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
							src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(74).jpg"
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
						<a href="#" class="btn btn-indigo">Button</a>
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
							src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(75).jpg"
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
						<a href="#" class="btn btn-indigo">Button</a>
					</div>

				</div>
				<!--/.Card-->

			</div>
			<!--Grid column-->

		</div>
		<!--Grid row-->

	</div>
	<!--Main container-->

</main>
<!--Main layout-->


<jsp:include page="/WEB-INF/views/common/footer.jsp" />

