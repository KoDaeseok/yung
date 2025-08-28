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
                <span>></span>
                <span>투자제안</span>
                <span>></span>
                <span>${menuDetail.menuNm}</span>
            </div>
            
            <h1>${menuDetail.menuNm}</h1>
            
            <div class="content-container">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th style="width: 8%;">요청일자</th>
                            <th style="width: 10%;">투자접수번호</th>
                            <th style="width: 8%;">진행상태</th>
                            <th style="width: 10%;">투자분야</th>
                            <th style="width: auto;">제안제목</th>
                            <th style="width: 10%;">미팅예정일시</th>
                            <th style="width: 8%;">제안통화</th>
                            <th style="width: 10%;">제안금액</th>
                            <th style="width: 8%;">제안자</th>
                            <th style="width: 8%;">담당팀</th>
                            <th style="width: 8%;">담당자</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty propvestList}">
                                <c:forEach var="item" items="${propvestList}">
                                    <tr data-href="/propvest/detail?id=${item.id}">
                                        <td>${item.date}</td>
                                        <td>${item.id}</td>
                                        <td class="status-cell">
                                            <c:choose>
                                                <c:when test="${item.status == '검토완료'}">
                                                    <span class="status-badge complete">${item.status}</span>
                                                </c:when>
                                                <c:when test="${item.status == '검토중'}">
                                                    <span class="status-badge pending">${item.status}</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="status-badge">${item.status}</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>부동산</td>
                                        <td style="text-align: left;">
                                            <a href="/propvest/detail?id=${item.id}" style="text-decoration:none; color: #333;">${item.title}</a>
                                        </td>
                                        <td>2025-09-01</td>
                                        <td>KRW</td>
                                        <td style="text-align: right;">500,000,000</td>
                                        <td>${item.proposer}</td>
                                        <td>기업투자팀</td>
                                        <td>김담당</td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="11" class="no-data">
                                        <div class="no-data-content">제안이 없습니다.</div>
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
                
                <div class="table-footer">
                    <c:if test="${not empty propvestList}">
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
            
            <div class="button-container">
                <a href="/propvest/new" class="btn btn-primary"><i class="fa-solid fa-pen"></i> 신규 제안 등록</a>
            </div>
        </main>
    </div>

    <c:import url="/WEB-INF/jsp/common/footer.jsp" />
    <script src="/js/auth.js"></script>
    <script src="/js/clickable-rows.js"></script>
</body>
</html>