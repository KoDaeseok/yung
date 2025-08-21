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
                                    <input type="text" name="fundCode" class="short-input" value="951515032501" readonly>
                                    <button type="button" class="btn-search" disabled><i class="fa-solid fa-magnifying-glass"></i></button>
                                    <input type="text" name="fundName" class="wide-input" value="KB PG 에너지인프라모특별자산투자" readonly>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 보고월</th>
                            <td><input type="month" name="reportMonth" class="short-input" value="2025-08" readonly></td>
                            <th>금액</th>
                            <td>
                                <%-- 금액 포맷팅을 위해 JSTL fmt 태그 사용 --%>
                                <c:set var="amountValue" value="10000000" />
                                <input type="text" name="amount" class="short-input" value="<fmt:formatNumber value="${amountValue}" pattern="#,###" />" readonly>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 잔고증명서</th>
                            <td colspan="3">
                                <div id="file-list-container">
                                    <%-- 예시 파일 목록 --%>
                                    <div class="file-item">
                                        <a href="#" class="text-link">잔고증명서_202508_v1.pdf</a>
                                        <button type="button" class="btn-delete-file" style="display:none;">&times;</button>
                                    </div>
                                     <div class="file-item">
                                        <a href="#" class="text-link">추가확인서_202508.pdf</a>
                                        <button type="button" class="btn-delete-file" style="display:none;">&times;</button>
                                    </div>
                                </div>
                                <%-- 파일 추가 버튼 (수정 시에만 보임) --%>
                                <div id="file-add-wrapper" style="display:none; margin-top:10px;">
                                    <div class="file-input-wrapper">
                                         <input type="text" readonly placeholder="파일을 첨부해주세요.">
                                         <label for="file-upload" class="btn btn-dark">파일찾기</label>
                                         <input type="file" id="file-upload" name="attachment" style="display: none;">
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="button-container" id="view-mode-buttons">
                    <button type="button" class="btn btn-primary" id="edit-btn"><i class="fa-solid fa-edit"></i> 수정</button>
                    <button type="button" class="btn btn-outline" onclick="location.href='/finops/balance_cert/list'"><i class="fa-solid fa-list"></i> 목록</button>
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
</body>
</html>