<!-- views/organization.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- JSTL 사용을 위한 taglib 선언 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>경찰공제회 - ${pageTitle}</title>
    <link rel="stylesheet" href="/static/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>
<body>
    <%-- 헤더 영역 포함 --%>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <%-- 메인 콘텐츠 --%>
    <div class="page-container">
        
        <%-- 왼쪽 사이드바 (LNB) - 동적 생성 --%>
        <aside class="left-sidebar">
            <h2>${pageTitle}</h2>
            <ul>
                <c:forEach var="item" items="${lnbItems}">
                    <li class="${item.isActive ? 'active' : ''}">
                        <a href="${item.url}">${item.label}</a>
                    </li>
                </c:forEach>
            </ul>
        </aside>

        <%-- 페이지 주 내용 --%>
        <main class="page-content">
        
            <%-- 이동 경로 (Breadcrumb) - 동적 생성 --%>
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

            <section id="section-intro">
                <h1>${pageTitle}</h1>
                <p class="description">${pageDescription}</p>
                
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

        <%-- 오른쪽 목차 사이드바 (TOC) - 동적 생성 --%>
        <aside class="right-toc-sidebar">
            <h3>${pageTitle}</h3>
            <ul>
                <c:forEach var="item" items="${tocItems}">
                    <li><a href="${item.url}">${item.label}</a></li>
                </c:forEach>
            </ul>
        </aside>
    </div>

    <%-- 푸터 영역 --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
    <%-- script --%>
    <script src="/static/js/auth.js"></script>
    <script src="/static/js/organization.js"></script>
</body>
</html>