<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
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
<c:if test = "${sessionScope.loginType.equals('���')}">
<h3 class="form_title text-center">${corpid }(����ڵ�Ϲ�ȣ:${busi_no })���� ����<br/> ���� ��ȣ:[${wantedAuthNo }] �� ������</h3>
</c:if>

<c:if test = "${sessionScope.loginType.equals('������')}">
<h3 class="form_title text-center">${rl.wantedTitle }</h3>
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
<c:if test = "${sessionScope.loginType.equals('������')}">
<input type="button" value="����" onclick="apply()">
<input type="button" value="��ũ��" onclick="scrap()">
</c:if>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/map.js"></script>
</body>
</html>