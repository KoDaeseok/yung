<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            <h1><i class="fa-solid fa-circle-info"></i> ${menuDetail.menuNm}</h1>
            <form id="finops-form">
                <table class="form-table">
                    <tbody>
                        <tr>
                            <th><span class="required">*</span> 펀드</th>
                            <td colspan="3">
                                <div class="input-with-button">
                                    <input type="text" name="fundCode" class="short-input" value="${asset.fundCode}" readonly>
                                    <button type="button" class="btn-search" style="display: none;"><i class="fa-solid fa-magnifying-glass"></i></button>
                                    <input type="text" name="fundName" class="wide-input" value="${asset.fundName}" readonly>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>재간접 펀드</th>
                            <td>
                                <select name="reInvestFund" class="short-input" disabled>
                                    <option <c:if test="${asset.reInvestFund == '선택'}">selected</c:if>>선택</option>
                                </select>
                            </td>
                            <th><span class="required">*</span> 대상분기</th>
                            <td>
                                <div style="display: flex; align-items: center; gap: 5px;">
                                    <input type="text" name="targetYear" style="width: 80px;" value="2024" readonly>
                                    <span>년</span>
                                    <select name="targetQuarter" style="width: 80px;" class="short-input" disabled>
                                        <option value="4" selected>4분기</option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>취득원가</th>
                            <td><input type="text" id="acquisitionCost" name="acquisitionCost" class="short-input" value="1,500,000,000" readonly></td>
                            <th>평가금액</th>
                            <td><input type="text" id="appraisedValue" name="appraisedValue" class="short-input" value="1,550,000,000" readonly></td>
                        </tr>
                    </tbody>
                </table>

                <%-- [수정] 수정 모드에서만 보이는 엑셀 버튼 영역 추가 --%>
                <div id="edit-mode-excel-buttons" class="button-container" style="margin-top: 20px; margin-bottom: 10px; justify-content: space-between; display: none;">
                    <div>
                        <p style="font-size: 13px; color: #888;">※ 엑셀업로드는 "양식 다운로드" 버튼을 통해 양식을 먼저 내려받으신 후 해당 양식을 통해 업로드하셔야 합니다.</p>
                    </div>
                    <div>
                        <button type="button" class="btn btn-outline" id="btn_down"><i class="fa-solid fa-download"></i> 양식 다운로드</button>
                        <label for="excel-upload" class="btn btn-outline"><i class="fa-solid fa-upload"></i> 엑셀 업로드</label>
                        <input type="file" id="excel-upload" style="display: none;" accept=".xls, .xlsx">
                    </div>
                </div>

                <%-- 편입자산 세부내역 테이블 --%>
                <div class="content-container" style="margin-top: 20px;">
                    <h4 style="margin-bottom: 10px;">편입자산 세부내역</h4>
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
                        <%-- [수정] 조회 모드와 수정 모드의 테이블 본문을 분리 --%>
                        <tbody id="view-mode-asset-body">
                            <%-- [수정] 데이터 유무에 따라 분기 처리 --%>
                            <c:choose>
                                <c:when test="${not empty assetDetailList}">
                                    <c:forEach var="item" items="${assetDetailList}">
                                        <tr>
                                            <td>${item.investType}</td>
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
                                    <tr>
                                        <td colspan="12" class="no-data">
                                            <div class="no-data-content" style="height: 250px;">데이터가 없습니다.</div>
                                        </td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                        <tbody id="asset-table-body" style="display: none;">
                            <tr>
                                <td colspan="12" class="no-data">
                                    <div class="no-data-content" style="height: 250px;">업로드할 데이터가 없습니다.</div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="button-container" id="view-mode-buttons">
                    <button type="button" class="btn btn-primary" id="edit-btn"><i class="fa-solid fa-edit"></i> 수정</button>
                    <button type="button" class="btn btn-outline" id="delete-btn"><i class="fa-solid fa-trash"></i> 삭제</button>
                    <button type="button" class="btn btn-outline" onclick="location.href='/finops/asset/list'"><i class="fa-solid fa-list"></i> 목록</button>
                </div>
                <div class="form-buttons" id="edit-mode-buttons" style="display: none;">
                    <button type="submit" class="btn btn-primary"><i class="fa-solid fa-check"></i> 저장</button>
                    <button type="button" class="btn btn-secondary" id="cancel-btn"><i class="fa-solid fa-times"></i> 취소</button>
                </div>        
            </form>
        </main>
    </div>
    <c:import url="/WEB-INF/jsp/common/footer.jsp" />
    <script src="/js/auth.js"></script>
    <script src="/js/finops.js"></script>
    <%-- 펀드 검색 팝업 파일 포함 --%>
    <c:import url="/WEB-INF/jsp/popup/fundSearchPopup.jsp" />
    <script src="/js/finops_popup.js"></script>
    <%-- [추가] 상세 페이지에서도 asset 스크립트 로드 --%>
    <script src="/js/finops_asset.js"></script>
</body>
</html>