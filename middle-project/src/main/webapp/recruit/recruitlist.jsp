<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
const a=(val)=>{
	let req=new XMLHttpRequest()
	req.open('get',"${pageContext.request.contextPath }/myapplist/recent.do?num="+val)
	req.send()
	req.onload=()=>{
	}
}

</script>
</head>
<body>
<c:if test = "${sessionScope.loginType.equals('���')}">
<h3>${id }(����ڵ�Ϲ�ȣ:${busiNo })���� ���� ���</h3>
</c:if>

<c:if test = "${sessionScope.loginType.equals('������')}">
<h3>���� ���</h3>
</c:if>
<table class = "table table-striped table-hover">
<tr>
<th>��������</th>
<th>ä������</th>
<th>��������</th>
<th>��������</th>
<c:if test = "${sessionScope.loginType.equals('���')}">
<th>�����������</th>
</c:if>
</tr>
<c:forEach var="rllist" items="${rlList }">
<tr>
<td><a href="${pageContext.request.contextPath }/recruit/recruitdetail.do?wantedAuthNo=${rllist.wantedAuthNo }" onclick="a('${rllist.wantedAuthNo }')">${rllist.wantedTitle }</a></td>
<td>${rllist.jobsNm }</td>
<td >${rllist.regDt }</td>
<td>${rllist.closeDt }</td>
<c:if test = "${sessionScope.loginType.equals('���')}">
<td>${rllist.saveStatus }</td>
</c:if>
</tr>
</c:forEach>
</table>
</body>
</html>