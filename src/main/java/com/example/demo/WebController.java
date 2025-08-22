package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
public class WebController {

    private List<Map<String, Object>> menuData = new ArrayList<>();

    public WebController() {
        // --- 상위 메뉴 ---
        menuData.add(Map.of("menuNo", "1", "menuNm", "자산운용조직소개", "upperMenuNo", "0", "url", "/organization/introduce"));
        menuData.add(Map.of("menuNo", "2", "menuNm", "공지/건의", "upperMenuNo", "0", "url", "/notice"));
        menuData.add(Map.of("menuNo", "3", "menuNm", "투자제안", "upperMenuNo", "0", "url", "/propvest/list"));
        menuData.add(Map.of("menuNo", "4", "menuNm", "금리제안", "upperMenuNo", "0", "url", "/prorate"));
        menuData.add(Map.of("menuNo", "5", "menuNm", "운용관리", "upperMenuNo", "0", "url", "/finops/balance_cert/list"));
        menuData.add(Map.of("menuNo", "6", "menuNm", "세미나/미팅제안", "upperMenuNo", "0", "url", "/investtalk"));
        menuData.add(Map.of("menuNo", "7", "menuNm", "요청/리서치자료", "upperMenuNo", "0", "url", "/dms"));

        // --- 하위 메뉴 ---
        // 1. 자산운용조직
        menuData.add(
                Map.of("menuNo", "101", "menuNm", "자산운용조직 소개", "upperMenuNo", "1", "url", "/organization/introduce"));
        menuData.add(Map.of("menuNo", "102", "menuNm", "조직도", "upperMenuNo", "1", "url", "/organization/chart"));
        menuData.add(Map.of("menuNo", "103", "menuNm", "찾아오시는 길", "upperMenuNo", "1", "url", "/organization/location"));

        // 2. 공지/건의
        menuData.add(Map.of("menuNo", "201", "menuNm", "공지사항", "upperMenuNo", "2", "url", "/notice"));
        menuData.add(Map.of("menuNo", "202", "menuNm", "건의사항", "upperMenuNo", "2", "url", "/suggestion"));

        // 3. 투자제안
        menuData.add(Map.of("menuNo", "301", "menuNm", "제안요청목록", "upperMenuNo", "3", "url", "/propvest/list"));

        // 5. 운용관리
        menuData.add(Map.of("menuNo", "501", "menuNm", "잔고증명", "upperMenuNo", "5", "url", "/finops/balance_cert/list"));
        menuData.add(Map.of("menuNo", "502", "menuNm", "운용실적보고", "upperMenuNo", "5", "url", "/finops/report/list"));
        menuData.add(
                Map.of("menuNo", "503", "menuNm", "운용관련 요청 및 보고", "upperMenuNo", "5", "url", "/finops/request/list"));
        menuData.add(Map.of("menuNo", "504", "menuNm", "편입자산 세부내역", "upperMenuNo", "5", "url", "/finops/asset/list"));
        menuData.add(Map.of("menuNo", "505", "menuNm", "연간 자금계획", "upperMenuNo", "5", "url", "/finops/plan/list"));
        menuData.add(Map.of("menuNo", "506", "menuNm", "업무담당자", "upperMenuNo", "5", "url", "/finops/manager/list"));
    }
    // (참고) 다른 상위 메뉴들도 필요하다면 여기에 하위 메뉴를 추가할 수 있습니다.

    // --- 공통 컴포넌트 컨트롤러 ---

    @GetMapping("/header.do")
    public String getHeader(Model model) {
        List<Map<String, Object>> topMenuList = menuData.stream()
                .filter(m -> "0".equals(m.get("upperMenuNo")))
                .collect(Collectors.toList());
        model.addAttribute("menuList", topMenuList);
        return "common/header";
    }

