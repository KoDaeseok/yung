<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>경찰공제회 - ${pageTitle}</title>
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>
<body>
    <c:import url="/header.do" />
    <main class="main-container main-container-form">
        <h1><i class="fa-solid fa-user-pen"></i> ${pageTitle}</h1>

        <%-- 관리자인 경우에만 사용자 목록 표시 --%>
        <c:if test="${isAdmin}">
            <div class="section-title" style="margin-top: 20px; display: flex; justify-content: space-between; align-items: center;">
                <h2>회원 목록</h2>
                <a href="/member/add" class="btn btn-primary"><i class="fa-solid fa-plus"></i> 신규 아이디 등록</a>
            </div>
            <div class="content-container">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>아이디</th>
                            <th>소속부서</th>
                            <th>이름</th>
                            <th>공제회 담당팀</th>
                            <th>상태</th>
                            <th>비밀번호 초기화</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${userList}">
                            <tr data-href="/member/info?userId=${user.id}">
                                <td class="text-link">${user.id}</td>
                                <td>${user.dept}</td>
                                <td>${user.name}</td>
                                <td>${user.team}</td>
                                <td><span class="status-badge ${user.status == '정상' ? 'complete' : 'pending'}">${user.status}</span></td>
                                <td>
                                    <button type="button" class="btn btn-outline btn-sm reset-password-btn" data-userid="${user.id}">초기화</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>

        <div class="section-title" style="margin-top: 40px;">
            <h2>회원정보 상세</h2>
        </div>
        <form id="member-info-form">
            <table class="form-table">
                <tbody>
                    <tr>
                        <th>아이디/소속부서</th>
                        <td>
                            <div style="display: flex; align-items: center; gap: 5px;">
                                <input type="text" value="${userInfo.id}" class="short-input" readonly>
                                <input type="text" name="department" value="${userInfo.department}" class="short-input">
                            </div>
                        </td>
                        <th><span class="required">*</span> 이름</th>
                        <td><input type="text" name="name" value="${userInfo.name}" class="short-input"></td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td><button type="button" id="change-password-btn" class="btn btn-outline">비밀번호 변경</button></td>
                        <th><span class="required">*</span> 공제회 담당팀</th>
                        <td>
                            <select name="pmaaTeam" class="short-input">
                                <option>선택</option>
                                <option ${userInfo.pmaaTeam == '대체투자1팀' ? 'selected' : ''}>대체투자1팀</option>
                                <option ${userInfo.pmaaTeam == '기업금융1팀' ? 'selected' : ''}>기업금융1팀</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>회사번호</th>
                        <td><input type="text" name="tel" value="${userInfo.tel}" class="short-input"></td>
                        <th>팩스번호</th>
                        <td><input type="text" name="fax" value="${userInfo.fax}" class="short-input"></td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td colspan="3"><input type="text" name="email" value="${userInfo.email}"></td>
                    </tr>
                    <tr>
                        <th>소속기관</th>
                        <td colspan="3"><input type="text" value="${userInfo.orgName}" readonly></td>
                    </tr>
                    <c:if test="${isAdmin}">
                        <tr>
                            <th>상태</th>
                            <td colspan="3">
                                <select name="status" class="short-input">
                                    <option value="정상" ${userInfo.status == '정상' ? 'selected' : ''}>정상</option>
                                    <option value="승인대기" ${userInfo.status == '승인대기' ? 'selected' : ''}>승인대기</option>
                                    <option value="중지" ${userInfo.status == '중지' ? 'selected' : ''}>중지</option>
                                </select>
                            </td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
             <div class="button-container">
                <c:if test="${isAdmin}"><button type="button" class="btn btn-outline" id="delete-btn"><i class="fa-solid fa-trash"></i> 삭제</button></c:if>
                <button type="submit" class="btn btn-primary"><i class="fa-solid fa-save"></i> 수정</button>
            </div>
        </form>
    </main>
    <c:import url="/WEB-INF/jsp/common/footer.jsp" />
    <c:import url="/WEB-INF/jsp/member/password_popup.jsp" />
    <script src="/js/auth.js"></script>
    <script src="/js/member.js"></script>
</body>
</html>