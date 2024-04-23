<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:if test = "${sessionScope.loginType.equals('������')}">
<h3>���� ��ȣ:${wantedAuthNo } ��</h3>
</c:if>

<c:if test = "${sessionScope.loginType.equals('���')}">
<h3>${corpid }(����ڵ�Ϲ�ȣ:${busiNo })���� ���� ��ȣ:${wantedAuthNo } ��</h3>
<h4>�������</h4>
<table border="1">
<tr><th>�����</th><td>${corp_nm }</td></tr>
<tr><th>����ּ�</th><td>${corp_addr }</td></tr>
<tr><th>����ڵ�Ϲ�ȣ</th><td>${busi_no }</td></tr>
</table>
</c:if>
<table border="1">
<tr><th>�����ȣ</th><td>${wantedAuthNo }</td></tr>
<tr><th>��������</th><td>${rl.wantedTitle }</td></tr>
<tr><th>����󼼳���</th><td><textarea name="content" rows="10" style="width:100%;border:0;resize:none;" readonly>${rd.jobCont }</textarea></td></tr>

<tr><th>�ӱ�����/�ӱ�</th><td>${rl.salTpCd }:${rl.sal }</td></tr>
<tr><th>�ּ��з�</th><td>${rl.minEdubgIcd }</td></tr>
<tr><th>���</th><td>${rl.enterTpCd }</td></tr>
<tr><th>����</th><td>${rl.jobsNm }</td></tr>
<tr><th>��������</th><td>${rl.regDt }</td></tr>
<tr><th>��������</th><td>${rl.closeDt }</td></tr>
<tr><th>����ٹ�����</th><td>${rl.workRegion }</td></tr>
<tr><th>����������ȭ��ȣ</th><td>${rd.contactTelNo }</td></tr>
<tr><th>�������</th><td>${rd.type }</td></tr>
</table>
</body>
</html>