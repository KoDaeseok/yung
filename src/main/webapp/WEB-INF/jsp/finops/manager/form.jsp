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
            <h1><i class="fa-solid fa-id-badge"></i> ${pageTitle}</h1>

            <form id="manager-form" onsubmit="return false;">
                <table class="form-table">
                    <tbody>
                        <tr>
                            <th><span class="required">*</span> 펀드</th>
                            <td colspan="3">
                                <div class="input-with-button">
                                    <input type="text" name="fundCode" class="short-input" placeholder="펀드코드" value="${manager.fundCode}">
                                    <button type="button" class="btn-search"><i class="fa-solid fa-magnifying-glass"></i></button>
                                    <input type="text" name="fundName" class="wide-input" placeholder="펀드명" value="${manager.fundName}" readonly>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 기관구분</th>
                            <td>
                                <select name="orgType" class="short-input">
                                    <option value="">선택</option>
                                    <option value="운용사" ${manager.orgType == '운용사' ? 'selected' : ''}>운용사</option>
                                    <option value="사무수탁사" ${manager.orgType == '사무수탁사' ? 'selected' : ''}>사무수탁사</option>
                                    <option value="판매사" ${manager.orgType == '판매사' ? 'selected' : ''}>판매사</option>
                                    <option value="수탁사" ${manager.orgType == '수탁사' ? 'selected' : ''}>수탁사</option>
                                </select>
                            </td>
                            <th><span class="required">*</span> 역할구분</th>
                            <td>
                                <select name="roleType" class="short-input">
                                    <option value="">선택</option>
                                    <option value="운용역" ${manager.roleType == '운용역' ? 'selected' : ''}>운용역</option>
                                    <option value="마케터" ${manager.roleType == '마케터' ? 'selected' : ''}>마케터</option>
                                    <option value="컴플라이언스" ${manager.roleType == '컴플라이언스' ? 'selected' : ''}>컴플라이언스</option>
                                    <option value="기타" ${manager.roleType == '기타' ? 'selected' : ''}>기타</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 이름</th>
                            <td><input type="text" name="managerName" class="short-input" value="${manager.managerName}"></td>
                            <th><span class="required">*</span> 직위</th>
                            <td><input type="text" name="position" class="short-input" value="${manager.position}"></td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td colspan="3">
                                <div class="email-group">
                                    <input type="text" id="email-id" name="emailId" value="${manager.emailId}">
                                    <span>@</span>
                                    <input type="text" id="email-domain" name="emailDomain" value="${manager.emailDomain}">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>휴대폰</th>
                            <td>
                                <div class="phone-group">
                                    <select name="mobile1" style="width: 80px;">
                                        <option value="010" ${manager.mobile1 == '010' ? 'selected' : ''}>010</option>
                                        <option value="011" ${manager.mobile1 == '011' ? 'selected' : ''}>011</option>
                                    </select>
                                    <span>-</span>
                                    <input type="text" name="mobile2" maxlength="4" style="width: 80px;" value="${manager.mobile2}">
                                    <span>-</span>
                                    <input type="text" name="mobile3" maxlength="4" style="width: 80px;" value="${manager.mobile3}">
                                </div>
                            </td>
                            <th>전화번호(내선)</th>
                            <td>
                                <div class="phone-group">
                                    <select name="phone1" style="width: 80px;">
                                        <option value="02" ${manager.phone1 == '02' ? 'selected' : ''}>02</option>
                                        <option value="031" ${manager.phone1 == '031' ? 'selected' : ''}>031</option>
                                    </select>
                                    <span>-</span>
                                    <input type="text" name="phone2" maxlength="4" style="width: 80px;" value="${manager.phone2}">
                                    <span>-</span>
                                    <input type="text" name="phone3" maxlength="4" style="width: 80px;" value="${manager.phone3}">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>담당업무</th>
                            <td colspan="3"><input type="text" name="task" value="${manager.task}"></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 담당기간</th>
                            <td colspan="3">
                                <div class="date-range">
                                    <input type="date" name="startDate" class="short-input" value="${manager.startDate}">
                                    <span>~</span>
                                    <input type="date" name="endDate" class="short-input" value="${manager.endDate}">
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="form-buttons">
                    <button type="submit" class="btn btn-primary"><i class="fa-solid fa-check"></i> ${isNew ? '등록' : '저장'}</button>
                    <button type="button" class="btn btn-secondary" onclick="location.href='/finops/manager/list'"><i class="fa-solid fa-times"></i> 취소</button>
                </div>
            </form>
        </main>
    </div>
    <jsp:include page="/WEB-INF/jsp/common/footer.jsp" />
    <jsp:include page="/WEB-INF/jsp/popup/fundSearchPopup.jsp" />
    <script src="/js/auth.js"></script>
    <script src="/js/finops_popup.js"></script>
    <script src="/js/finops_manager.js"></script>
</body>
</html>