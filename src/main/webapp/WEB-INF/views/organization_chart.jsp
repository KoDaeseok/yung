<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>경찰공제회 - ${pageTitle}</title>
    <link rel="stylesheet" href="/css/main.css">
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

            <section id="section-chart">
                <h1>조직도</h1>
                <div class="content-box">
                    <a href="https://www.pmaa.or.kr/www/1461128249370/orgcht.do" target="new" style="width:100%; height:auto;">
                        <img src="/images/bg_organization.png" alt="조직도 이미지" style="width:100%; height:auto;">
                    </a>
                </div>
                <div>
                    <p class="description">* 위 이미지 클릭시 경찰공제회 조직도로 이동합니다.</p>
                </div>
            </section>
            
            <section id="section-members">
                <h2>조직업무 소개</h2>
                <table class="department-table">
                    <thead>
                        <tr>
                            <th>부서</th>
                            <th>파트</th>
                            <th>세부업무</th>
                            <th>연락처</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="2" class="department-cell">투자전략팀</td>
                            <td>투자전략 및 자산배분 등</td>
                            <td rowspan="9" class="contact full-height">* 경찰공제회 홈페이지 참고</td>
                        </tr>
                        <tr>
                            <td rowspan="2" class="department-cell">채권투자팀</td>
                            <td class="part-cell">채권</td>
                            <td>국내·외 채권(직접, 간접) 투자 및 관리</td>
                        </tr>
                        <tr>
                            <td class="part-cell">단기자금</td>
                            <td>단기자금 투자 및 관리</td>
                        </tr>
                        <tr>
                            <td class="department-cell">주식투자팀</td>
                            <td class="part-cell">주식</td>
                            <td>국내·외 주식(직접, 간접) 투자 및 관리</td>
                        </tr>
                        <tr>
                            <td rowspan="2" class="department-cell">기업투자팀<br>인프라투자팀</td>
                            <td class="part-cell">금융</td>
                            <td rowspan="2">국내·외 대체투자(금융, 인프라) 투자 및 관리</td>
                        </tr>
                        <tr>
                            <td class="part-cell">인프라</td>
                        </tr>
                        <tr>
                            <td class="department-cell">사업투자팀</td>
                            <td class="part-cell">부동산</td>
                            <td>국내·외 대체투자(부동산) 투자 및 관리</td>
                        </tr>
                        <tr>
                            <td colspan="2" class="department-cell">투자심사팀</td>
                            <td>신규투자 리스크심사</td>
                        </tr>
                        <tr>
                            <td colspan="2" class="department-cell">리스크관리팀</td>
                            <td>투자자산 리스크관리</td>
                        </tr>
                    </tbody>
                </table>
            </section>
        </main>

        <c:if test="${not empty tocItems}">
            <aside class="right-toc-sidebar">
                <h3>조직도</h3>
                <ul>
                    <c:forEach var="item" items="${tocItems}">
                        <li><a href="${item.url}">${item.label}</a></li>
                    </c:forEach>
                </ul>
            </aside>
        </c:if>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script src="/js/organization.js"></script>
</body>
</html>