<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 공통 사이드바 (LNB) --%>
<aside class="left-sidebar">
    <h2>${sidebarTitle}</h2>
    <ul>
        <c:forEach var="item" items="${sideMenulist}">
            <li class="${item.menuNo == activeMenu ? 'active' : ''}">
                <a href="/moveMenu.do?menuNo=${item.menuNo}">${item.menuNm}</a>
            </li>
        </c:forEach>
    </ul>

    <%-- [추가] 로그인 상태일 때만 현황판 표시 --%>
    <c:if test="${not empty sessionScope.userName}">
        <div class="status-box">
            <div class="status-header">현황 및 상태</div>
            <div class="status-item">
                <span>자료요청</span>
                <span id="reqCnt" class="status-count">0</span>
            </div>
            <div class="status-item">
                <span>세미나 요청</span>
                <span id="smnCnt" class="status-count">0</span>
            </div>
        </div>
    </c:if>
</aside>