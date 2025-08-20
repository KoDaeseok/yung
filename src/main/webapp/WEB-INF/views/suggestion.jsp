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
        <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />

        <main class="page-content">
            <div class="breadcrumb">
                <c:forEach var="crumb" items="${breadcrumbs}" varStatus="status">
                    <c:if test="${not status.first}"><span>></span></c:if>
                    <a href="${crumb.url}"><c:if test="${status.first}"><i class="fa-solid fa-house"></i></c:if>${crumb.label}</a>
                </c:forEach>
            </div>

            <h1>${pageTitle}</h1>
            
            <div class="search-bar-container">
                <select name="search-type">
                    <option value="all">전체</option>
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>
                <input type="text" placeholder="검색어를 입력하세요">
                <button class="btn-search"><i class="fa-solid fa-magnifying-glass"></i> 검색</button>
            </div>

            <table class="list-table">
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
                    <c:forEach var="item" items="${suggestions}">
                        <tr>
                            <td>${item.no}</td>
                            <td class="title"><a href="#">${item.title}</a></td>
                            <td>${item.date}</td>
                            <td>${item.isPublic}</td>
                            <td><span class="status-badge complete">${item.status}</span></td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty suggestions}">
                        <tr>
                            <td colspan="5">게시글이 없습니다.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>

            <div class="pagination">
                <a href="#" class="arrow disabled">&laquo;</a>
                <a href="#" class="arrow disabled">&lsaquo;</a>
                <a href="#" class="active">1</a>
                <a href="#" class="arrow">&rsaquo;</a>
                <a href="#" class="arrow">&raquo;</a>
            </div>
        </main>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>