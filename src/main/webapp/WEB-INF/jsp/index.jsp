<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <title>[test]경찰공제회 정보교류시스템</title>
    <link rel="stylesheet" href="/css/main.css">
    <%-- [추가] Font Awesome 아이콘 라이브러리 --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>
<body>

    <%-- 헤더 영역 포함 --%>
    <c:import url="/header.do" />

    <%-- 메인 콘텐츠 --%>
    <main class="main-container">
        <div class="card-section-container">
            <h2 class="card-section-title">더 큰 행복을 위해<br>경찰공제회가 함께합니다.</h2>
            <p class="card-section-subtitle">새로운 가치 창출의 시작, 정보교류시스템에서 미래를 향한 기회를 만나보세요.</p>
            
            <div class="card-container">
                <%-- 투자제안 카드 --%>
                <a href="#" class="service-card">
                    <div class="card-icon">
                        <i class="fa-solid fa-hand-holding-dollar"></i>
                    </div>
                    <h3>투자제안</h3>
                    <p>새로운 투자 기회와<br>다양한 제안을 기다립니다.</p>
                    <span class="card-link">바로가기 <i class="fa-solid fa-arrow-right"></i></span>
                </a>
                
                <%-- 금리제안 카드 --%>
                <a href="#" class="service-card">
                    <div class="card-icon">
                        <i class="fa-solid fa-chart-line"></i>
                    </div>
                    <h3>금리제안</h3>
                    <p>경쟁력 있는 금리 상품을<br>제안받고 있습니다.</p>
                    <span class="card-link">바로가기 <i class="fa-solid fa-arrow-right"></i></span>
                </a>
                
                <%-- 세미나/미팅제안 카드 --%>
                <a href="#" class="service-card">
                    <div class="card-icon">
                        <i class="fa-solid fa-users"></i>
                    </div>
                    <h3>세미나/미팅제안</h3>
                    <p>유익한 정보 교류를 위한<br>세미나와 미팅을 제안해 주세요.</p>
                    <span class="card-link">바로가기 <i class="fa-solid fa-arrow-right"></i></span>
                </a>
            </div>
        </div>
    </main>

    <%-- 푸터 영역 포함 --%>
    <jsp:include page="/WEB-INF/jsp/common/footer.jsp" />
    
    <%-- 로그인/인증 스크립트만 로드 --%>
    <script src="/js/auth.js"></script>
</body>
</html>