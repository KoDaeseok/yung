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
            <h1><i class="fa-solid fa-pen-to-square"></i> ${menuDetail.menuNm}</h1>

            <form id="plan-form">
                <div class="form-top-actions">
                    <p class="form-instruction">※ 엑셀업로드는 "양식 다운로드" 버튼을 통해 양식을 먼저 내려받으신 후 해당 양식을 통해 업로드하셔야 합니다.</p>
                    <div class="form-action-buttons">
                        <div class="search-fields">
                             <label for="target-year"><span class="required">*</span> 대상년도</label>
                            <input type="text" id="target-year" value="${year}" maxlength="4" placeholder="" readonly>
                        </div>
                        <button type="button" class="btn btn-outline" id="btn-download-template"><i class="fa-solid fa-download"></i> 양식 다운로드</button>
                        <label for="excel-upload" class="btn btn-outline"><i class="fa-solid fa-upload"></i> 엑셀 업로드</label>
                        <input type="file" id="excel-upload" style="display: none;" accept=".xls, .xlsx">
                    </div>
                </div>

                <div class="content-container plan-grid-container">
                    <div class="grid-header">
                        <span class="grid-title">연간 자금계획</span>
                        <span class="grid-unit">(단위: 원)</span>
                    </div>
                    <div id="plan-grid" class="plan-grid">
                        <%-- 자바스크립트로 그리드 생성 --%>
                    </div>
                </div>

                <div class="form-buttons">
                    <button type="button" class="btn btn-primary" id="btn-register"><i class="fa-solid fa-check"></i> 저장</button>
                    <button type="button" class="btn btn-secondary" onclick="location.href='/finops/plan/list'"><i class="fa-solid fa-times"></i> 취소</button>
                </div>
            </form>
        </main>
    </div>
    <jsp:include page="/WEB-INF/jsp/common/footer.jsp" />
    <script src="/js/auth.js"></script>
    <script src="/js/finops_plan.js"></script>
</body>
</html>