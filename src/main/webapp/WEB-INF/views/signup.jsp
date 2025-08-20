<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>경찰공제회 - ${pageTitle}</title>
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>
<body>
    <%-- 헤더 영역 포함 --%>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <%-- 메인 콘텐츠 --%>
    <main class="signup-container">
        <h1>${pageTitle}</h1>
        <form class="signup-form" id="signup-form">
            <table class="signup-table">
                <tbody>
                    <tr>
                        <th><label for="org-code"><span class="required">*</span> 소속기관</label></th>
                        <td colspan="3">
                            <div class="input-with-button">
                                <input type="text" id="org-code" name="orgCode" class="org-code" readonly>
                                <button type="button" class="btn-search" id="open-org-search-btn">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                </button>
                                <input type="text" id="org-name" name="orgName" class="org-name" readonly>
                            </div>
                            <div class="error-message" data-for="org-code"></div>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="user-id"><span class="required">*</span> 아이디</label></th>
                        <td colspan="3">
                            <input type="text" id="user-id" name="userId" class="short-input">
                            <div class="error-message" data-for="user-id"></div>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="user-name"><span class="required">*</span> 이름</label></th>
                        <td>
                            <input type="text" id="user-name" name="userName" class="short-input">
                            <div class="error-message" data-for="user-name"></div>
                        </td>
                        <th><label for="department"><span class="required">*</span> 소속부서</label></th>
                        <td>
                            <input type="text" id="department" name="department" class="short-input">
                            <div class="error-message" data-for="department"></div>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="password"><span class="required">*</span> 비밀번호</label></th>
                        <td>
                            <input type="password" id="password" name="password" class="short-input">
                            <div class="error-message" data-for="password"></div>
                        </td>
                        <th><label for="support-team"><span class="required">*</span> 공제회담당팀</label></th>
                        <td>
                            <select id="support-team" name="supportTeam" class="short-input">
                                <option value="">선택해주십시오.</option>
                                <option value="team1">경찰공제회 1팀</option>
                                <option value="team2">경찰공제회 2팀</option>
                            </select>
                            <div class="error-message" data-for="support-team"></div>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="password-confirm"><span class="required">*</span> 비밀번호 확인</label></th>
                        <td colspan="3">
                            <input type="password" id="password-confirm" name="passwordConfirm" class="short-input">
                            <div class="error-message" data-for="password-confirm"></div>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="email-id"><span class="required">*</span> 이메일</label></th>
                        <td colspan="3">
                            <div class="email-group">
                                <input type="text" id="email-id" name="emailId">
                                <span>@</span>
                                <input type="text" id="email-domain" name="emailDomain">
                            </div>
                            <div class="error-message" data-for="email-id"></div>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="company-phone1"><span class="required">*</span> 회사번호</label></th>
                        <td colspan="3">
                            <div class="phone-group">
                                <select id="company-phone1" name="companyPhone1">
                                    <option value="02">02</option>
                                    <option value="031">031</option>
                                    <option value="032">032</option>
                                </select>
                                <span>-</span>
                                <input type="text" id="company-phone2" name="companyPhone2" maxlength="4">
                                <span>-</span>
                                <input type="text" id="company-phone3" name="companyPhone3" maxlength="4">
                            </div>
                            <div class="error-message" data-for="company-phone1"></div>
                        </td>
                    </tr>
                    <tr>
                        <th><label for="fax-number1">팩스번호</label></th>
                        <td colspan="3">
                            <div class="phone-group">
                                <select id="fax-number1" name="faxNumber1">
                                    <option value="02">02</option>
                                    <option value="031">031</option>
                                    <option value="032">032</option>
                                </select>
                                <span>-</span>
                                <input type="text" id="fax-number2" name="faxNumber2" maxlength="4">
                                <span>-</span>
                                <input type="text" id="fax-number3" name="faxNumber3" maxlength="4">
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <p class="notice">※ 내부규정에 의거 분쟁거래만 가능한점 양지 바랍니다.</p>
            <div class="form-buttons">
                <button type="submit" class="btn btn-primary"><i class="fa-solid fa-check"></i> 등록</button>
                <button type="button" class="btn btn-secondary" onclick="location.href='/'"><i class="fa-solid fa-times"></i> 취소</button>
            </div>
        </form>
    </main>

    <%-- 기관 검색 팝업 파일 포함 --%>
    <jsp:include page="/WEB-INF/views/popup/orgSearchPopup.jsp" />

    <%-- 푸터 영역 포함 --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="/js/signup.js"></script>
</body>
</html>