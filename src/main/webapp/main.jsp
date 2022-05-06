<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS �߰� : ���ٿ� ȭ�� ������ ���� �ذ� :  �ּ�ó�� ��, �� Ȯ��-->
	<style>
			#fontI { font-family: 'Staatliches', cursive; 
			font-size: 6em; 
			text-align: center; 
			color: #F1C164; 
			text-shadow: 5px 5px #2D63A7; 
			margin: 0; 
			} 
			#fontJ { 
			font-family: 'Montserrat', sans-serif; 
			font-size: 1em; color: #F1C164;
			text-shadow: 1px 1px #2D63A7; 
			letter-spacing: 5px; 
			text-align: center; 
			}
			#jumbo { 
			background: #FFFFFF;
			}

   	</style>
   	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
     	<script type="text/javascript">
	 		 $(function() {
		
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$( "a.btn btn-primary" ).on("click" , function() {
					 self.location ="/product/getProduct?prodNo="+$(this).attr("value");
				});
			
			
				});	
	 	 </script>
	
</head>
	
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  �Ʒ��� ������ http://getbootstrap.com/getting-started/  ���� -->	
   	<div class="container" style= "height : 190px";>
      <!-- Main jumbotron for a primary marketing message or call to action -->
      <br/>
      <div class="jumbotron" id="jumbo">
        <h1 id="fontI">�ེ�� </h1>
        <p id="fontJ"><strong>�ູ�� �ܽ��� �ེ���Դϴ� </br>����  �ེ�Ϳ����� �ܽ��� �о��� ���������ʽ��ϴ�.</strong></p>
     </div>
    </div>
	<!-- ���� : http://getbootstrap.com/css/   : container part..... -->
	<div class="container" >
			<div class="page-header">
	       <h3 class=" text-info"><strong>�ེ�� �Ǹŷ� TOP 3</strong></h3>
	       		</div>
	
	<div class="row">
	<c:forEach items="${map.list}" var="var" varStatus="i">	
  	<div class="col-sm-6 col-md-4">
    	<div class="thumbnail">
    	<c:if test="${!empty map.list[i.index].fileName}">
      	<img class="img-responsive" src="/images/uploadFiles/${map.list[i.index].fileName}" alt="" width="335" height="335">
      	</c:if>
      	<c:if test="${empty map.list[i.index].fileName}">
      	<img class="img-responsive" src="/images/uploadFiles/noimage.png" alt="no image"  width="335" height="335">
      	</c:if>
      	<div class="caption">
        	<h3><span class="label label-danger">HOT</span> ${map.list[i.index].prodName}</h3>
        	<p><h4><strong>��ǰ����</strong></h4> ${map.list[i.index].prodDetail}</p>
        	<p><h4><strong>����</strong></h4> ${map.list[i.index].price}</p>
        	<p><a href="/purchase/addPurchaseView?currentPage=1&prodNo=${map.list[i.index].prodNo}" class="btn btn-primary" value="${map.list[i.index].prodNo}" role="button">����</a> <a href="/product/getProduct?currentPage=1&prodNo=${map.list[i.index].prodNo}" class="btn btn-default" role="button">�󼼺���</a></p>
      	</div>
    	</div>
  	</div>
  	    	</c:forEach>
	</div>
	
  	 </div>

</body>

</html>