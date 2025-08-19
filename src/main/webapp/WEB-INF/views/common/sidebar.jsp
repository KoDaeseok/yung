<!-- views/common/sidebar.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 공통 사이드바 (LNB) --%>
<aside class="left-sidebar">
    <h2>${sidebarTitle}</h2>
    <ul>
        <c:forEach var="item" items="${lnbItems}">
            <li class="${item.isActive ? 'active' : ''}">
                <a href="${item.url}">${item.label}</a>
            </li>
        </c:forEach>
    </ul>
</aside>