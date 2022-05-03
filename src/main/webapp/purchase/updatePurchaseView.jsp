<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
	
		//============= "����"  Event ���� =============
			 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
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
				alert("�̸��� �ݵ�� �Է��Ͽ��� �մϴ�.");
				return;
			}
			if(divyAddr == null || divyAddr.length<1){
				alert("������ �ּҴ� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(receiverPhone == null || receiverPhone.length<1){
				alert("������ ����ó�� �ݵ�� �Է��Ͽ��� �մϴ�.");
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
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">������� ����</h3>
	       <h5 class="text-muted"><strong>��� ���� �� ���������� �Ұ����մϴ�.</strong></h5>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form name="detailForm" class="form-horizontal">
		
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">���Ź�ȣ</label>
		    <div class="col-sm-4">
		      ${vo.tranNo}
		      <input type="hidden" class="form-control" id="tranNo" name="tranNo" value="${vo.tranNo}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">���̵�</label>
		    <div class="col-sm-4">
		      ${vo.buyer.userId}
		      <input type="hidden" class="form-control" id="userId" name="userId" value="${vo.buyer.userId}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" placeholder="${vo.receiverName}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�ּ�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyAddr" name="divyAddr"  placeholder="${vo.divyAddr}">
		    </div>
		  </div>
		  
		  		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�޴���ȭ��ȣ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" placeholder="${vo.receiverPhone}">
		    </div>
		  </div>
		<hr/>
		<div class="col-md-3" style="float: none; margin:0 auto;">
		<button id="purchase" type="button" class="btn btn-success">����</button><button id="cancle" type="button" class="btn btn-warning">����</button>
		</div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
 	
</body>

</html>