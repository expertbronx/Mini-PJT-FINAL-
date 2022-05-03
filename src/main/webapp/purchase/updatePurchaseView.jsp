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
			
			 $( "#cancle" ).on("click" , function() {
				javascript:history.go(-1);
				});
		});	
		
		///////////////////////////////////////////////////////////////////////
		function fncUpdatePurchase() {
		 	var receiverName = document.detailForm.receiverName.value;			
			var divyAddr = document.detailForm.divyAddr.value;
			var receiverPhone = document.detailForm.receiverPhone.value;

			if(receiverName == null || receiverName.length<1){
				alert("이름은 반드시 입력하여야 합니다.");
				return;
			}
			if(divyAddr == null || divyAddr.length<1){
				alert("구매자 주소는 반드시 입력하셔야 합니다.");
				return;
			}
			if(receiverPhone == null || receiverPhone.length<1){
				alert("구매자 연락처는 반드시 입력하여야 합니다.");
				return;
			}

				
			document.detailForm.action='/purchase/updatePurchaseView';
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
	
		<div class="page-header text-center">
	       <h3 class=" text-info">배송정보 수정</h3>
	       <h5 class="text-muted"><strong>배송 시작 시 정보수정이 불가능합니다.</strong></h5>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form name="detailForm" class="form-horizontal">
		
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">구매번호</label>
		    <div class="col-sm-4">
		      ${vo.tranNo}
		      <input type="hidden" class="form-control" id="tranNo" name="tranNo" value="${vo.tranNo}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">아이디</label>
		    <div class="col-sm-4">
		      ${vo.buyer.userId}
		      <input type="hidden" class="form-control" id="userId" name="userId" value="${vo.buyer.userId}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" placeholder="${vo.receiverName}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">주소</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyAddr" name="divyAddr"  placeholder="${vo.divyAddr}">
		    </div>
		  </div>
		  
		  		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">휴대전화번호</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" placeholder="${vo.receiverPhone}">
		    </div>
		  </div>
		<hr/>
		<div class="col-md-3" style="float: none; margin:0 auto;">
		<button id="purchase" type="button" class="btn btn-success">수정</button><button id="cancle" type="button" class="btn btn-warning">이전</button>
		</div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>