    @GetMapping("/lnb.do")
    public String getLnb(HttpSession session, Model model) {
        String activeMenuNo = (String) session.getAttribute("activeMenuNo");
        String rootMenuNo = (String) session.getAttribute("rootMenuNo");

        if (rootMenuNo != null) {
            Map<String, Object> rootMenu = menuData.stream()
                    .filter(m -> rootMenuNo.equals(m.get("menuNo")))
                    .findFirst().orElse(null);

            if (rootMenu != null) {
                model.addAttribute("sidebarTitle", rootMenu.get("menuNm"));
            }

            List<Map<String, Object>> sideMenuList = menuData.stream()
                    .filter(m -> rootMenuNo.equals(m.get("upperMenuNo")))
                    .collect(Collectors.toList());
            model.addAttribute("sideMenulist", sideMenuList);
            model.addAttribute("activeMenu", activeMenuNo);
        }
        return "common/sidebar";
    }

    // --- 페이지 이동 공통 컨트롤러 ---
    @GetMapping("/moveMenu.do")
    public String moveMenu(@RequestParam("menuNo") String menuNo, HttpSession session) {
        Map<String, Object> targetMenu = menuData.stream()
                .filter(m -> menuNo.equals(m.get("menuNo")))
                .findFirst().orElse(null);

        if (targetMenu != null) {
            session.setAttribute("activeMenuNo", menuNo);
            String upperMenuNo = (String) targetMenu.get("upperMenuNo");
            session.setAttribute("rootMenuNo", "0".equals(upperMenuNo) ? menuNo : upperMenuNo);

            return "redirect:" + targetMenu.get("url");
        }
        return "redirect:/";
    }

    // --- 페이지 컨트롤러 ---
    private void addCommonAttributes(String menuNo, Model model, HttpSession session) {
        Map<String, Object> menuDetail = menuData.stream()
                .filter(m -> menuNo.equals(m.get("menuNo")))
                .findFirst().orElse(new HashMap<>());
        model.addAttribute("menuDetail", menuDetail);

        session.setAttribute("activeMenuNo", menuNo);
        String upperMenuNo = (String) menuDetail.getOrDefault("upperMenuNo", "0");
        session.setAttribute("rootMenuNo", "0".equals(upperMenuNo) ? menuNo : upperMenuNo);
    }

    @GetMapping("/")
    public String home(Model model, HttpSession session) {
        session.removeAttribute("rootMenuNo");
        session.removeAttribute("activeMenuNo");
        return "index";
    }

    // 1. 자산운용조직
    @GetMapping("/organization/introduce")
    public String organizationIntro(Model model, HttpSession session) {
        addCommonAttributes("101", model, session);
        return "org/introduce";
    }

    @GetMapping("/organization/chart")
    public String organizationChart(Model model, HttpSession session) {
        addCommonAttributes("102", model, session);
        return "org/chart";
    }

    @GetMapping("/organization/location")
    public String organizationLocation(Model model, HttpSession session) {
        addCommonAttributes("103", model, session);
        return "org/location";
    }

    // 2. 공지/건의
    @GetMapping("/notice")
    public String notice(Model model, HttpSession session, @RequestParam(value = "page", defaultValue = "1") int page) {
        addCommonAttributes("201", model, session);

        // --- 페이지네이션 데이터 생성 ---
        List<Map<String, String>> noticeList = new ArrayList<>();
        noticeList.add(Map.of("id", "1", "type", "일반", "title", "정보교류시스템 오픈 안내", "date", "2025-08-20"));
        noticeList.add(Map.of("id", "2", "type", "중요", "title", "개인정보처리방침 개정 안내", "date", "2025-08-15"));
        // 추가 데이터 예시 (총 12개)
        for (int i = 3; i <= 12; i++) {
            noticeList
                    .add(Map.of("id", String.valueOf(i), "type", "일반", "title", "일반 공지사항 " + i, "date", "2025-08-10"));
        }

        int currentPage = page;
        int pageSize = 10; // 한 페이지에 보여줄 게시글 수
        int totalItems = noticeList.size();
        int totalPages = (int) Math.ceil((double) totalItems / pageSize);
        int startPage = ((currentPage - 1) / 5) * 5 + 1;
        int endPage = Math.min(startPage + 4, totalPages);

        model.addAttribute("noticeList",
                noticeList.subList((currentPage - 1) * pageSize, Math.min(currentPage * pageSize, totalItems)));
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("totalItems", totalItems);
        model.addAttribute("pageSize", pageSize);

        return "notice/notice";
    }

