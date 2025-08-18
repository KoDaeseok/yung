<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>[test]경찰공제회 정보교류시스템</title>
    <link rel="stylesheet" href="/static/css/main.css">
</head>
<body>

    <%-- 헤더 영역 포함 --%>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <%-- 메인 로그인 콘텐츠 --%>
    <main class="login-container">
        <div class="login-card">
            <div class="login-header">
                <h1>로그인</h1>
                <p>처음 방문하신 분은 아이디 요청 후<br>로그인하시기 바랍니다.</p>
            </div>

            <form class="login-form">
                <div class="form-group">
                    <label for="username">아이디</label>
                    <input type="text" id="username" name="username">
                </div>
                <div class="form-group">
                    <label for="password">비밀번호</label>
                    <input type="password" id="password" name="password">
                </div>
                <button type="submit" class="btn-login">로그인</button>
            </form>

            <div class="login-options">
                <div class="checkbox-group">
                    <input type="checkbox" id="remember-id">
                    <label for="remember-id">아이디저장</label>
                </div>
                <a href="#">아이디요청</a>
            </div>
        </div>
    </main>

    <%-- 푸터 영역 포함 --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>