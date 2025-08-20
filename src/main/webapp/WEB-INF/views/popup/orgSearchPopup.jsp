<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- 기관 검색 팝업 모달 --%>
<div id="org-search-modal" class="search-modal-overlay" style="display: none;">
    <div class="search-modal-content">
        <div class="search-modal-header">
            <h2>기관 검색</h2>
            <button type="button" class="modal-close-btn">&times;</button>
        </div>
        <div class="search-modal-body">
            <!-- <div class="search-bar">
                <select name="search-condition">
                    <option value="org-name">기관명</option>
                </select>
                <input type="text" placeholder="검색어를 입력하세요">
                <%-- 조회 버튼을 검색창 안으로 이동 --%>
                <button type="button" class="btn-search-action">조회</button>
            </div> -->
            <div class="search-bar">
                <select name="search-condition">
                    <option value="org-name">기관명</option>
                </select>
                <input type="text" placeholder="검색어를 입력하세요">
                <button type="button" class="btn btn-dark">조회</button>
            </div>
            <table class="results-table">
                <thead>
                    <tr>
                        <th>기관구분</th>
                        <th>기관명</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
            <%-- 하단 푸터 구조 수정 --%>
            <div class="search-modal-footer">
                <div class="pagination-wrapper">
                    <div class="pagination">
                    </div>
                </div>
                <div class="item-counter">
                </div>
            </div>
        </div>
    </div>
</div>