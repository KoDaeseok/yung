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
                <a href="/"><i class="fa-solid fa-house"></i> 홈</a>
                <span>></span><span>운용관리</span><span>></span><span>${menuDetail.menuNm}</span>
            </div>
            <h1>${menuDetail.menuNm}</h1>
            
            <%-- 검색 영역 class 수정 --%>
            <div class="asset-search-bar">
                <div class="search-fields">
                    <label for="fund-code">펀드</label>
                    <div class="input-with-button">
                        <input type="text" id="fund-code" name="fundCode" class="short-input" placeholder="펀드코드" value="951515032501">
                        <button type="button" class="btn-search"><i class="fa-solid fa-magnifying-glass"></i></button>
                        <input type="text" name="fundName" class="wide-input" placeholder="펀드명" value="KBPG에너지인프라모특별자산신탁" readonly>
                    </div>
                </div>
                 <div class="search-fields">
                    <label for="re-invest-fund">재간접 펀드</label>
                    <select id="re-invest-fund" name="reInvestFund" class="short-input">
                        <option>선택</option>
                    </select>
                </div>
                <div class="search-fields">
                    <label for="target-year">대상분기</label>
                    <input type="text" id="target-year" name="targetYear" value="2024">
                    <span>년</span>
                    <select id="target-quarter" name="targetQuarter" class="short-input">
                        <option value="1">1분기</option>
                        <option value="2">2분기</option>
                        <option value="3">3분기</option>
                        <option value="4" selected>4분기</option>
                    </select>
                </div>
                <div class="search-buttons">
                    <button type="submit" class="btn btn-dark"><i class="fa-solid fa-search"></i> 조회</button>
                </div>
            </div>

            <div class="content-container">
                <table class="data-table">
                    <thead style="text-align: center;">
                        <tr>
                            <th rowspan="2" style="vertical-align: middle;">투자명(기업명)</th>
                            <th rowspan="2" style="vertical-align: middle;">투자개요</th>
                            <th rowspan="2" style="vertical-align: middle;">투자대상국</th>
                            <th colspan="2">하위 투자대상</th>
                            <th rowspan="2" style="vertical-align: middle;">투자상태</th>
                            <th colspan="2">투자금(취득원가)</th>
                            <th colspan="2">현재 평가금액</th>
                            <th rowspan="2" style="vertical-align: middle;">Gross TVPI</th>
                            <th rowspan="2" style="vertical-align: middle;">Gross IRR(%)</th>
                        </tr>
                        <tr>
                            <th>투자방식</th>
                            <th>금리유형</th>
                            <th>원화기준</th>
                            <th>외화기준</th>
                            <th>원화기준</th>
                            <th>외화기준</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty list}">
                                <c:forEach var="item" items="${list}">
                                    <tr data-href="/finops/asset/detail?id=${item.id}">
                                        <td class="text-link">${item.investType}</td>
                                        <td style="text-align: left;">${item.overview}</td>
                                        <td>${item.country}</td>
                                        <td>${item.entrAstsIvMethNm}</td>
                                        <td>${item.entrAstsRateNm}</td>
                                        <td>${item.ivStatTcNm}</td>
                                        <td style="text-align: right;"><fmt:formatNumber value="${item.ivAmt}" pattern="#,###" /></td>
                                        <td style="text-align: right;"><fmt:formatNumber value="${item.fxIvAmt}" pattern="#,###" /></td>
                                        <td style="text-align: right;"><fmt:formatNumber value="${item.ivEstmAmt}" pattern="#,###" /></td>
                                        <td style="text-align: right;"><fmt:formatNumber value="${item.fxIvEstmAmt}" pattern="#,###" /></td>
                                        <td style="text-align: right;">${item.grossTvpi}</td>
                                        <td style="text-align: right;">${item.grossIrr}</td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr><td colspan="12" class="no-data"><div class="no-data-content">데이터가 없습니다.</div></td></tr>
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
                    <a href="/finops/asset/form" class="btn btn-primary"><i class="fa-solid fa-pen"></i> 등록</a>
                </div>
            </div>
        </main>
    </div>
    <jsp:include page="/WEB-INF/jsp/common/footer.jsp" />
    <script src="/js/auth.js"></script>
    <script src="/js/finops.js"></script>
    <jsp:include page="/WEB-INF/jsp/popup/fundSearchPopup.jsp" />
    <script src="/js/finops_popup.js"></script>
    <script src="/js/clickable-rows.js"></script>
</body>
</html>