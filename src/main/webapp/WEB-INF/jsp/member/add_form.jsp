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
        <h1><i class="fa-solid fa-user-plus"></i> ${pageTitle}</h1>
        <form id="member-add-form">
             <table class="form-table">
                <tbody>
                    <tr>
                        <th>소속기관</th>
                        <td colspan="3"><input type="text" value="KB자산운용" readonly></td>
                    </tr>
                    <tr>
                        <th><span class="required">*</span> 소속부서</th>
                        <td><input type="text" name="department" class="short-input"></td>
                        <th><span class="required">*</span> 담당업무</th>
                        <td><input type="text" name="duty" class="short-input"></td>
                    </tr>
                     <tr>
                        <th><span class="required">*</span> 아이디</th>
                        <td colspan="3"><input type="text" name="userId" class="short-input"></td>
                    </tr>
                    <tr>
                        <th><span class="required">*</span> 비밀번호</th>
                        <td><input type="password" name="password" class="short-input"></td>
                        <th><span class="required">*</span> 비밀번호 확인</th>
                        <td><input type="password" name="passwordConfirm" class="short-input"></td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td><input type="text" name="tel" class="short-input"></td>
                        <th>팩스번호</th>
                        <td><input type="text" name="fax" class="short-input"></td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td colspan="3"><input type="text" name="email"></td>
                    </tr>
                </tbody>
            </table>
            <div class="form-buttons">
                <button type="submit" class="btn btn-primary"><i class="fa-solid fa-check"></i> 등록</button>
                <button type="button" class="btn btn-secondary" onclick="location.href='/member/info'"><i class="fa-solid fa-times"></i> 취소</button>
            </div>
        </form>
    </main>
    <c:import url="/WEB-INF/jsp/common/footer.jsp" />
    <script src="/js/auth.js"></script>
    <script src="/js/member.js"></script>
</body>
</html>