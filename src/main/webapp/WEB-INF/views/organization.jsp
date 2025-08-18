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
            <h2>자산운용조직 소개</h2>
            <ul>
                <li class="active"><a href="#section-intro">소개</a></li>
                <li><a href="#section-history">연혁</a></li>
                <li><a href="#">위원회</a></li>
            </ul>
        </aside>

        <%-- 페이지 주 내용 --%>
        <main class="page-content">
            <div class="breadcrumb">
                <span>홈</span> &gt; <span>자산운용조직 소개</span>
            </div>

            <section id="section-intro">
                <h1>자산운용조직 소개</h1>
                <p class="description">경찰공제회 자산운용부문은 회원의 소중한 자산을 더욱 투명하고 효율적으로 운용하기 위해 전문화된 조직체계를 갖추고 있습니다.</p>
                
                <h2>안녕하십니까. 경찰공제회입니다.</h2>
                <p>경찰공제회 정보교류시스템 홈페이지를 찾아주셔서 대단히 감사합니다. 저희 경찰공제회는 자산운용의 전문성, 투명성, 효율성을 제고하여 회원의 신뢰를 구축하고 안정적인 수익 창출에 기여하고자 자산운용 정보교류 시스템 홈페이지를 개편하였습니다.</p>
                <div style="height:300px; background:#f8f9fa; border: 1px solid #e9ecef; display:flex; align-items:center; justify-content:center; border-radius: 8px;">
                    소개 관련 콘텐츠 영역
                </div>
            </section>

            <section id="section-history">
                <h2>연혁</h2>
                <p>주요 투자 결정은 독립적인 위원회를 통해 이루어지며, 리스크 관리와 투자 심의를 강화하고 있습니다.</p>
                <div style="height:400px; background:#f8f9fa; border: 1px solid #e9ecef; display:flex; align-items:center; justify-content:center; border-radius: 8px;">
                    연혁 관련 콘텐츠 영역 (표, 연대표 등)
                </div>
            </section>
        </main>

        <%-- 오른쪽 목차 사이드바 (TOC) --%>
        <aside class="right-toc-sidebar">
            <h3>On this page</h3>
            <ul>
                <li><a href="#section-intro">소개</a></li>
                <li><a href="#section-history">연혁</a></li>
            </ul>
        </aside>
    </div>

    <%-- 푸터 영역 포함 --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
    <script src="/static/js/main.js"></script>
</body>
</html>