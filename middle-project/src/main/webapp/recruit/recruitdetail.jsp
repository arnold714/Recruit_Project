<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
const edit = () => {
	location.href = '${pageContext.request.contextPath}/recruit/recruitedit.do?wantedAuthNo=${wantedAuthNo }';
}

const del = () => {
	location.href = '${pageContext.request.contextPath }/recruit/recruitdel.do?wantedAuthNo=${wantedAuthNo }';
}

const mylist = () => {
	location.href = '${pageContext.request.contextPath }/recruit/recruitmylist.do?id=${corpid }&busiNo=${busi_no }';
}

const recruitlist = () => {
	location.href = '${pageContext.request.contextPath }/recruit/recruitlist.do';
}

const apply = () => {
	location.href = '${pageContext.request.contextPath }/recruit/recruitdel.do?wantedAuthNo=${wantedAuthNo }';
}
const scrap = () => {
	location.href = '${pageContext.request.contextPath }/scrap/add.do?wantedAuthNo=${wantedAuthNo }';
}

</script>
</head>
<body>
<c:if test = "${sessionScope.loginType.equals('������')}">
<h3>${rl.wantedTitle }</h3>
</c:if>

<c:if test = "${sessionScope.loginType.equals('���')}">
<h3>${corpid }(����ڵ�Ϲ�ȣ:${busiNo })���� ���� ��ȣ:${wantedAuthNo } ��</h3>
<table border="1">
<tr><th>�����ȣ</th><td>${wantedAuthNo }</td></tr>
<tr><th>��������</th><td>${rl.wantedTitle }</td></tr>
</table>
</c:if>

<c:if test = "${sessionScope.loginType.equals('������')}">
<h3>���� ��ȣ:${wantedAuthNo } ��</h3>
<h4>�������</h4>
<table >
<tr><th>�����</th><td>${corp_nm }</td></tr>
<tr><th>����ּ�</th><td>${corp_addr }</td></tr>
</table>
</c:if>
<table border="1">
<tr><th>����󼼳���</th><td><textarea name="content" rows="10" style="width:100%;border:0;resize:none;" readonly>${rd.jobCont }</textarea></td></tr>

<tr><th>(�ӱ�����)�ӱ�</th><td>(${salTpCd })${rl.sal }</td></tr>
<tr><th>�ּ��з�</th><td>${minEdubgIcd }</td></tr>
<tr><th>���</th><td>${enterTpCd }</td></tr>
<tr><th>����</th><td>${rl.jobsNm }</td></tr>
<tr><th>��������</th><td>${rl.regDt }</td></tr>
<tr><th>��������</th><td>${rl.closeDt }</td></tr>
<tr><th>����ٹ�����</th><td>${rl.workRegion }</td></tr>
<tr><th>����������ȭ��ȣ</th><td>${rd.contactTelNo }</td></tr>
<tr><th>�������</th><td>${detailType }</td></tr>
</table>
<input type="hidden" name="corpid" value="${corpid }">
<input type="hidden" name="busiNo" value="${busi_no }">

<c:if test = "${sessionScope.loginType.equals('���')}">
<input type="button" value="���� ���" onclick="mylist()">
<input type="button" value="����" onclick="edit()">
<input type="button" value="����" onclick="del()">
</c:if>

<c:if test = "${sessionScope.loginType.equals('������')}">
<input type="button" value="���� ���" onclick="recruitlist()">
<input type="button" value="����" onclick="apply()">
<input type="button" value="��ũ��" onclick="scrap()">
</c:if>
</body>
</html>