    @GetMapping("/notice/detail")
    public String noticeDetail(Model model, HttpSession session,
            @RequestParam(value = "id", required = false) String id) {
        addCommonAttributes("201", model, session);
        Map<String, Object> noticeDetail = new HashMap<>();
        noticeDetail.put("title", "정보교류시스템 오픈 안내");
        noticeDetail.put("period", "2025-08-20 ~ 2025-12-31");
        noticeDetail.put("manager", "황희정");
        noticeDetail.put("files", List.of("시스템 매뉴얼.xlsx", "이용 가이드.doc"));
        noticeDetail.put("content", "경찰공제회 정보교류시스템이 새롭게 오픈했습니다.<br>회원 여러분의 많은 관심과 참여 부탁드립니다.<br>감사합니다.");
        model.addAttribute("notice", noticeDetail);
        return "notice/notice_detail";
    }

    @GetMapping("/suggestion")
    public String suggestion(Model model, HttpSession session,
            @RequestParam(value = "page", defaultValue = "1") int page) {
        addCommonAttributes("202", model, session);

        // --- 페이지네이션 데이터 생성 ---
        List<Map<String, String>> suggestions = new ArrayList<>();
        suggestions.add(Map.of("no", "2", "id", "2", "title", "정보교류시스템 개선 건의", "date", "2024-08-20", "isPublic", "비공개",
                "status", "완료"));
        suggestions.add(Map.of("no", "1", "id", "1", "title", "이용 문의", "date", "2024-08-19", "isPublic", "공개", "status",
                "미완료"));
        // 추가 데이터 예시 (총 25개)
        for (int i = 3; i <= 25; i++) {
            suggestions.add(Map.of("no", String.valueOf(i), "id", String.valueOf(i), "title", "건의사항 테스트 " + i, "date",
                    "2024-08-18", "isPublic", "공개", "status", "완료"));
        }

        int currentPage = page;
        int pageSize = 10;
        int totalItems = suggestions.size();
        int totalPages = (int) Math.ceil((double) totalItems / pageSize);
        int startPage = ((currentPage - 1) / 5) * 5 + 1;
        int endPage = Math.min(startPage + 4, totalPages);

        model.addAttribute("suggestions",
                suggestions.subList((currentPage - 1) * pageSize, Math.min(currentPage * pageSize, totalItems)));
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("totalItems", totalItems);
        model.addAttribute("pageSize", pageSize);

        return "notice/suggestion";
    }

    @GetMapping("/suggestion/new")
    public String newSuggestionForm(Model model, HttpSession session) {
        addCommonAttributes("202", model, session);
        return "notice/suggestion_form";
    }

    @GetMapping("/suggestion/detail")
    public String suggestionDetail(Model model, HttpSession session,
            @RequestParam(value = "id", required = false) String id) {
        addCommonAttributes("202", model, session);
        Map<String, Object> suggestionDetail = new HashMap<>();
        suggestionDetail.put("title", "질문입니다");
        suggestionDetail.put("department", "정보시스템부");
        suggestionDetail.put("isPublic", "공개");
        suggestionDetail.put("pmaaTeam", "기금운용전략팀");
        suggestionDetail.put("content", "질문입니다");
        model.addAttribute("suggestion", suggestionDetail);
        return "notice/suggestion_detail";
    }

