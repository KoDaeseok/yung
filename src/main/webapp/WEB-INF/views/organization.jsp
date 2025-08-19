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
        
        <aside class="left-sidebar">
            <h2>자산운용조직</h2>
            <ul>
                <c:forEach var="item" items="${lnbItems}">
                    <li class="${item.isActive ? 'active' : ''}">
                        <a href="${item.url}">${item.label}</a>
                    </li>
                </c:forEach>
            </ul>
        </aside>

        <main class="page-content">
        
            <div class="breadcrumb">
                <c:forEach var="crumb" items="${breadcrumbs}" varStatus="status">
                    <c:if test="${not status.first}">
                        <span>&gt;</span>
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

            <%-- ================================================= --%>
            <%-- ▼▼▼ 탭에 따라 다른 콘텐츠를 표시하는 영역 ▼▼▼ --%>
            <%-- ================================================= --%>

            <%-- 1. '소개' 탭 콘텐츠 --%>
            <c:if test="${currentTab == 'intro'}">
                <section id="section-intro">
                    <h1>자산운용조직 소개</h1>
                    <p class="description">${pageDescription}</p>
                    <h2>안녕하십니까. 경찰공제회입니다.</h2>
                    <p>경찰공제회 정보교류시스템 홈페이지를 찾아주셔서 대단히 감사합니다. 저희 경찰공제회는 자산운용의 전문성, 투명성, 효율성을 제고하여 회원의 신뢰를 구축하고 안정적인 수익 창출에 기여하고자 자산운용 정보교류 시스템 홈페이지를 개편하였습니다.</p>
                    <div class="content-box">소개 관련 콘텐츠 영역</div>
                </section>
                <section id="section-history">
                    <h2>연혁</h2>
                    <p>주요 투자 결정은 독립적인 위원회를 통해 이루어지며, 리스크 관리와 투자 심의를 강화하고 있습니다.</p>
                    <div class="content-box">연혁 관련 콘텐츠 영역 (표, 연대표 등)</div>
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
                    <div class="content-box">
                        <img src="https://i.ibb.co/8bkc35G/location-map.png" alt="찾아오시는 길 지도" style="width:100%; height:auto;">
                    </div>
                </section>
            </c:if>

        </main>

        <aside class="right-toc-sidebar">
            <h3>자산운용조직</h3>
            <ul>
                <c:forEach var="item" items="${tocItems}">
                    <li><a href="${item.url}">${item.label}</a></li>
                </c:forEach>
            </ul>
        </aside>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
    <script src="/static/js/auth.js"></script>
    <script src="/static/js/organization.js"></script>
</body>
</html>