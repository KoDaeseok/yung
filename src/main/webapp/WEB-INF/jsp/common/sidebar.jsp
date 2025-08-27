<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 공통 사이드바 (LNB) --%>
<aside class="left-sidebar">
    <%-- [추가] 메뉴 영역을 div로 감싸줍니다. --%>
    <div class="sidebar-top">
        <h2>${sidebarTitle}</h2>
        <ul>
            <c:forEach var="item" items="${sideMenulist}">
                <li class="${item.menuNo == activeMenu ? 'active' : ''}">
                    <a href="/moveMenu.do?menuNo=${item.menuNo}">${item.menuNm}</a>
                </li>
            </c:forEach>
        </ul>
    </div>

    <%-- 현황판 --%>
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