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
                            <th style="width: 10%;">구분</th>
                            <th style="width: 65%;">제목</th>
                            <th style="width: 15%;">등록일</th>
                            <th style="width: 10%;">답변상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%-- 데이터 유무에 따라 분기 처리 --%>
                        <c:choose>
                            <c:when test="${not empty suggestionList}">
                                <c:forEach var="item" items="${suggestionList}">
                                    <tr>
                                        <td>${item.type}</td>
                                        <td style="text-align: left;">
                                             <a href="#" style="text-decoration:none; color: #333;">${item.title}</a>
                                        </td>
                                        <td>${item.date}</td>
                                        <td>
                                            <span class="status-${item.status == '답변완료' ? 'completed' : 'pending'}">${item.status}</span>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="4" class="no-data">
                                        <div class="no-data-content">데이터가 없습니다.</div>
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
                            <a href="#" class="arrow disabled">&rsaquo;</a>
                            <a href="#" class="arrow disabled">&raquo;</a>
                        </div>
                    </div>
                    <%-- 카운트 정보 동적으로 표시 --%>
                    <div class="item-counter">1 - ${suggestionList.size()} of ${suggestionList.size()}</div>
                </div>
            </div>

        </main>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>