<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<!-- ROLE == ADMIN -->
<c:if test = "${param.menu eq 'manage'}">
<c:if test = "${empty list[param.count].purchaseProd.proTranCode}">
판매중
</c:if>
<c:if test = "${list[param.count].purchaseProd.proTranCode eq 002}">
구매완료 <a href="/purchase/updateTranCode?tranCode=${list[param.count].purchaseProd.proTranCode}&tranNo=${list[param.count].tranNo}&currentPage=${search.currentPage}">배송하기</a>
</c:if>
<c:if test = "${list[param.count].purchaseProd.proTranCode eq 003}">
배송중
</c:if>
<c:if test = "${list[param.count].purchaseProd.proTranCode eq 004}">
판매완료
</c:if>
</c:if>
</body>
</html>