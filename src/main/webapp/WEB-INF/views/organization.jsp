<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>경찰공제회 - ${pageTitle}</title>
    <link rel="stylesheet" href="/static/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div class="page-container">

        <%-- 사이드바 --%>
        <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />

        <main class="page-content">
        
            <div class="breadcrumb">
                <c:forEach var="crumb" items="${breadcrumbs}" varStatus="status">
                    <c:if test="${not status.first}">
                        <span>></span>
                    </c:if>
                    <c:choose>
                        <c:when test="${not empty crumb.url}">
                            <a href="${crumb.url}">
                                <c:if test="${status.first}"><i class="fa-solid fa-house"></i></c:if>
                                ${crumb.label}
                            </a>
                        </c:when>
                        <c:otherwise>
                            <span>${crumb.label}</span>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>

            <%-- [수정] 1. '소개' 탭 콘텐츠 --%>
            <c:if test="${currentTab == 'intro'}">
                <section id="section-intro">
                    <h1>자산운용조직 소개</h1>
                    
                    <div class="intro-container">
                        <%-- 왼쪽: 텍스트 영역 --%>
                        <div class="intro-text">
                            <p class="introduce-title">안녕하십니까.<br>
                                <span style="color:var(--primary-color)">경찰공제회입니다.</span>
                            </p>
                            <p class="introduce-desc">경찰공제회 정보교류시스템 홈페이지를 찾아주셔서<br>대단히 감사합니다.</p>
                            <div class="contents">
                                경찰공제회는 전국 경찰공무원의 생활안정과 복지증진을 도모하기 위한 목적으로 설립하였고 지속적인 발전을 거듭하며<br>
                                자산 3조원 시대를 넘어 새로운 도약을 준비하고 있습니다.<br><br>
                                이를 달성하기 위해 공제회는 투자제안의 문턱을 낮추고 투자 지역 및 대상 다변화를 적극 추진하며, 공제회 투자자산에<br>
                                대해 기관 간 정보공유 협업을 이루고자 정보교류시스템 홈페이지를 개설하였습니다.<br><br>
                                많은 관심과 참여를 부탁드리며, 우리 공제회와 자본시장 참여자의 성공을 위해 함께 노력해 나가겠습니다.<br><br>
                                감사합니다.
                            </div>
                        </div>
                        <!-- <%-- 오른쪽: 이미지 영역 --%>
                        <div class="intro-image">
                            <img src="/static/images/bg_info.jpg" alt="자산 운용 소개 이미지">
                        </div> -->
                    </div>
                </section>
            </c:if>

            <%-- 2. '조직도' 탭 콘텐츠 --%>
            <c:if test="${currentTab == 'chart'}">
                <section id="section-chart">
                    <h1>조직도</h1>
                    <p class="description">전문성과 투명성을 바탕으로 자산을 운용하는 조직도입니다.</p>
                    <div class="content-box">
                        <img src="https://i.ibb.co/2k781P7/org-chart.png" alt="조직도 이미지" style="width:100%; height:auto;">
                    </div>
                </section>
                <section id="section-members">
                    <h2>조직업무 소개</h2>
                    <div class="content-box">조직구성 관련 콘텐츠 영역 (표 등)</div>
                </section>
            </c:if>

            <%-- 3. '찾아오시는 길' 탭 콘텐츠 --%>
            <c:if test="${currentTab == 'location'}">
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
                </c:if>

        </main>
        
        <%-- [수정] tocItems가 비어있지 않을 때만 오른쪽 목차를 표시 --%>
        <c:if test="${not empty tocItems}">
            <aside class="right-toc-sidebar">
                <h3>자산운용조직</h3>
                <ul>
                    <c:forEach var="item" items="${tocItems}">
                        <li><a href="${item.url}">${item.label}</a></li>
                    </c:forEach>
                </ul>
            </aside>
        </c:if>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
    <script src="/static/js/auth.js"></script>
    <script src="/static/js/organization.js"></script>
</body>
</html>