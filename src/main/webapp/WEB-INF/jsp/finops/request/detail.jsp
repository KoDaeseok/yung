<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <c:import url="/lnb.do" />
        <main class="page-content">
            <div class="breadcrumb">
                 <a href="/"><i class="fa-solid fa-house"></i> 홈</a>
                <span>></span><span>운용관리</span><span>></span><span>${menuDetail.menuNm}</span>
            </div>
            <h1><i class="fa-solid fa-circle-info"></i> ${menuDetail.menuNm}</h1>
            <table class="form-table">
                 <tbody>
                    <tr>
                        <th>펀드코드</th>
                        <td>${request.fundCode}</td>
                        <th>펀드명</th>
                        <td>${request.fundName}</td>
                    </tr>
                    <tr>
                        <th>보고구분</th>
                        <td>${request.reportType}</td>
                         <th>일자</th>
                        <td>${request.date}</td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td colspan="3">${request.title}</td>
                    </tr>
                     <tr>
                        <th>주요내용</th>
                        <td colspan="3"><pre>${request.content}</pre></td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
                        <td colspan="3"><a href="#" class="text-link">${request.fileName}</a></td>
                    </tr>
                </tbody>
            </table>
            <div class="button-container">
                <a href="/finops/request/form?id=${param.id}" class="btn btn-primary"><i class="fa-solid fa-edit"></i> 수정</a>
                <a href="/finops/request/list" class="btn btn-outline"><i class="fa-solid fa-list"></i> 목록</a>
            </div>
        </main>
    </div>
    <jsp:include page="/WEB-INF/jsp/common/footer.jsp" />
    <script src="/js/auth.js"></script>
</body>
</html>