    // 3. 투자제안
    @GetMapping("/propvest/list")
    public String propvestList(Model model, HttpSession session,
            @RequestParam(value = "page", defaultValue = "1") int page) {
        addCommonAttributes("301", model, session);

        // --- 페이지네이션을 위한 임시 데이터 생성 ---
        List<Map<String, String>> propvestList = new ArrayList<>();
        for (int i = 1; i <= 35; i++) {
            propvestList.add(Map.of(
                    "no", String.valueOf(i),
                    "id", String.valueOf(i),
                    "title", "신규 투자 제안 " + i,
                    "proposer", "제안자" + i,
                    "date", "2025-08-" + (21 - (i % 5)),
                    "status", (i % 3 == 0) ? "검토중" : "검토완료"));
        }

        int currentPage = page;
        int pageSize = 10; // 한 페이지에 10개씩 표시
        int totalItems = propvestList.size();
        int totalPages = (int) Math.ceil((double) totalItems / pageSize);
        int startPage = ((currentPage - 1) / 5) * 5 + 1;
        int endPage = Math.min(startPage + 4, totalPages);

        // 현재 페이지에 해당하는 데이터만 잘라서 모델에 추가
        model.addAttribute("propvestList",
                propvestList.subList((currentPage - 1) * pageSize, Math.min(currentPage * pageSize, totalItems)));

        // 페이지네이션 관련 정보 모델에 추가
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("totalItems", totalItems);
        model.addAttribute("pageSize", pageSize);

        return "propvest/propvest_list";
    }

    @GetMapping("/propvest/new")
    public String newPropvestForm(Model model, HttpSession session) {
        // 상세/등록 페이지에서도 목록 메뉴(301)가 활성화되도록 설정
        addCommonAttributes("301", model, session);
        model.addAttribute("menuDetail", Map.of("menuNm", "투자제안 등록")); // 페이지 제목은 개별 설정
        return "propvest/propvest_form";
    }

    @GetMapping("/propvest/detail")
    public String propvestDetail(Model model, HttpSession session) {
        // 상세/등록 페이지에서도 목록 메뉴(301)가 활성화되도록 설정
        addCommonAttributes("301", model, session);
        model.addAttribute("menuDetail", Map.of("menuNm", "제안요청상세")); // 페이지 제목은 개별 설정
        return "propvest/propvest_detail";
    }

    // 5. 운용관리
    // 5-1. 잔고증명
    @GetMapping("/finops/balance_cert/list")
    public String balanceCertList(Model model, HttpSession session,
            @RequestParam(value = "page", defaultValue = "1") int page) {
        addCommonAttributes("501", model, session);

        List<Map<String, String>> sampleList = new ArrayList<>();
        for (int i = 1; i <= 23; i++) {
            sampleList.add(Map.of(
                    "id", String.valueOf(i),
                    "fundCode", "95151503250" + i,
                    "fundName", "KB PG 에너지인프라모특별자산투자 " + i + "호",
                    "amount", String.valueOf(10000000 * i),
                    "fileName", "잔고증명서_202508_v" + i + ".pdf"));
        }

        addPaginationAttributes(model, page, 10, sampleList);
        return "finops/balance_cert/list";
    }

    @GetMapping("/finops/balance_cert/detail")
    public String balanceCertDetail(Model model, HttpSession session, @RequestParam("id") String id) {
        addCommonAttributes("501", model, session);
        model.addAttribute("menuDetail", Map.of("menuNm", "잔고증명 상세"));
        
        // id를 기반으로 DB에서 데이터를 조회했다고 가정
        Map<String, Object> detailData = new HashMap<>();
        detailData.put("fundCode", "951515032501");
        detailData.put("fundName", "KB PG 에너지인프라모특별자산투자 1호");
        detailData.put("reportMonth", "2025-08");
        detailData.put("amount", 10000000);
        detailData.put("files", List.of("잔고증명서_202508_v1.pdf", "추가확인서_202508.pdf"));
        model.addAttribute("detail", detailData);
        
        return "finops/balance_cert/detail";
    }

    @GetMapping("/finops/balance_cert/form")
    public String balanceCertForm(Model model, HttpSession session) {
        addCommonAttributes("501", model, session);
        model.addAttribute("menuDetail", Map.of("menuNm", "잔고증명 등록"));
        return "finops/balance_cert/form";
    }

    // --- 페이지네이션 로직을 위한 헬퍼 메소드 ---
    private void addPaginationAttributes(Model model, int currentPage, int pageSize,
            List<Map<String, String>> fullList) {
        int totalItems = fullList.size();
        int totalPages = (int) Math.ceil((double) totalItems / pageSize);
        int startPage = ((currentPage - 1) / 5) * 5 + 1;
        int endPage = Math.min(startPage + 4, totalPages);

        int startIndex = (currentPage - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalItems);

        model.addAttribute("list", fullList.subList(startIndex, endIndex));
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("totalItems", totalItems);
        model.addAttribute("pageSize", pageSize);
    }

