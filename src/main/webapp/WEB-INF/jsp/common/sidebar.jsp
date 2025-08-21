<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 공통 사이드바 (LNB) --%>
<aside class="left-sidebar">
    <h2>${sidebarTitle}</h2>
    <ul>
        <c:forEach var="item" items="${sideMenulist}">
            <li class="${item.menuNo == acticeMenu ? 'active' : ''}">
                <a href="/moveMenu.do?menuNo=${item.menuNo}">${item.menuNm}</a>
            </li>
        </c:forEach>
    </ul>
</aside>