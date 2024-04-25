<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript">
const add = () => {
	location.href = "${pageContext.request.contextPath }/recruit/recruitadd.do";
}
</script>
</head>
<body>
<h3>���� ���</h3>
<table id="apply_list" class = "table table-striped table-hover">
<tr>
<th>��������</th>
<th>ä������</th>
<th>��������</th>
<th>��������</th>
<th>�����������</th>
</tr>
<c:forEach var="rllist" items="${rlList }">
<tr>
<td><a href="${pageContext.request.contextPath }/recruit/recruitdetail.do?wantedAuthNo=${rllist.wantedAuthNo }" onclick="a('${rllist.wantedAuthNo }')">${rllist.wantedTitle }</a></td>
<td>${rllist.jobsNm }</td>
<td>${rllist.regDt }</td>
<td>${rllist.closeDt }</td>
<td>${saveStatusStrLst }</td>
</tr>
</c:forEach>
</table>
</body>
</html>