    // 5-2. 운용실적보고
    @GetMapping("/finops/report/list")
    public String reportList(Model model, HttpSession session,
            @RequestParam(value = "page", defaultValue = "1") int page) {
        addCommonAttributes("502", model, session);

        List<Map<String, String>> sampleList = new ArrayList<>();
        for (int i = 1; i <= 28; i++) {
            sampleList.add(Map.of(
                "no", String.valueOf(i),
                "id", String.valueOf(i),
                "reportDate", "2025-0" + (9 - (i % 9)),
                "fundName", "KB사모부동산신탁제" + i + "호",
                "cycle", (i % 2 == 0) ? "분기" : "월",
                "reportFile", "운용실적보고서_" + i + "차.pdf"));
        }

        addPaginationAttributes(model, page, 10, sampleList);
        return "finops/report/list";
    }

    @GetMapping("/finops/report/detail")
    public String reportDetail(Model model, HttpSession session,
            @RequestParam(value = "id", required = false) String id) {
        addCommonAttributes("502", model, session);
        model.addAttribute("menuDetail", Map.of("menuNm", "운용실적보고 상세"));

        // DB에서 조회한 데이터라고 가정한 예시 데이터
        Map<String, Object> reportData = new HashMap<>();
        reportData.put("fundCode", "951112103101");
        reportData.put("fundName", "KB스타오피스사모부동산신탁");
        reportData.put("reportCycle", "분기");
        reportData.put("reportMonth", "2025-03");
        reportData.put("overview", "종합 현황 내용입니다.");
        reportData.put("staff", "홍길동, 김철수, 이영희");
        reportData.put("staffChange", "Y");
        reportData.put("staffChangeDetail", "3/28 ddd -> ccc");
        reportData.put("compliance", "정상 준수");
        reportData.put("recentIssue", "특이사항 없음");
        reportData.put("fileName", "블라인드_펀드_세부투자_자산_입력_기업금융-test.xlsx");
        model.addAttribute("report", reportData);

        return "finops/report/detail";
    }

    @GetMapping("/finops/report/form")
    public String reportForm(Model model, HttpSession session) {
        addCommonAttributes("502", model, session);
        model.addAttribute("menuDetail", Map.of("menuNm", "운용실적보고 등록"));
        model.addAttribute("report", new HashMap<String, Object>());
        return "finops/report/form";
    }

    // 5-3. 운용관련 요청 및 보고
    @GetMapping("/finops/request/list")
    public String requestList(Model model, HttpSession session, @RequestParam(value="page", defaultValue="1") int page) {
        addCommonAttributes("503", model, session);
        
        List<Map<String, String>> sampleList = new ArrayList<>();
        for (int i = 1; i <= 15; i++) {
            sampleList.add(Map.of(
                "no", String.valueOf(i),
                "id", String.valueOf(i),
                "fundCode", "95151503250" + i,
                "fundName", "KB PG 에너지인프라모특별자산투자",
                "date", "2025-08-" + (20 - i),
                "type", (i % 3 == 0) ? "기타 보고" : "주주총회",
                "title", "운용관련 요청사항 " + i,
                "fileName", "첨부파일_" + i + ".pdf"));
        }
        
        addPaginationAttributes(model, page, 10, sampleList);
        return "finops/request/list";
    }
    
    @GetMapping("/finops/request/detail")
    public String requestDetail(Model model, HttpSession session, @RequestParam("id") String id) {
        addCommonAttributes("503", model, session);
        model.addAttribute("menuDetail", Map.of("menuNm", "운용관련 요청 및 보고 상세"));
        
        // 실제로는 DB에서 id로 데이터를 조회
        Map<String, Object> requestData = new HashMap<>();
        requestData.put("fundCode", "951112103101");
        requestData.put("fundName", "KB와이즈스타전문투자형사모부동산");
        requestData.put("reportType", "주주총회");
        requestData.put("date", "2025-05-10");
        requestData.put("title", "주주총회 결과 보고");
        requestData.put("content", "주요 내용입니다.");
        requestData.put("fileName", "주총결과보고서.pdf");
        model.addAttribute("request", requestData);
        
        return "finops/request/detail";
    }

