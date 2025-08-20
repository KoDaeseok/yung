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
            
            <h1>${pageTitle}</h1>
            
            <div class="content-container">
                <table class="detail-table">
                    <tbody>
                        <tr>
                            <th>제목</th>
                            <td colspan="3">${suggestion.title}</td>
                        </tr>
                        <tr>
                            <th>담당부서</th>
                            <td>${suggestion.department}</td>
                            <th>공개여부</th>
                            <td>${suggestion.isPublic}</td>
                        </tr>
                        <tr>
                            <th>공제회 담당팀</th>
                            <td colspan="3">${suggestion.pmaaTeam}</td>
                        </tr>
                    </tbody>
                </table>

                <div class="content-body">
                    ${suggestion.content}
                </div>
                
                <div class="button-container">
                    <button type="button" class="btn btn-outline" onclick="location.href='/suggestion'">
                        <i class="fa-solid fa-list"></i> 목록
                    </button>
                </div>
            </div>
        </main>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>