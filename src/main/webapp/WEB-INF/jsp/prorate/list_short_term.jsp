<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <c:import url="/lnb.do" />
        <main class="page-content">
            <div class="breadcrumb">
                <a href="/index.do"><i class="fa-solid fa-house"></i> 홈</a>
                <span>></span><span>금리제안</span><span>></span><span>${menuDetail.menuNm}</span>
            </div>
            <h1>${menuDetail.menuNm}</h1>
            <div class="content-container">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th style="width: 15%;">등록번호</th>
                            <th style="width: 15%;">요청팀</th>
                            <th style="width: auto;">요청명</th>
                            <th style="width: 15%;">게시일자</th>
                            <th style="width: 15%;">마감일시</th>
                            <th style="width: 10%;">등록여부</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty list}">
                                <c:forEach var="item" items="${list}">
                                    <%-- [수정] 클릭 시 form 페이지로 이동하도록 data-href 변경 --%>
                                    <tr data-href="/prorate/form?type=short&id=${item.id}">
                                        <td>${item.regNum}</td>
                                        <td>${item.team}</td>
                                        <td style="text-align: left;" class="text-link">${item.title}</td>
                                        <td>${item.postDate}</td>
                                        <td>${item.endDate}</td>
                                        <td>
                                             <span class="status-badge ${item.regStatus == '등록완료' ? 'complete' : 'pending'}">${item.regStatus}</span>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="6" class="no-data"><div class="no-data-content">데이터가 없습니다.</div></td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
                <div class="table-footer">
                    <c:if test="${not empty list}">
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
    <c:import url="/WEB-INF/jsp/common/footer.jsp" />
    <script src="/js/auth.js"></script>
    <script src="/js/clickable-rows.js"></script>
</body>
</html>