    @GetMapping("/finops/request/form")
    public String requestForm(Model model, HttpSession session) {
        addCommonAttributes("503", model, session);
        model.addAttribute("menuDetail", Map.of("menuNm", "운용관련 요청 및 보고 등록"));
        model.addAttribute("request", new HashMap<String, Object>());
        return "finops/request/form";
    }

    // 5-4. 편입자산 세부내역
    @GetMapping("/finops/asset/list")
    public String assetList(Model model, HttpSession session, @RequestParam(value="page", defaultValue="1") int page) {
        addCommonAttributes("504", model, session);
        
        List<Map<String, String>> sampleList = new ArrayList<>();
        sampleList.add(Map.of("id", "1", "investType", "test", "overview", "test", "category", "주거시설", "detailCategory", "분양아파트", "country", "대한민국"));
        // 추가 데이터
        for (int i = 2; i <= 18; i++) {
            sampleList.add(Map.of("id", String.valueOf(i), "investType", "기업 " + i, "overview", "투자 개요 " + i, "category", "오피스", "detailCategory", "상업용 오피스", "country", "미국"));
        }
        
        addPaginationAttributes(model, page, 10, sampleList);
        return "finops/asset/list";
    }

    @GetMapping("/finops/asset/detail")
    public String assetDetail(Model model, HttpSession session, @RequestParam("id") String id) {
        addCommonAttributes("504", model, session);
        model.addAttribute("menuDetail", Map.of("menuNm", "편입자산 세부내역 상세"));
        
        // id를 기반으로 DB에서 데이터를 조회했다고 가정
        Map<String, Object> assetData = new HashMap<>();
        assetData.put("fundCode", "951515032501");
        assetData.put("fundName", "KBPG에너지인프라모특별자산신탁");
        assetData.put("reInvestFund", "선택"); // 예시 값
        assetData.put("investType", "test");
        assetData.put("overview", "test");
        assetData.put("category", "주거시설");
        assetData.put("detailCategory", "분양아파트");
        assetData.put("country", "대한민국");
        model.addAttribute("asset", assetData);
        
        return "finops/asset/detail";
    }

    @GetMapping("/finops/asset/form")
    public String assetForm(Model model, HttpSession session) {
        addCommonAttributes("504", model, session);
        model.addAttribute("menuDetail", Map.of("menuNm", "편입자산 세부내역 등록"));
        model.addAttribute("asset", new HashMap<String, Object>()); // 빈 객체 전달
        return "finops/asset/form";
    }


    // --- 신규 메뉴 페이지 (임시) ---
    // 실제 페이지가 만들어지기 전까지는 임시로 메인 페이지로 이동시킵니다.
    // @GetMapping("/propvest") public String propvest() { return "redirect:/"; }
    @GetMapping("/prorate")
    public String prorate() {
        return "redirect:/";
    }

    // @GetMapping("/finops") public String finops() { return "redirect:/"; }
    @GetMapping("/investtalk")
    public String investtalk() {
        return "redirect:/";
    }

    @GetMapping("/dms")
    public String dms() {
        return "redirect:/";
    }

    // --- 로그인/회원가입 ---
    @GetMapping("/member/MberInsertView.do")
    public String signup(Model model) {
        model.addAttribute("isSignupPage", true);
        return "member/signup";
    }

    @PostMapping("/login")
    @ResponseBody
    public Map<String, Object> loginProcess(@RequestParam("username") String username,
            @RequestParam("password") String password,
            HttpServletRequest request) {
        Map<String, Object> response = new HashMap<>();
        if ("test".equals(username) && "1111".equals(password)) {
            HttpSession session = request.getSession();
            session.setAttribute("userName", "테스트");
            response.put("success", true);
        } else {
            response.put("success", false);
            response.put("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
        }
        return response;
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }
}