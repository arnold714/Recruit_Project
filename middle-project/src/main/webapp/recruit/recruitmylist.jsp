<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>${corpid }(����ڵ�Ϲ�ȣ:${busiNo })���� ���� ���</h3>
<table border="1">
<tr>
<th>�����ȣ</th>
<th>��������</th>
<th>��������</th>
<th>��������<th>
<th>�����������</th>
</tr>
<c:forEach var="rllist" items="${rlList }">
<tr>
<td><a href="${pageContext.request.contextPath }/recruit/recruitdetail.do?wantedAuthNo=${rllist.wantedAuthNo }">${rllist.wantedAuthNo }</a></td>
<td>${rllist.wantedTitle }</td>
<td>${rllist.regDt }</td>
<td>${rllist.closeDt }</td>
<td>${rllist.saveStatus }</td>
</tr>
</c:forEach>
</table>
</body>
</html>