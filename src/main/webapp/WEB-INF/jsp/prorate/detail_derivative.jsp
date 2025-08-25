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
                <a href="/"><i class="fa-solid fa-house"></i> 홈</a>
                <span>></span><span>금리제안</span><span>></span><span>${pageTitle}</span>
            </div>
            <h1><i class="fa-solid fa-circle-info"></i> ${pageTitle}</h1>
            <form id="prorate-form">
                <div class="section-title" style="margin-top:20px;">
                    <h2>제안금리</h2>
                </div>
                <table class="form-table">
                     <tbody>
                        <tr>
                            <th><span class="required">*</span> 자산규모</th>
                            <td><input type="text" value="1,000,000,000 KRW" readonly></td>
                            <th><span class="required">*</span> 자기자본</th>
                            <td><input type="text" value="500,000,000 KRW" readonly></td>
                        </tr>
                        <tr>
                            <th>신용등급</th>
                            <td colspan="3"><input type="text" value="AA+" readonly></td>
                        </tr>
                    </tbody>
                </table>
                <div class="content-container" style="margin-top:20px;">
                    <table class="data-table">
                       <thead>
                            <tr>
                                <th style="width:10%">유형</th>
                                <th style="width:auto">조건</th>
                                <th style="width:20%">투자기간</th>
                                <th style="width:20%">금리</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach begin="1" end="15" var="i">
                                <tr>
                                    <td>유형${i}</td>
                                    <td style="text-align: left;">조건 예시 텍스트 ${i}</td>
                                    <td>투자기간 예시 ${i}</td>
                                    <td style="text-align: right;">3.${i}0 %</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="section-title" style="margin-top:20px;">
                    <h2>제안내용</h2>
                </div>
                 <table class="form-table">
                    <tbody>
                         <tr>
                            <th>기타</th>
                            <td><textarea style="width:100%; height: 80px; resize: vertical;" readonly>기타 참고사항입니다.</textarea></td>
                        </tr>
                        <tr>
                            <th>제안내용</th>
                            <td><textarea style="width:100%; height: 80px; resize: vertical;" readonly>상세 제안 내용입니다.</textarea></td>
                        </tr>
                    </tbody>
                </table>
                <div class="button-container">
                    <button type="button" class="btn btn-primary" onclick="location.href='/prorate/form?type=deriv&id=${detail.id}'"><i class="fa-solid fa-edit"></i> 수정</button>
                    <button type="button" class="btn btn-outline" id="delete-btn"><i class="fa-solid fa-trash"></i> 삭제</button>
                    <button type="button" class="btn btn-outline" onclick="location.href='/prorate/derivative/list'"><i class="fa-solid fa-list"></i> 목록</button>
                </div>
            </form>
        </main>
    </div>
    <jsp:include page="/WEB-INF/jsp/common/footer.jsp" />
    <script src="/js/auth.js"></script>
</body>
</html>