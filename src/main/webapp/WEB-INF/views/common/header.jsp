<!-- views/common/header.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header class="krds-style-header">
    <div class="header-top">
        <div class="header-top-inner">
            <%-- 로그인 상태에 따라 분기 처리 --%>
            <c:choose>
                <%-- 1. 로그인된 경우 --%>
                <c:when test="${not empty sessionScope.userName}">
                    <div class="login-buttons">
                        <span class="user-name">${sessionScope.userName}님</span>
                        <button type="button" class="btn-logout">로그아웃</button>
                    </div>
                </c:when>
                <%-- 2. 로그아웃된 경우 & 회원가입 페이지가 아닌 경우 --%>
                <c:otherwise>
                    <c:if test="${!isSignupPage}">
                        <div class="login-buttons">
                            <a href="#" class="top-btn-login" id="login-popup-btn">로그인</a>
                            <span>|</span>
                            <a href="/signup" class="top-btn-signup">회원가입</a>
                        </div>
                    </c:if>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <div class="header-main">
        <div class="header-main-inner">
            <div class="logo">
                <a href="/"><img src="/images/bg_infoex_logo.png" alt="경찰공제회 로고"></a>
            </div>
            <div class="main-menu">
                <nav>
                    <ul>
                        <li><a href="/organization" class="${activeMenu == 'organization' ? 'active' : ''}">자산운용조직소개</a></li>
                        <li><a href="#" class="${activeMenu == 'notice' ? 'active' : ''}">공지/건의</a></li>
                        <li><a href="#" class="${activeMenu == 'proposal' ? 'active' : ''}">투자제안</a></li>
                        <li><a href="#" class="${activeMenu == 'interest' ? 'active' : ''}">금리제안</a></li>
                        <li><a href="#" class="${activeMenu == 'management' ? 'active' : ''}">운용관리</a></li>
                        <li><a href="#" class="${activeMenu == 'seminar' ? 'active' : ''}">세미나/미팅제안</a></li>
                        <li><a href="#" class="${activeMenu == 'research' ? 'active' : ''}">요청/리서치자료</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</header>

<%-- 로그인 팝업 모달 포함 --%>
<jsp:include page="/WEB-INF/views/popup/loginPopup.jsp" />