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
        body {
            padding-top : 70px;
        	 }

		.cat {
   resize: both; /* �̹��� �ִ� ����� ���� */
   float: center; /* ��� ���� */
   max-width: 335px; /* ���̸� ���� */
   height: 335px; /* ���̸� ���� */
   margin: 5px 0; /* ������ ���� 4���� ������ ���� ����, ������, �Ʒ���, ���� ���� */
			}
   	</style>
   	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	 	
	
</head>
	
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  �Ʒ��� ������ http://getbootstrap.com/getting-started/  ���� -->	
   	<div class="container ">
      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>Model2MVCShop </h1>
        <p>J2SE , DBMS ,JDBC , Servlet & JSP, Java Framework , HTML5 , UI Framework �н� �� Mini-Project ����</p>
     </div>
    </div>

	<!-- ���� : http://getbootstrap.com/css/   : container part..... -->
	<div class="container" >
			<div class="page-header">
	       <h3 class=" text-info">�Ǹŷ� TOP 3</h3>
	       		</div>
	
	<div class="row">
	<c:forEach items="${map.list}" var="var" varStatus="i">	
  	<div class="col-sm-6 col-md-4">
    	<div class="thumbnail">
    	<c:if test="${!empty map.list[i.index].fileName}">
      	<img class="cat" src="/images/uploadFiles/${map.list[i.index].fileName}" alt="image">
      	</c:if>
      	<c:if test="${empty map.list[i.index].fileName}">
      	<img src="/images/uploadFiles/noimage.png" alt="no image">
      	</c:if>
      	<div class="caption">
        	<h3>Thumbnail label</h3>
        	<p>...</p>
        	<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
      	</div>
    	</div>
  	</div>
  	    	</c:forEach>
	</div>
	
  	 </div>

</body>

</html>