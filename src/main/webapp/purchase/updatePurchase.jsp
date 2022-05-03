<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
	
		//============= "수정"  Event 연결 =============
			 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "#purchase" ).on("click" , function() {
				 fncUpdatePurchase();
				});
		
		///////////////////////////////////////////////////////////////////////
		function fncUpdatePurchase() {

				
			document.detailForm.action='/purchase/updatePurchaseView.jsp';
			document.detailForm.submit();
			}
		}
	
	</script>
	
</head>

<body>
	<form name="detailForm" method="post" enctype="multipart/form-data" >
		<div class="page-header text-center">
	       <h3 class=" text-info">배송정보 수정</h3>
	       <h5 class="text-muted"><strong>배송정보 변경이 완료되었습니다.</strong></h5>
	    </div>
		<div class="col-md-12 text-center ">
		<button id="purchase" type="button" class="btn btn-success">확인</button>
		</div>
	</form>
		<!-- form Start /////////////////////////////////////-->
	    
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>