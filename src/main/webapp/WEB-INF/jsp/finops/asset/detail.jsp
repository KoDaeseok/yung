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
            <h1><i class="fa-solid fa-circle-info"></i> ${menuDetail.menuNm}</h1>
            <form id="finops-form">
                <table class="form-table">
                     <tbody>
                        <tr>
                            <th><span class="required">*</span> 펀드</th>
                            <td colspan="3">
                                <div class="input-with-button">
                                    <input type="text" name="fundCode" class="short-input" value="${asset.fundCode}" readonly>
                                    <button type="button" class="btn-search" disabled><i class="fa-solid fa-magnifying-glass"></i></button>
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
                            <td><input type="text" name="acquisitionCost" class="short-input" value="1,500,000,000" readonly></td>
                            <th>평가금액</th>
                            <td><input type="text" name="appraisedValue" class="short-input" value="1,550,000,000" readonly></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 투자형(기업명)</th>
                            <td><input type="text" name="investType" class="short-input" value="${asset.investType}" readonly></td>
                            <th><span class="required">*</span> 투자개요</th>
                            <td><input type="text" name="overview" class="short-input" value="${asset.overview}" readonly></td>
                        </tr>
                        <tr>
                             <th><span class="required">*</span> 투자대상국</th>
                            <td><input type="text" name="country" class="short-input" value="${asset.country}" readonly></td>
                        </tr>
                    </tbody>
                </table>
                <div class="button-container" id="view-mode-buttons">
                    <button type="button" class="btn btn-primary" id="edit-btn"><i class="fa-solid fa-edit"></i> 수정</button>
                    <button type="button" class="btn btn-outline" onclick="location.href='/finops/asset/list'"><i class="fa-solid fa-list"></i> 목록</button>
                </div>
                <div class="form-buttons" id="edit-mode-buttons" style="display: none;">
                    <button type="submit" class="btn btn-primary"><i class="fa-solid fa-check"></i> 저장</button>
                    <button type="button" class="btn btn-secondary" id="cancel-btn"><i class="fa-solid fa-times"></i> 취소</button>
                </div>
            </form>
        </main>
    </div>
    <jsp:include page="/WEB-INF/jsp/common/footer.jsp" />
    <script src="/js/auth.js"></script>
    <script src="/js/finops.js"></script>
    <%-- 펀드 검색 팝업 파일 포함 --%>
    <jsp:include page="/WEB-INF/jsp/popup/fundSearchPopup.jsp" />
    <script src="/js/finops_popup.js"></script>
</body>
</html>