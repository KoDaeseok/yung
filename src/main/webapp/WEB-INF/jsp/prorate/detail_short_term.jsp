<%-- /kodaeseok/yung/yung-d14fd9bdba91706cbfda4bbeb23305736ac65e6d/src/main/webapp/WEB-INF/jsp/prorate/detail_short_term.jsp --%>
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
                    <h2>제안내용</h2>
                </div>
                <table class="form-table">
                     <tbody>
                        <tr>
                            <th><span class="required">*</span> 상품유형</th>
                            <td><input type="text" value="단기자금" readonly class="short-input"></td>
                            <th><span class="required">*</span> 금리</th>
                            <td><input type="text" value="3.50 %" readonly class="short-input"></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 기간</th>
                            <td colspan="3"><input type="text" value="2025-09-01 ~ 2025-12-31" readonly class="wide-input"></td>
                        </tr>
                         <tr>
                            <th>금액</th>
                            <td colspan="3"><input type="text" value="10,000,000,000" readonly class="short-input"></td>
                        </tr>
                        <tr>
                            <th>자산</th>
                            <td colspan="3"><input type="text" value="국고채" readonly class="wide-input"></td>
                        </tr>
                        <tr>
                            <th>신탁약관 편입자산<br>최저신용등급</th>
                            <td colspan="3"><input type="text" value="AAA" readonly class="wide-input"></td>
                        </tr>
                    </tbody>
                </table>
                
                <div class="section-title" style="margin-top:20px;">
                    <h2>담당자 정보</h2>
                </div>
                 <table class="form-table">
                    <tbody>
                        <tr>
                            <th>담당자 부서</th>
                            <td><input type="text" value="채권운용팀" readonly class="short-input"></td>
                            <th>담당자명</th>
                            <td><input type="text" value="김채권" readonly class="short-input"></td>
                        </tr>
                         <tr>
                            <th><span class="required">*</span> 직위명</th>
                            <td><input type="text" value="과장" readonly class="short-input"></td>
                             <th>담당자 전화번호</th>
                            <td><input type="text" value="02-123-4567" readonly class="short-input"></td>
                        </tr>
                         <tr>
                            <th>담당자 HP</th>
                            <td colspan="3"><input type="text" value="010-1234-5678" readonly class="short-input"></td>
                        </tr>
                    </tbody>
                </table>

                <div class="button-container" id="view-mode-buttons">
                    <button type="button" class="btn btn-primary" onclick="location.href='/prorate/form?type=short&id=${detail.id}'"><i class="fa-solid fa-edit"></i> 수정</button>
                    <button type="button" class="btn btn-outline" id="delete-btn"><i class="fa-solid fa-trash"></i> 삭제</button>
                    <button type="button" class="btn btn-outline" onclick="location.href='/prorate/list'"><i class="fa-solid fa-list"></i> 목록</button>
                </div>
            </form>
        </main>
    </div>
    <jsp:include page="/WEB-INF/jsp/common/footer.jsp" />
    <script src="/js/auth.js"></script>
</body>
</html>