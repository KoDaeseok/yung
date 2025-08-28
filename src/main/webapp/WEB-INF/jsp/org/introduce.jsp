<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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

        <%-- 사이드바 --%>
        <c:import url="/lnb.do" />

        <main class="page-content">
        	<div class="breadcrumb">
				<a href="/index.do">
					<i class="fa-solid fa-house"></i> 
					홈 
				</a>
				<span>></span> 
				<span>자산운용조직</span>
				<span>></span> 
				<span>${menuDetail.menuNm}</span>
			</div>

            <section id="section-intro">
                <h1>${menuDetail.menuNm}</h1>

                <div class="intro-header">
                    <div class="intro-header-text">
                        <p class="introduce-title">안녕하십니까.<br>
                            <span style="color:var(--primary-color)">경찰공제회입니다.</span>
                        </p>
                        <p class="introduce-desc">경찰공제회 정보교류시스템 홈페이지를 찾아주셔서<br>대단히 감사합니다.</p>
                    </div>
                    <div class="intro-image">
                        <img src="/images/bg_info.jpg" alt="자산 운용 소개 이미지">
                    </div>
                </div>

                <div class="contents">
                    경찰공제회는 전국 경찰공무원의 생활안정과 복지증진을 도모하기 위한 목적으로 설립하였고 지속적인 발전을 거듭하며<br>
                    자산 3조원 시대를 넘어 새로운 도약을 준비하고 있습니다.<br><br>
                    이를 달성하기 위해 공제회는 투자제안의 문턱을 낮추고 투자 지역 및 대상 다변화를 적극 추진하며, 공제회 투자자산에<br>
                    대해 기관 간 정보공유 협업을 이루고자 정보교류시스템 홈페이지를 개설하였습니다.<br><br>
                    많은 관심과 참여를 부탁드리며, 우리 공제회와 자본시장 참여자의 성공을 위해 함께 노력해 나가겠습니다.<br><br>
                    감사합니다.
                </div>
            </section>

        </main>
    </div>

    <c:import url="/WEB-INF/jsp/common/footer.jsp" />
    
    <script src="/js/auth.js"></script>
    <script src="/js/organization.js"></script>
</body>
</html>