<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <title>경찰공제회 - ${menuDetail.menuNm}</title>
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>
<body>
    <c:import url="/header.do" />

    <div class="page-container">
        <%-- 사이드바 --%>
        <c:import url="/lnb.do" />

        <main class="page-content">
            <div class="breadcrumb">
				<a href="/index.do">
					<i class="fa-solid fa-house"></i> 
					홈 
				</a>
				<span>></span>            
                <span>공지/건의</span>
				<span>></span>  
				<span>${menuDetail.menuNm}</span>
			</div>
            
            <h1>${menuDetail.menuNm}</h1>
            
            <div class="content-container">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th style="width: 15%;">공지구분</th>
                            <th style="width: 70%;">제목</th>
                            <th style="width: 15%;">등록일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%-- 데이터 유무에 따라 분기 처리 --%>
                        <c:choose>
                            <c:when test="${not empty noticeList}">
                                <c:forEach var="item" items="${noticeList}">
                                    <tr>
                                        <td>${item.type}</td>
                                        <td style="text-align: left;">
                                            <%-- 상세 페이지로 이동하는 링크 --%>
                                            <a href="/notice/detail?id=${item.id}" style="text-decoration:none; color: #333;">${item.title}</a>
                                        </td>
                                        <td>${item.date}</td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="3" class="no-data">
                                        <div class="no-data-content">데이터가 없습니다.</div>
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
                
                <div class="table-footer">
                    <c:if test="${not empty noticeList}">
                        <div class="pagination-wrapper">
                            <div class="pagination">
                                <a href="?page=1" class="arrow ${currentPage == 1 ? 'disabled' : ''}"><i class="fa-solid fa-angles-left"></i></a>
                                <a href="?page=${currentPage - 1}" class="arrow ${currentPage == 1 ? 'disabled' : ''}"><i class="fa-solid fa-angle-left"></i></a>
                                <c:forEach var="i" begin="${startPage}" end="${endPage}">
                                    <a href="?page=${i}" class="${i == currentPage ? 'active' : ''}">${i}</a>
                                </c:forEach>
                                <a href="?page=${currentPage + 1}" class="arrow ${currentPage == totalPages ? 'disabled' : ''}"><i class="fa-solid fa-angle-right"></i></a>
                                <a href="?page=${totalPages}" class="arrow ${currentPage == totalPages ? 'disabled' : ''}"><i class="fa-solid fa-angles-right"></i></a>
                            </div>
                        </div>
                        
                        <%-- 카운트 정보 동적으로 표시 --%>
                        <div class="item-counter">
                            <c:set var="startItem" value="${(currentPage - 1) * pageSize + 1}" />
                            <c:set var="endItem" value="${currentPage * pageSize}" />
                            ${startItem} - ${endItem > totalItems ? totalItems : endItem} of ${totalItems}
                        </div>
                    </c:if>
                </div>
            </div>

        </main>
    </div>

    <jsp:include page="/WEB-INF/jsp/common/footer.jsp" />

    <script src="/js/auth.js"></script>
</body>
</html>