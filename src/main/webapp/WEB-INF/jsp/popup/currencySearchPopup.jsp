<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 통화 검색 팝업 모달 --%>
<div id="currency-search-modal" class="search-modal-overlay" style="display: none;">
    <div class="search-modal-content">
        <div class="search-modal-header">
            <h2>통화 검색</h2>
            <button type="button" class="modal-close-btn">&times;</button>
        </div>
        <div class="search-modal-body">
            <div class="search-bar">
                <select name="search-condition" style="width: 100px;">
                    <option value="curNm">통화명</option>
                    <option value="curC">통화코드</option>
                </select>
                <input type="text" placeholder="검색어를 입력하세요">
                <button type="button" class="btn btn-dark">조회</button>
            </div>
            
            <table class="results-table">
                <thead>
                    <tr>
                        <th style="width: 25%;">통화코드</th>
                        <th style="width: 45%;">통화명</th>
                        <th style="width: 30%;">국가명</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- JS를 통해 동적으로 채워집니다 --%>
                </tbody>
            </table>

            <div class="search-modal-footer">
                 <div class="pagination-wrapper">
                    <div class="pagination"></div>
                </div>
                 <div class="item-counter"></div>
            </div>
        </div>
    </div>
</div>