<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<h3>���� ��ȣ:${wantedAuthNo } ��</h3>
<h4>�������</h4>
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
    <!-- kakao api map ���� -->
<div id="map" style="width:500px;height:400px;">
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=751a4a007c37d37278bb88b5575faa4a&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
        level: 3 // ������ Ȯ�� ����
    };  

// ������ �����մϴ�    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
var geocoder = new kakao.maps.services.Geocoder();

// �ּҷ� ��ǥ�� �˻��մϴ�
geocoder.addressSearch('${rl.workRegion }', function(result, status) {

    // ���������� �˻��� �Ϸ������ 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // ��������� ���� ��ġ�� ��Ŀ�� ǥ���մϴ�
        var marker = new kakao.maps.Marker({
        	map:map,
            position: coords
        });   
        marker.setMap(map);

        // ������ �߽��� ��������� ���� ��ġ�� �̵���ŵ�ϴ�
        map.setCenter(coords);
        
        
        // ����������� ��ҿ� ���� ������ ǥ���մϴ�
         var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${corp_nm }</div>'
        });
        
        infowindow.open(map, marker);

     	// ��Ŀ�� Ŭ���̺�Ʈ�� ����մϴ�
        kakao.maps.event.addListener(marker, 'click', function() {
        	var position = this.getPosition();
 		    var url = 'https://map.kakao.com/link/map/' + result[0].y + ',' + result[0].x;
 		    window.open(url);
 		});
    } 
     
}

);

</script>
<!-- kakao api map �� -->
<input type="button" value="���� ���" onclick="recruitlist()">
<input type="button" value="����" onclick="apply()">
<input type="button" value="��ũ��" onclick="scrap()">
</c:if>

<c:if test = "${sessionScope.loginType.equals('���')}">
<h3 class="form_title text-center">${corpid }(����ڵ�Ϲ�ȣ:${busi_no })���� ����<br/> ���� ��ȣ:[${wantedAuthNo }] �� ������</h3>
<div class="w800 p40">
	<div class="form_Wrap">
		<form class="" name="f">
			<div class="row mb-3">
				<label for="writer" class="col-sm-2 col-form-label">�ۼ���</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" id="writer" name="writer" value="${sessionScope.loginId }" readonly>
				</div>
			</div>
            <div class="row mb-3">
				<label for="wantedAuthNo" class="col-sm-2 col-form-label">�����ȣ</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" id="wantedAuthNo" name="wantedAuthNo" value="${wantedAuthNo }" readonly>
				</div>
			</div>
            <div class="row mb-3">
				<label for="wantedTitle" class="col-sm-2 col-form-label">���� ����</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" id="wantedTitle" name="wantedTitle" value="${rl.wantedTitle }" readonly>
				</div>
			</div>
			<div class="row mb-3">
				<label for="jobCont" class="col-sm-2 col-form-label">���� ���� ����</label>
				<div class="col-sm-10">
					<textarea class="form-control" style="resize: none;" id="jobCont" name="jobCont" readonly>"${rd.jobCont }"</textarea>
				</div>
			</div>
			<div class="row mb-3">
				<label for="salTpCd" class="col-sm-2 col-form-label">���� �ӱ� ����</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" id="salTpCd" name="salTpCd" value="${salTpCd }" readonly>
				</div>
			</div>
			<div class="row mb-3">
				<label for="sal" class="col-sm-2 col-form-label">�ӱݾ�</label>
				<div class="col-sm-10">
					<input class="form-control" type="number" id="sal" name="sal" min="0" value="${rl.sal}" readonly>
				</div>
			</div>
			<div class="row mb-3">
				<label for="minSal" class="col-sm-2 col-form-label">�ּ��ӱݾ�</label>
				<div class="col-sm-10">
					<input class="form-control" type="number" id="minSal" name="minSal" min="0" value="${rd.minSal }" readonly>
				</div>
			</div>
			<div class="row mb-3">
				<label for="maxSal" class="col-sm-2 col-form-label">�ִ��ӱݾ�</label>
				<div class="col-sm-10">
					<input class="form-control" type="number" id="maxSal" name="maxSal" min="0" value="${rd.maxSal }" readonly>
				</div>
			</div>
			<div class="row mb-3">
				<label for="minEdubgIcd" class="col-sm-2 col-form-label">���� �ּ��з�</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" id="minEdubgIcd" name="minEdubgIcd" value="${minEdubgIcd }" readonly>
				</div>
			</div>
			<div class="row mb-3">
				<label for="enterTpCd" class="col-sm-2 col-form-label">���� ���</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" id="enterTpCd" name="enterTpCd" value="${enterTpCd }" readonly>
				</div>
			</div>
			<div class="row mb-3">
				<label for="workRegion" class="col-sm-2 col-form-label">�ٹ� ���� �ּ�</label>
				<div class="col-sm-10">
					<input class="form-control" type="text"
						id="workRegion" name="workRegion" value="${rl.workRegion }" readonly>
				</div>
			</div>
			<div class="row mb-3">
				<label for="jobsNm" class="col-sm-2 col-form-label">ä�� ����</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" list="jobsNmList" id="jobsNm" name="jobsNm" value="${rl.jobsNm }" readonly>
					<datalist id="jobsNmList">
						<c:forEach var="j" items="${jobList }">
							<option value="${j.depth3Nm }"></option>
						</c:forEach>
					</datalist>
				</div>
			</div>
			<div class="row mb-3">
				<label for="currentDate" class="col-sm-2 col-form-label">��������</label>
				<div class="col-sm-10">
					<input class="form-control" type="date" id="currentDate" name="regDt" value="${rl.regDt }" readonly>
				</div>
			</div>
			<div class="row mb-3">
				<label for="currentDate" class="col-sm-2 col-form-label">��������</label>
				<div class="col-sm-10">
					<input class="form-control" type="date" id="currentDate" name="closeDt" value="${rl.closeDt }" readonly>
				</div>
			</div>
			<div class="row mb-3">
				<label for="contactTelNo" class="col-sm-2 col-form-label">����������ȭ��ȣ</label>
				<div class="col-sm-10">
					<input class="form-control" type="tel" id="contactTelNo" name="contactTelNo" value="${rd.contactTelNo }"
						pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" readonly>
				</div>
			</div>
            <div class="row mb-3">
				<label for="saveStatusStr" class="col-sm-2 col-form-label">���� ���� ����</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" id="saveStatusStr" name="saveStatusStr" value="${saveStatusStr }" readonly>
				</div>
			</div>
            <div class="row mb-3">
				<label for="listTypeStr" class="col-sm-2 col-form-label">���� ����</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" id="listTypeStr" name="listTypeStr" value="${listTypeStr }" readonly>
				</div>
			</div>
            <div class="row mb-3">
				<label for="detailTypeStr" class="col-sm-2 col-form-label">���� ����</label>
				<div class="col-sm-10">
					<input class="form-control" type="text" id="detailTypeStr" name="detailTypeStr" value="${detailTypeStr }" readonly>
				</div>
			</div>
			<div class="btn_wrap">
                <input type="hidden" name="corpid" value="${corpid }">
                <input type="hidden" name="busiNo" value="${busi_no }">

                <input class="btn btn-primary" type="button" value="���� ���" onclick="mylist()">
                <input class="btn btn-primary" type="button" value="����" onclick="edit()">
                <input class="btn btn-primary" type="button" value="����" onclick="del()">
			</div>
		</form>
	</div>
</div>
</c:if>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/map.js"></script>




</body>
</html>