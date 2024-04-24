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
const chageLangSelect=()=>{
    var langSelect = document.getElementById("selectbox");
    var selectValue = langSelect.options[langSelect.selectedIndex].value;
    const req = new XMLHttpRequest();
    let table = document.querySelector("#apply_list");
    table.innerHTML=`
    	<tr>
    	<th>������ ID</th>
    	<th>�з�</th>
    	<th>���</th>
    	<th>����</th>
    	</tr>
    `;
    req.onload = () => {
		let arr = JSON.parse(req.responseText);
		for(let a of arr){
			console.log(a) 
			// �� ��(Row) �߰�
			 const newRow = table.insertRow();
			// �� ��(Row)�� Cell �߰�
			 const newCell1 = newRow.insertCell(0);
			const newCell2 = newRow.insertCell(1);
			const newCell3 = newRow.insertCell(2);
			const newCell4 = newRow.insertCell(3);
			// Cell�� �ؽ�Ʈ �߰�
			newCell1.innerText = a.id;
			newCell2.innerText = a.email;
			newCell3.innerText = a.education;
			newCell4.innerText = a.age;
		}
	}
	req.open('get', '${pageContext.request.contextPath }/mem/applyDetail.do?wanted_auth_no='+selectValue);
	req.send();
}
</script>
</head>
<body>
<h3>���� ���</h3>
<select class="form-select" aria-label="Default select example" id="selectbox"" name="selectbox" onchange="chageLangSelect()">
  <option selected disabled>�����ڸ� Ȯ���� ���� �����ϼ���.</option>
  <c:forEach var="rllist" items="${rlList }">
    <option value="${rllist.wantedAuthNo }" >${rllist.wantedTitle }</option>
  </c:forEach>
</select>

<h3>������ ���</h3>
<table id="apply_list" class = "table table-striped table-hover">
<tr>
<th>������ ID</th>
<th>�з�</th>
<th>���</th>
<th>����</th>
</tr>
</table>

</body>
</html>