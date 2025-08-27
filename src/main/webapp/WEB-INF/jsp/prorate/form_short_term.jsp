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
                <span>></span><span>금리제안</span><span>></span><span>${pageTitle}</span>
            </div>
            <h1><i class="fa-solid fa-pen-to-square"></i> ${pageTitle}</h1>

            <%-- 요청 정보 표시 (상단) --%>
            <div class="section-title" style="margin-top:20px;">
                <h2>단기상품 금리비딩</h2>
            </div>
            <table class="form-table">
                <tbody>
                    <tr>
                        <th>요청일자</th>
                        <td><input type="text" value="2025-09-03" readonly></td>
                        <th>담당부서</th>
                        <td><input type="text" value="경찰공제회" readonly></td>
                    </tr>
                    <tr>
                        <th>담당팀</th>
                        <td><input type="text" value="채권투자팀" readonly></td>
                        <th>담당자</th>
                        <td><input type="text" value="김채권" readonly></td>
                    </tr>
                    <tr>
                        <th>요청내용</th>
                        <td colspan="3"><input type="text" value="단기자금 금리요청" readonly></td>
                    </tr>
                </tbody>
            </table>
            
            <div class="section-title" style="margin-top:20px;">
                <h2>요청내용</h2>
            </div>
            <table class="form-table">
                <tbody>
                    <tr>
                        <th>상품유형</th>
                        <td><input type="text" class="short-input" value="MMT" readonly></td>
                        <th>금리</th>
                        <td><input type="text" class="short-input" value="1.1%" readonly></td>
                    </tr>
                    <tr>
                        <th>기간</th>
                        <td><input type="text" class="short-input" value="수시" readonly></td>
                        <th>금액</th>
                        <td><input type="text" class="short-input" value="1,560,000" readonly></td>
                    </tr>
                    <tr>
                        <th>자산</th>
                        <td colspan="3"><input type="text" value="자산입력" readonly></td>
                    </tr>
                </tbody>
            </table>

            <form>
                <%-- 제안 내용 입력 폼 (하단) --%>
                <div class="section-title" style="margin-top:20px;">
                    <h2>제안내용</h2>
                </div>
                <table class="form-table">
                    <tbody>
                        <tr>
                            <th><span class="required">*</span> 상품유형</th>
                            <td><input type="text" name="productType" class="short-input" value="MMT"></td>
                            <th><span class="required">*</span> 금리</th>
                            <td><input type="text" name="interestRate" class="short-input" placeholder="0.00"></td>
                        </tr>
                        <tr>
                            <th><span class="required">*</span> 기간</th>
                            <td colspan="3"><input type="text" name="period" class="wide-input" value="기간후수시"></td>
                        </tr>
                         <tr>
                            <th>금액</th>
                            <td colspan="3"><input type="text" name="amount" class="short-input" value="400,000,000"></td>
                        </tr>
                        <tr>
                            <th>자산</th>
                            <td colspan="3"><input type="text" name="asset" class="wide-input" value="자산 입력"></td>
                        </tr>
                        <tr>
                            <th>신탁약관 편입자산<br>최저신용등급</th>
                            <td colspan="3"><input type="text" name="minCreditRating" class="wide-input" value="3"></td>
                        </tr>
                        <tr>
                            <th>담당자 부서</th>
                            <td><input type="text" name="managerDept" class="short-input"></td>
                            <th>담당자명</th>
                            <td><input type="text" name="managerName" class="short-input"></td>
                        </tr>
                         <tr>
                            <th><span class="required">*</span> 직위명</th>
                            <td><input type="text" name="managerPosition" class="short-input" value="대리"></td>
                             <th>담당자 전화번호</th>
                            <td><input type="text" name="managerPhone" class="short-input"></td>
                         </tr>
                         <tr>
                            <th>담당자 HP</th>
                            <td colspan="3"><input type="text" name="managerMobile" class="short-input"></td>
                        </tr>
                    </tbody>
                </table>
                <div class="button-container">
                    <button type="submit" class="btn btn-primary"><i class="fa-solid fa-check"></i> 등록</button>
                    <button type="button" class="btn btn-secondary" onclick="history.back()"><i class="fa-solid fa-times"></i> 취소</button>
                    <button type="button" class="btn btn-outline" onclick="location.href='/prorate/short_term/list'"><i class="fa-solid fa-list"></i> 목록</button>
                </div>
            </form>
        </main>
    </div>
    <jsp:include page="/WEB-INF/jsp/common/footer.jsp" />
    <script src="/js/auth.js"></script>
</body>
</html>