<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>경찰공제회 - 자산운용조직소개</title>
    <link rel="stylesheet" href="/static/css/main.css">
</head>
<body>
    <%-- 헤더 영역 포함 --%>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <%-- 메인 콘텐츠 --%>
    <div class="page-container">
        
        <%-- 왼쪽 사이드바 (LNB) --%>
        <aside class="left-sidebar">
            <h2>자산운용조직소개</h2>
            <ul>
                <li class="active"><a href="#">조직도</a></li>
                <li><a href="#">운용조직 현황</a></li>
                <li><a href="#">위원회</a></li>
            </ul>
        </aside>

        <%-- 페이지 주 내용 --%>
        <main class="page-content">
            <div class="breadcrumb">
                <span>홈</span> &gt; <span>자산운용조직소개</span>
            </div>

            <section id="section-org-chart">
                <h1>조직도</h1>
                <p>경찰공제회 자산운용부문은 효율적이고 투명한 자산운용을 위해 전문화된 조직체계를 갖추고 있습니다. (내용)...</p>
                <div style="height:400px; background:#e9ecef; display:flex; align-items:center; justify-content:center;">조직도 콘텐츠 영역</div>
            </section>

            <section id="section-org-status">
                <h2>운용조직 현황</h2>
                <p>현재 자산운용부문은 다음과 같은 팀으로 구성되어 각 분야의 전문가들이 자산을 운용하고 있습니다. (내용)...</p>
                 <div style="height:400px; background:#e9ecef; display:flex; align-items:center; justify-content:center;">운용조직 현황 콘텐츠 영역</div>
            </section>
            
            <section id="section-committee">
                <h2>위원회</h2>
                <p>주요 투자 결정은 독립적인 위원회를 통해 이루어지며, 리스크 관리와 투자 심의를 강화하고 있습니다. (내용)...</p>
                 <div style="height:400px; background:#e9ecef; display:flex; align-items:center; justify-content:center;">위원회 콘텐츠 영역</div>
            </section>
        </main>

        <%-- 오른쪽 목차 사이드바 (TOC) --%>
        <aside class="right-toc-sidebar">
            <h3>On this page</h3>
            <ul>
                <li><a href="#section-org-chart">조직도</a></li>
                <li><a href="#section-org-status">운용조직 현황</a></li>
                <li><a href="#section-committee">위원회</a></li>
            </ul>
        </aside>

    </div>

    <%-- 푸터 영역 포함 --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
    <%-- JavaScript 파일 추가 --%>
    <script src="/static/js/main.js"></script>
</body>
</html>