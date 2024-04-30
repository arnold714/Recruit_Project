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
const pdetail=(num)=>{
	console.log(num)
	//location.href = '${pageContext.request.contextPath }/person/detail.do?num=${'+num+'}';
}
const chageLangSelect=()=>{
    var langSelect = document.getElementById("selectbox");
    var selectValue = langSelect.options[langSelect.selectedIndex].value;
    const req = new XMLHttpRequest();
    let table = document.querySelector("#apply_list");
    req.onload = () => {
		let arr = JSON.parse(req.responseText);
		for(let a of arr){ 
						
		}
	}
	req.open('get', '${pageContext.request.contextPath }/mem/applyDetail.do?wanted_auth_no='+selectValue);
	req.send();
	
}
</script>
</head>
<body>
<h3>������ ���</h3>
<select class="form-select" aria-label="Default select example" id="selectbox"" name="selectbox" onchange="chageLangSelect()" style="margin-bottom: 30px">
  <option selected disabled>�����ڸ� Ȯ���� ���� �����ϼ���.</option>
  <c:forEach var="rllist" items="${rlList }">
    <option value="${rllist.wantedAuthNo }" >${rllist.wantedTitle }</option>
  </c:forEach>
</select>

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