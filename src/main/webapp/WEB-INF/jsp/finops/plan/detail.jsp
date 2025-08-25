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

            <form id="plan-form" onsubmit="return false;">
                 <div class="form-top-actions">
                    <%-- [수정] 상세 페이지에서는 빈 div로 공간만 차지 --%>
                    <div class="form-instruction"></div> 
                    <div class="search-fields">
                        <label for="target-year">대상년도</label>
                        <%-- [수정] input을 div로 변경하여 수정 불가 명시 --%>
                        <div id="target-year" class="readonly-field">${plan.year}</div>
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

                <div class="button-container">
                    <button type="button" class="btn btn-primary" id="edit-btn" onclick="location.href='/finops/plan/form?year=${plan.year}'"><i class="fa-solid fa-edit"></i> 수정</button>
                    <button type="button" class="btn btn-outline" id="delete-btn"><i class="fa-solid fa-trash"></i> 삭제</button>
                    <button type="button" class="btn btn-outline" onclick="location.href='/finops/plan/list'"><i class="fa-solid fa-list"></i> 목록</button>
                </div>
            </form>
        </main>
    </div>
    <jsp:include page="/WEB-INF/jsp/common/footer.jsp" />
    <script src="/js/auth.js"></script>
    <script src="/js/finops_plan.js"></script>
</body>
</html>