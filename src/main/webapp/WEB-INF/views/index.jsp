<!-- views/index.jsp -->
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

    <%-- 메인 콘텐츠 --%>
    <main class="main-bg-container">
        <!-- <div class="main-bg-container-inner">
            <h1>더 큰 행복을 위해<br>
                경찰공제회가 함께합니다.</h1>
            <p>경찰공제회 정보교류시스템에 오신 것을 환영합니다.</p>
        </div> -->
    </main>

    <%-- 푸터 영역 포함 --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
    <%-- 로그인/인증 스크립트만 로드 --%>
    <script src="/static/js/auth.js"></script>
</body>
</html>