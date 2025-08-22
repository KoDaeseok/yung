<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 펀드 검색 팝업 모달 --%>
<div id="fund-search-modal" class="search-modal-overlay" style="display: none;">
    <div class="search-modal-content">
        <div class="search-modal-header">
            <h2>펀드 검색</h2>
            <button type="button" class="modal-close-btn">&times;</button>
        </div>
        <div class="search-modal-body">
            <%-- 검색 바 UI 수정 --%>
            <div class="search-bar">
                <select name="search-condition" style="width: 100px;">
                    <option value="fundName">펀드명</option>
                    <option value="fundCode">펀드코드</option>
                </select>
                <input type="text" placeholder="검색어를 입력하세요">
                <button type="button" class="btn btn-dark">조회</button>
            </div>
            
            <%-- 검색 결과 표시 테이블 --%>
            <table class="results-table">
                <thead>
                    <tr>
                        <th style="width: 30%;">펀드코드</th>
                        <th style="width: 70%;">펀드명</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- JS를 통해 동적으로 채워집니다 --%>
                </tbody>
            </table>

            <%-- 페이지네이션 및 결과 카운트 --%>
            <div class="search-modal-footer">
                <div class="pagination-wrapper">
                    <div class="pagination">
                         <%-- JS를 통해 동적으로 채워집니다 --%>
                    </div>
                </div>
                <div class="item-counter">
                    <%-- JS를 통해 동적으로 채워집니다 --%>
                </div>
            </div>
        </div>
    </div>
</div>