<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>경찰공제회 - ${pageTitle}</title>
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
</head>
<body>
    <c:import url="/header.do" />
    <div class="page-container">
        <c:import url="/lnb.do" />
        <main class="page-content">
            <div class="breadcrumb">
                <a href="/index.do"><i class="fa-solid fa-house"></i> 홈</a>
                <span>></span><span>요청/리서치자료</span><span>></span><a href="/dms/request/list">자료요청 목록</a><span>></span><span>${pageTitle}</span>
            </div>
            <h1><i class="fa-solid fa-circle-info"></i> ${pageTitle}</h1>

            <table class="detail-table" style="margin-top: 20px;">
                <colgroup>
                    <col style="width: 150px;">
                    <col style="width: auto;">
                    <col style="width: 150px;">
                    <col style="width: auto;">
                </colgroup>
                <tbody>
                    <tr>
                        <th>요청명</th>
                        <td colspan="3">${request.title}</td>
                    </tr>
                    <tr>
                        <th>요청부서</th>
                        <td>${request.requestDept}</td>
                        <th>등록번호</th>
                        <td>${request.regNum}</td>
                    </tr>
                    <tr>
                        <th>담당팀</th>
                        <td>${request.requestTeam}</td>
                        <th>담당자</th>
                        <td>${request.manager}</td>
                    </tr>
                    <tr>
                        <th>등록마감일시</th>
                        <td colspan="3">${request.deadline}</td>
                    </tr>
                    <tr>
                        <th>세부내용</th>
                        <td colspan="3">
                            <div class="content-body">${request.content}</div>
                        </td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td colspan="3">
                            <c:forEach var="file" items="${request.files}">
                                <div class="file-item" style="padding: 5px 0;">
                                    <a href="#" class="file-link"><i class="fa-solid fa-download"></i> ${file}</a>
                                </div>
                            </c:forEach>
                        </td>
                    </tr>
                </tbody>
            </table>

            <div class="button-container">
                <a href="/dms/request/form?id=${request.id}" class="btn btn-primary"><i class="fa-solid fa-pen"></i> 요청자료 등록</a>
                <a href="/dms/request/list" class="btn btn-outline"><i class="fa-solid fa-list"></i> 목록</a>
            </div>
        </main>
    </div>
    <c:import url="/WEB-INF/jsp/common/footer.jsp" />
    <script src="/js/auth.js"></script>
</body>
</html>