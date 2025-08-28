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
            <h1><i class="fa-solid fa-pen-to-square"></i> ${menuDetail.menuNm}</h1>
            <form id="finops-form-new">
                <table class="form-table">
                     <tbody>
                        <tr>
                            <th><span class="required">*</span> 펀드코드</th>
                            <td colspan="3">
                                <div class="input-with-button">
                                    <input type="text" name="fundCode" class="short-input" placeholder="펀드코드">
                                    <button type="button" class="btn-search"><i class="fa-solid fa-magnifying-glass"></i></button>
                                    <input type="text" name="fundName" class="wide-input" placeholder="펀드명" readonly>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 보고주기</th>
                            <td>
                                <select name="cycle" class="short-input"><option>분기</option><option>월</option></select>
                            </td>
                            <th><span class="required">*</span> 보고년월</th>
                            <td><input type="month" name="reportMonth" class="short-input" value="2025-08"></td>
                        </tr>
                         <tr>
                            <th>종합현황</th>
                            <td colspan="3"><textarea name="overview" style="width: 100%; height: 80px; resize: vertical;"></textarea></td>
                        </tr>
                        <tr>
                            <th>현재 운용인력</th>
                            <td colspan="3"><input type="text" name="staff"></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 주요인력변동 여부</th>
                            <td colspan="3">
                                <select name="staffChange" class="short-input"><option value="Y">Y</option><option value="N" selected>N</option></select>
                            </td>
                        </tr>
                         <tr>
                            <th>주요인력변동</th>
                            <td colspan="3"><textarea name="staffChangeDetail" style="width: 100%; height: 80px; resize: vertical;" placeholder="1/1(변동일자) 기존인력 ===> 변동인력"></textarea></td>
                        </tr>
                        <tr>
                            <th>계약내용준수여부</th>
                            <td colspan="3"><input type="text" name="compliance"></td>
                        </tr>
                        <tr>
                            <th>최근 이슈</th>
                            <td colspan="3"><input type="text" name="recentIssue"></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 운용보고</th>
                            <td colspan="3">
                                <div class="file-input-wrapper">
                                     <input type="text" readonly placeholder="파일을 첨부해주세요.">
                                     <label for="file-upload" class="btn btn-dark">파일찾기</label>
                                     <input type="file" id="file-upload" name="attachment" style="display: none;">
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="form-buttons">
                    <button type="submit" class="btn btn-primary"><i class="fa-solid fa-check"></i> 등록</button>
                    <button type="button" class="btn btn-secondary" onclick="location.href='/finops/report/list'"><i class="fa-solid fa-times"></i> 취소</button>
                </div>
            </form>
        </main>
    </div>
    <c:import url="/WEB-INF/jsp/common/footer.jsp" />
    <script src="/js/auth.js"></script>
    <%-- 펀드 검색 팝업 파일 포함 --%>
    <c:import url="/WEB-INF/jsp/popup/fundSearchPopup.jsp" />
    <script src="/js/finops_popup.js"></script>
</body>
</html>