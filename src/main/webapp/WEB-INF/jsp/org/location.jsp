<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <title>경찰공제회 - ${menuDetail.menuNm}</title>
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>
<body>
    <c:import url="/header.do" />

    <div class="page-container">

        <%-- 사이드바 --%>
        <c:import url="/lnb.do" />

        <main class="page-content">
        	<div class="breadcrumb">
				<a href="/index.do">
					<i class="fa-solid fa-house"></i> 
					홈 
				</a>
				<span>></span>                
                <span>자산운용조직</span>
				<span>></span> 
				<span>${menuDetail.menuNm}</span>
			</div>
			
            <section id="section-location">
                <h1>찾아오시는 길</h1>
                <p class="description">경찰공제회에 방문하시는 길을 안내해 드립니다.</p>
                
                <%-- 구글 지도 --%>
                <div class="map-container">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.5602510702565!2d126.94756761531083!3d37.54186217980247!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357c98a6615ef543%3A0xc1f036b7b1502b59!2z7ISc7Jq47Yq567OE7IucIOuniO2PrOq1rCDrj4TtmZTrj5kg66eI7Y-s64yA66GcIDc4!5e0!3m2!1sko!2skr!4v1572826994748!5m2!1sko!2skr" width="100%" height="400" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
                </div>
            </section>
            
            <%-- 상세 교통 정보 테이블 --%>
            <section id="section-transport">
                <table class="location-details">
                    <tbody>
                        <tr>
                            <th><i class="fa-solid fa-subway"></i> 지하철</th>
                            <td>
                                <strong>
                                    <span class="line-5">5호선</span>, 
                                    <span class="line-6">6호선</span>
                                </strong>
                                공덕역 8번 출구, 자람빌딩까지 도보 5분거리
                                <br>
                                <strong>
                                    <span class="line-5">5호선</span> 
                                </strong>
                                마포역 3번 출구, 자람빌딩까지 도보 8분거리
                                <br>
                                <strong>
                                    <span class="line-kj">경의중앙선</span>, 
                                    <span class="line-ar">공항철도</span> 
                                </strong>
                                공덕역 9번 출구, 자람빌딩까지 도보 3분거리
                                
                            </td>
                        </tr>
                        <tr>
                            <th><i class="fa-solid fa-bus"></i> 버스</th>
                            <td>
                                <strong><span class="bus-blue">간선버스</span></strong>: 160, 163, 260, 261, 263, 600, 604<br>
                                <strong><span class="bus-red">공항버스</span></strong>: 6701, 6702<br>
                                <strong><span class="bus-green">지선버스</span></strong>: 7013, 7016, 7611, 7613, 1002<br>
                                <strong><span class="bus-orange">마을버스</span></strong>: 마포 01, 마포 02
                            </td>
                        </tr>
                        <tr>
                            <th><i class="fa-solid fa-car"></i> 자가용</th>
                            <td>
                                <strong>여의도 방면에서</strong>: 마포대교 북단(공덕오거리 방향 20m 지점)<br>
                                <strong>신촌 방향에서</strong>: 공덕오거리에서 마포대교 방향으로 70m 지점<br>
                                <strong>서울역 방향에서</strong>: 공덕오거리에서 마포대교 방향으로 70m 지점<br>
                                <strong>서강대교 방향에서</strong>: 광흥창역에서 공덕오거리 방향으로 직진, 공덕오거리에서 마포대교 방향으로 우회전
                            </td>
                        </tr>
                    </tbody>
                </table>
           </section>
        </main>
        
        <aside class="right-toc-sidebar">
	        <h3>자산운용조직</h3>
	        <ul>
	            <li><a href="#section-location">오시는 길</a></li>
	            <li><a href="#section-transport">교통편 안내</a></li>
	        </ul>
	    </aside>
    </div>

    <c:import url="/WEB-INF/jsp/common/footer.jsp" />
    
    <script src="/js/auth.js"></script>
    <script src="/js/organization.js"></script>
</body>
</html>