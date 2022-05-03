<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


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
		
		//============= ȸ���������� Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "#purchase" ).on("click" , function() {
				fncAddProduct();
				});
			
			 $( "#cancle" ).on("click" , function() {
				javascript:history.go(-1);
				});
		});
		
	</script>
	
	<script type="text/javascript">

function fncAddProduct(){
	//Form ��ȿ�� ����
 	var receiverName = document.detailForm.receiverName.value;
	var receiverPhone = document.detailForm.receiverPhone.value;
	var divyAddr = document.detailForm.divyAddr.value;
	var divyDate = document.detailForm.divyDate.value;

	if(receiverName == null || receiverName.length<1){
		alert("������ �̸��� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(receiverPhone == null || receiverPhone.length<1){
		alert("������ ����ó�� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(divyAddr == null || divyAddr.length<1){
		alert("������ �ּҴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(divyDate == null || divyDate.length<1){
		alert("���������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	
	document.detailForm.action='/purchase/addPurchase';
	document.detailForm.submit();
}

function resetData(){
	document.detailForm.reset();
}

</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		<form name="detailForm" method="post" enctype="multipart/form-data" >
		<div class="page-header">
	       <h3 class=" text-info">��ǰ����</h3>
	    </div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
	  		<input type="hidden" name="prodNo" value="${prodInfo.prodNo}"/>
	  		<input type="hidden" name="currentPage" value="${currentPage}"/>
			<div class="col-xs-8 col-md-4">${prodInfo.prodNo}</div>
		</div>
		
		
			<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ��</strong></div>
			<div class="col-xs-8 col-md-4">${prodInfo.prodName}</div>
		</div>
		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ ������</strong></div>
			<div class="col-xs-8 col-md-4">${prodInfo.prodDetail}</div>
		</div>
		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${prodInfo.manuDate}</div>
		</div>
		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>����</strong></div>
			<div class="col-xs-8 col-md-4"><input type="hidden" name="price" value="${prodInfo.price}" class="form-control" 
						style="width: 100px; height: 19px" maxLength="10">${prodInfo.price} ��</div>
		</div>
		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�������</strong></div>
			<div class="col-xs-8 col-md-4">${prodInfo.regDate }</div>
		</div>
		
		<hr/>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>������ ���̵�</strong></div>
			<div class="col-xs-8 col-md-4">${user.userId }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>�������</strong></div>
			<div class="col-xs-8 col-md-4">			
			<select name="paymentOption"	class="ct_input_g" 
					style="width: 100px; height: 19px" maxLength="20">
				<option value="001">���ݱ���</option>
				<option value="002">�ſ뱸��</option>
			</select>
			</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>������ �̸�</strong></div>
			<div class="col-xs-8 col-md-4"><input type="text" name="receiverName"  class="form-control" 
						style="width: 100px; height: 19px" maxLength="10"></div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>������ ����ó</strong></div>
			<div class="col-xs-8 col-md-4"><input type="text" name="receiverPhone"  class="form-control" 
						style="width: 130px; height: 19px" maxLength="13"></div>
		</div>

		<hr/>		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>������ �ּ�</strong></div>
			<div class="col-xs-8 col-md-4"><input type="text" name="divyAddr"  class="form-control" 
						style="width: 200px; height: 19px" maxLength="20"></div>
		</div>
		
		<hr/>	
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>���� ��û����</strong></div>
			<div class="col-xs-8 col-md-4"><input type="text" name="divyRequest"  class="form-control" 
						style="width: 200px; height: 19px" maxLength="20"></div>
		</div>
		
		<hr/>
		
			<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>����������</strong></div>
			<div class="col-xs-8 col-md-4"><input type="text" name="divyDate" placeholder="${productVO.manuDate}" readonly="readonly" class="form-control"  
												style="width: 100px; height: 19px"	maxLength="10" minLength="6"/>
											<img src="../images/ct_icon_date.gif" width="15" height="15" 
												onclick="show_calendar('document.detailForm.divyDate', document.detailForm.divyDate.value)"/></div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button id="purchase" type="button" class="btn btn-success">����</button><button id="cancle" type="button" class="btn btn-warning">����</button>
	  		</div>
		</div>
		
		<br/>
		</form>
 	</div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>

</html>