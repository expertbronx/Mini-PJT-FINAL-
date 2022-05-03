<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="../javascript/calendar.js">
	</script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "#purchase" ).on("click" , function() {
				fncAddProduct();
				});
		});
		
	</script>
	
	<script type="text/javascript">

function fncAddProduct(){
	document.detailForm.action='/product/listProduct';
	document.detailForm.submit();
}


</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<form name="detailForm" method="get" enctype="multipart/form-data" >
		<div class="page-header">
	       <h3 class=" text-info">상품구매</h3>
	       		<hr/>
	       <h3><strong>상품 구매가 완료되었습니다.</strong></h3>
	       		

	    </div>
	  		<input type="hidden" name="prodNo" value="${prodInfo.prodNo}"/>
	  		<input type="hidden" name="menu" value="search"/>
	  		<input type="hidden" name="currentPage" value="${currentPage}"/>

		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button id="purchase" type="button" class="btn btn-success">확인</button>
	  		</div>
		</div>
		
		<br/>
		</form>
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>

</html>