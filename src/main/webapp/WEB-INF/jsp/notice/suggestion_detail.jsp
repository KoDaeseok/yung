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
                <span>공지/건의</span>
				<span>></span>
				<span>${menuDetail.menuNm}</span>
			</div>
            
            <h1>${menuDetail.menuNm}</h1>
            
            <div class="content-container">
                <table class="detail-table">
                    <tbody>
                        <tr>
                            <th>제목</th>
                            <td colspan="3">${suggestion.title}</td>
                        </tr>
                        <tr>
                            <th>담당부서</th>
                            <td>${suggestion.department}</td>
                            <th>공개여부</th>
                            <td>${suggestion.isPublic}</td>
                        </tr>
                        <tr>
                            <th>공제회 담당팀</th>
                            <td colspan="3">${suggestion.pmaaTeam}</td>
                        </tr>
                    </tbody>
                </table>

                <div class="content-body">
                    ${suggestion.content}
                </div>
                
                <div class="button-container">
                    <button type="button" class="btn btn-outline" onclick="location.href='/suggestion'">
                        <i class="fa-solid fa-list"></i> 목록
                    </button>
                </div>
            </div>
        </main>
    </div>

    <c:import url="/WEB-INF/jsp/common/footer.jsp" />

    <script src="/js/auth.js"></script>
</body>
</html>