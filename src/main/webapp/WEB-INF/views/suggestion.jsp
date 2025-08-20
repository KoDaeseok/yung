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
                <table class="data-table">
                    <thead>
                        <tr>
                            <th style="width: 10%;">번호</th>
                            <th style="width: 50%;">제목</th>
                            <th style="width: 15%;">등록일</th>
                            <th style="width: 15%;">공개여부</th>
                            <th style="width: 10%;">상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty suggestions}">
                                <c:forEach var="item" items="${suggestions}">
                                    <tr>
                                        <td>${item.no}</td>
                                        <td style="text-align: left;">
                                            <a href="/suggestion/detail?id=${item.id}" style="text-decoration:none; color: #333;">${item.title}</a>
                                        </td>
                                        <td>${item.date}</td>
                                        <td>${item.isPublic}</td>
                                        <td><span class="status-badge complete">${item.status}</span></td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="5" class="no-data">
                                        <div class="no-data-content">게시글이 없습니다.</div>
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
                
                <div class="table-footer">
                    <div class="pagination-wrapper">
                        <div class="pagination">
                            <a href="#" class="arrow disabled">&laquo;</a>
                            <a href="#" class="arrow disabled">&lsaquo;</a>
                            <a href="#" class="active">1</a>
                            <a href="#" class="arrow">&rsaquo;</a>
                            <a href="#" class="arrow">&raquo;</a>
                        </div>
                    </div>
                    <div class="item-counter">1 - ${suggestions.size()} of ${suggestions.size()}</div>
                </div>
            </div>

        </main>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>