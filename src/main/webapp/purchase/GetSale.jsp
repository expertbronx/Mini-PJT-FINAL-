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
�Ǹ���
</c:if>
<c:if test = "${list[param.count].purchaseProd.proTranCode eq 002}">
���ſϷ� <a href="/purchase/updateTranCode?tranCode=${list[param.count].purchaseProd.proTranCode}&tranNo=${list[param.count].tranNo}&currentPage=${search.currentPage}">����ϱ�</a>
</c:if>
<c:if test = "${list[param.count].purchaseProd.proTranCode eq 003}">
�����
</c:if>
<c:if test = "${list[param.count].purchaseProd.proTranCode eq 004}">
�ǸſϷ�
</c:if>
</c:if>
</body>
</html>