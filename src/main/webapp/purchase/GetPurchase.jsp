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
<c:if test = "${map.list[param.count].quantity ne 0}">
���� ���� : ${map.list[param.count].quantity}
</c:if>
<c:if test = "${map.list[param.count].quantity eq 0}">
�԰���
</c:if>
</c:if>
<!-- ROLE == USER && MENU == SEARCH -->
<c:if test = "${param.menu eq 'search'}">
<c:if test = "${map.list[param.count].quantity ne 0}">
���� ���� : ${map.list[param.count].quantity}
</c:if>
<c:if test = "${map.list[param.count].quantity eq 0}">
�԰���
</c:if>
</c:if>
<!-- ROLE == USER && MENU == NULL -->
<c:if test = "${empty param.menu}">
<c:if test = "${list[param.count].tranCode eq 002}">
��� ���
</c:if>
<c:if test = "${list[param.count].tranCode eq 003}">
����� <a href="/purchase/updateTranCodeUser?tranCode=${list[param.count].tranCode}&tranNo=${list[param.count].tranNo}&currentPage=${search.currentPage}">����Ȯ��</a>
</c:if>
<c:if test = "${list[param.count].tranCode eq 004}">
��ۿϷ�
</c:if>
</c:if>
</body>
</html>