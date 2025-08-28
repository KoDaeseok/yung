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
                <span>></span><span>세미나/미팅제안</span><span>></span><span>${menuDetail.menuNm}</span>
            </div>
            <h1>${menuDetail.menuNm}</h1>
            
            <div class="search-bar-wrapper">
                <div class="search-fields">
                    <label for="status-filter">상태</label>
                    <select id="status-filter" name="status" class="short-input" style="width: 170px;">
                        <option value="">전체</option>
                        <option value="requested">요청</option>
                        <option value="approved">승인</option>
                        <option value="rejected">반려</option>
                        <option value="completed">완료</option>
                    </select>
                </div>
                <div class="search-buttons">
                    <button type="submit" class="btn btn-dark"><i class="fa-solid fa-search"></i> 조회</button>
                </div>
            </div>

            <div class="content-container">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th style="width: 10%;">요청일자</th>
                            <th style="width: 8%;">상태</th>
                            <th style="width: 8%;">구분</th>
                            <th style="width: auto;">주제</th>
                            <th style="width: 15%;">일시</th>
                            <th style="width: 12%;">담당팀</th>
                            <th style="width: 10%;">담당자</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty list}">
                                <c:forEach var="item" items="${list}">
                                    <tr data-href="/investtalk/detail?id=${item.id}">
                                        <td>${item.regDate}</td>
                                        <td>
                                            <span class="status-badge ${item.status == '요청' ? 'requested' : item.status == '승인' ? 'approved' : item.status == '완료' ? 'complete' : 'pending'}">${item.status}</span>
                                        </td>
                                        <td>${item.type}</td>
                                        <td style="text-align: left;" class="text-link">${item.title}</td>
                                        <td>${item.date} ${item.time}</td>
                                        <td>${item.team}</td>
                                        <td>${item.manager}</td>
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
                    <a href="/investtalk/form?type=미팅" class="btn btn-primary"><i class="fa-solid fa-pen"></i> 미팅 신규제안</a>
                    <a href="/investtalk/form?type=세미나" class="btn btn-primary"><i class="fa-solid fa-pen"></i> 세미나 신규제안</a>
                </div>
            </div>
        </main>
    </div>
    <c:import url="/WEB-INF/jsp/common/footer.jsp" />
    <script src="/js/auth.js"></script>
    <script src="/js/clickable-rows.js"></script>
</body>
</html>