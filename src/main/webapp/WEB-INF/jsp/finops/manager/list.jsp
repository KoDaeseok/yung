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
                <span>></span><span>운용관리</span><span>></span><span>${menuDetail.menuNm}</span>
            </div>
            <h1>${menuDetail.menuNm}</h1>
            
            <%-- [수정] 식별을 위한 클래스 추가 --%>
            <div class="search-bar-wrapper manager-list-search">
                <div class="search-fields">
                    <label for="fund-code">펀드</label>
                    <div class="input-with-button">
                        <input type="text" name="fundCode" class="short-input" placeholder="펀드코드">
                        <button type="button" class="btn-search"><i class="fa-solid fa-magnifying-glass"></i></button>
                        <input type="text" name="fundName" class="wide-input" placeholder="펀드명" readonly>
                    </div>
                </div>
                <div class="search-fields">
                    <label for="manager-name">담당자명</label>
                    <input type="text" id="manager-name" class="short-input">
                </div>
                <div class="search-buttons">
                    <button type="button" class="btn btn-dark"><i class="fa-solid fa-search"></i> 조회</button>
                </div>
            </div>

            <div class="content-container">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th style="width: 20%;">펀드명</th>
                            <th style="width: 10%;">이름</th>
                            <th style="width: 10%;">직위</th>
                            <th style="width: 20%;">담당업무</th>
                            <th style="width: 10%;">기관구분</th>
                            <th style="width: 15%;">연락처</th>
                            <th style="width: 15%;">휴대폰</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty list}">
                                <c:forEach var="item" items="${list}">
                                    <tr data-href="/finops/manager/detail?id=${item.id}">
                                        <td style="text-align: left;" class="text-link">${item.fundName}</td>
                                        <td>${item.managerName}</td>
                                        <td>${item.position}</td>
                                        <td style="text-align: left;">${item.task}</td>
                                        <td>${item.orgType}</td>
                                        <td>${item.phone}</td>
                                        <td>${item.mobile}</td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr><td colspan="7" class="no-data"><div class="no-data-content">데이터가 없습니다.</div></td></tr>
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
                <div class="button-container">
                    <a href="/finops/manager/form" class="btn btn-primary"><i class="fa-solid fa-pen"></i> 등록</a>
                </div>
            </div>
        </main>
    </div>
    <c:import url="/WEB-INF/jsp/common/footer.jsp" />
    <c:import url="/WEB-INF/jsp/popup/fundSearchPopup.jsp" />
    <script src="/js/auth.js"></script>
    <script src="/js/finops_popup.js"></script>
    <script src="/js/clickable-rows.js"></script>
</body>
</html>