<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>경찰공제회</title>
    <link rel="stylesheet" href="/static/css/style.css">
    </head>
<body>
    <%-- 헤더 영역 포함 --%>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <div class="container">
        <main class="main-content">
            <section class="hero">
                <p>신화-행복을 주는 경찰공제회</p>
                <h1>즐거운 여름</h1>
            </section>
            <section class="info-section">
                </section>
        </main>

        <aside class="right-sidebar">
            <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
        </aside>
    </div>

    <%-- 푸터 영역 포함 --%>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <script src="/static/js/script.js"></script>
</body>
</html>