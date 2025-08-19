<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 기관 검색 팝업 모달 --%>
<div id="org-search-modal" class="search-modal-overlay" style="display: none;">
    <div class="search-modal-content">
        <div class="search-modal-header">
            <h2>기관 검색</h2>
            <button type="button" class="modal-close-btn">&times;</button>
        </div>
        <div class="search-modal-body">
            <div class="search-bar">
                <select name="search-condition">
                    <option value="org-name">기관명</option>
                </select>
                <input type="text" placeholder="검색어를 입력하세요">
                <button type="button" class="btn-search-action">조회</button>
            </div>
            <table class="results-table">
                <thead>
                    <tr>
                        <th>기관구분</th>
                        <th>기관명</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- 검색 결과 예시 데이터 --%>
                    <tr data-code="2282871" data-name="(주)KH투자증권">
                        <td>국내증권사</td>
                        <td>(주)KH투자증권</td>
                    </tr>
                    <tr data-code="1112222" data-name="경찰공제회위탁보관미래에셋투자회사">
                        <td>금융기타(증권금융)</td>
                        <td>경찰공제회위탁보관미래에셋투자회사</td>
                    </tr>
                    <%-- ... (추가적인 예시 데이터) ... --%>
                </tbody>
            </table>
            <div class="pagination">
                <a href="#" class="arrow disabled">&laquo;</a>
                <a href="#" class="arrow disabled">&lsaquo;</a>
                <a href="#" class="active">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
                <a href="#" class="arrow">&rsaquo;</a>
                <a href="#" class="arrow">&raquo;</a>
            </div>
        </div>
    </div>
</div>