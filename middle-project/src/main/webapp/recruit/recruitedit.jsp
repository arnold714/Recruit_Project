<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<c:if test = "${sessionScope.loginType.equals('���')}">
<h3>${corpid }(����ڵ�Ϲ�ȣ:${busiNo })���� ���� ��ȣ:${wantedAuthNo } ��</h3>
<table border="1">
<tr><th>�����ȣ</th><td>${wantedAuthNo }</td></tr>
<tr><th>��������</th><td>${rl.wantedTitle }</td></tr>
</table>

</c:if>
<table >
<tr><th>�����</th><td>${corp_nm }</td></tr>
<tr><th>����ּ�</th><td>${corp_addr }</td></tr>
</table>
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

<input type="button" value="����" onclick="edit()">
<input type="button" value="�ʱ�ȭ" onclick="del()">
<input type="button" value="���" onclick="del()">
</body>
</html>