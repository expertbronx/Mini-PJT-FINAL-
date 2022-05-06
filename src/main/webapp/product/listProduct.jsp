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
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//=============    �˻� / page �ΰ��� ��� ���  Event  ó�� =============	
		function fncGetUserList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${menu}").submit();
		}
		
		
		//============= "�˻�"  Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-default" ).on("click" , function() {
				fncGetUserList(1);
			});
		 });
		
		
		//============= userId �� ȸ����������  Event  ó��(Click) =============	
		 $(function() {
		
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( ".search" ).on("click" , function() {
				 self.location ="/product/getProduct?prodNo="+$(this).attr("value")+"&currentPage=${searchVO.currentPage}";
			});
			
			$( ".update" ).on("click" , function() {
				 self.location ="/product/updateProductView?prodNo="+$(this).attr("value")+"&menu=manage";
			});
						
			//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
			$( "td:nth-child(2)" ).css("color" , "red");
			
		});	
		
		
		//============= userId �� ȸ����������  Event  ó�� (double Click)=============
		 $(function() {
			 
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$(  "td:nth-child(5) > i" ).on("click" , function() {

					var userId = $(this).next().val();
				
					$.ajax( 
							{
								url : "/user/json/getUser/"+userId ,
								method : "GET" ,
								dataType : "json" ,
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {

									var displayValue = "<h6>"
																+"���̵� : "+JSONData.userId+"<br/>"
																+"��  �� : "+JSONData.userName+"<br/>"
																+"�̸��� : "+JSONData.email+"<br/>"
																+"ROLE : "+JSONData.role+"<br/>"
																+"����� : "+JSONData.regDateString+"<br/>"
																+"</h6>";
									$("h6").remove();
									$( "#"+userId+"" ).html(displayValue);
								}
						});
						////////////////////////////////////////////////////////////////////////////////////////////
					
			});
			
			//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
			$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
			$("h7").css("color" , "red");
			
			//==> �Ʒ��� ���� ������ ������ ??
			$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		});	
	
	</script>
	
</head>

<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
		
	<c:if test="${menu eq 'manage'}">
		<div class="page-header text-info">
	       <h3>��ǰ����</h3>
	    </div>
	</c:if>
	
	<c:if test="${menu eq 'search'}">
		<div class="page-header text-info">
	       <h3>��ǰ�����ȸ</h3>
	    </div>
	</c:if>	
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${map.totalCount } �Ǽ�, ���� ${searchVO.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>��ǰ��ȣ</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>��ǰ��</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>��ǰ����</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      <c:if test="${menu eq 'manage'}">
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left">��ǰ��</th>
            <th align="left">����</th>
            <th align="left">�����</th>
            <th align="left">���� ����</th>
          </tr>
        </thead>
            </c:if>
		<tbody>
		
		
		<c:if test="${menu eq 'manage'}">
		  <c:forEach items="${map.list}" var="var" varStatus="i">
		  	
			<tr>
			  <td align="center">${map.list[i.index].prodNo}</td>
			  <td class ="update" align="left"  title="Click : ��ǰ���� Ȯ��" value="${map.list[i.index].prodNo}">${map.list[i.index].prodName}</td>
			  <td align="left">${map.list[i.index].price}</td>
			  <td align="left">${map.list[i.index].regDate}</td>
			  <td align="left">
		  <jsp:include page="/purchase/GetPurchase.jsp">
				<jsp:param name="count" value="${i.index}"/>
			</jsp:include>
			  </td>
			</tr>
			
          </c:forEach>
        </c:if>
        
        		<c:if test="${menu eq 'search'}">
<div class="container" >
	
	<div class="row">
	<c:forEach items="${map.list}" var="var" varStatus="i">	
  	<div class="col-sm-6 col-md-4">
    	<div class="thumbnail">
    	<c:if test="${!empty map.list[i.index].fileName}">
      	<img class="img-responsive" src="/images/uploadFiles/${map.list[i.index].fileName}" alt="" width="200" height="200">
      	</c:if>
      	<c:if test="${empty map.list[i.index].fileName}">
      	<img class="img-responsive" src="/images/uploadFiles/noimage.png" alt="no image"  width="200" height="200">
      	</c:if>
      	<div class="caption">
        	<h3> ${map.list[i.index].prodName}</h3>
        	<p><h4><strong>��ǰ����</strong></h4> ${map.list[i.index].prodDetail}</p>
        	<p><h4><strong>����</strong></h4> ${map.list[i.index].price}</p>
        	<p><a href="/purchase/addPurchaseView?currentPage=1&prodNo=${map.list[i.index].prodNo}" class="btn btn-primary" value="${map.list[i.index].prodNo}" role="button">����</a> <a href="/product/getProduct?currentPage=${searchVO.currentPage}&prodNo=${map.list[i.index].prodNo}" class="btn btn-default" role="button">�󼼺���</a></p>
      	</div>
    	</div>
  	</div>
  	    	</c:forEach>
	</div>
	
  	 </div>
        </c:if>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
</body>

</html>