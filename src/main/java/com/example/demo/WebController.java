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

    // --- 전체 메뉴 데이터 (DB 대신 임시 데이터) ---
    private List<Map<String, Object>> menuData = new ArrayList<>();

    public WebController() {
        // --- 상위 메뉴 (요청하신 메뉴 모두 추가) ---
        menuData.add(Map.of("menuNo", "1", "menuNm", "자산운용조직소개", "upperMenuNo", "0", "url", "/organization/intro"));
        menuData.add(Map.of("menuNo", "2", "menuNm", "공지/건의", "upperMenuNo", "0", "url", "/notice"));
        menuData.add(Map.of("menuNo", "3", "menuNm", "투자제안", "upperMenuNo", "0", "url", "/propvest"));
        menuData.add(Map.of("menuNo", "4", "menuNm", "금리제안", "upperMenuNo", "0", "url", "/prorate"));
        menuData.add(Map.of("menuNo", "5", "menuNm", "운용관리", "upperMenuNo", "0", "url", "/finops"));
        menuData.add(Map.of("menuNo", "6", "menuNm", "세미나/미팅제안", "upperMenuNo", "0", "url", "/investtalk"));
        menuData.add(Map.of("menuNo", "7", "menuNm", "요청/리서치자료", "upperMenuNo", "0", "url", "/dms"));

        // --- 하위 메뉴 ---
        // 1. 자산운용조직소개
        menuData.add(Map.of("menuNo", "101", "menuNm", "자산운용조직 소개", "upperMenuNo", "1", "url", "/organization/intro"));
        menuData.add(Map.of("menuNo", "102", "menuNm", "조직도", "upperMenuNo", "1", "url", "/organization/chart"));
        menuData.add(Map.of("menuNo", "103", "menuNm", "찾아오시는 길", "upperMenuNo", "1", "url", "/organization/location"));
        // 2. 공지/건의
        menuData.add(Map.of("menuNo", "201", "menuNm", "공지사항", "upperMenuNo", "2", "url", "/notice"));
        menuData.add(Map.of("menuNo", "202", "menuNm", "건의사항", "upperMenuNo", "2", "url", "/suggestion"));
        
        // (참고) 다른 상위 메뉴들도 필요하다면 여기에 하위 메뉴를 추가할 수 있습니다.
    }

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
            model.addAttribute("acticeMenu", activeMenuNo);
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
    @GetMapping("/organization/intro")
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
    // 2. 공지/건의
    @GetMapping("/notice")
    public String notice(Model model, HttpSession session, @RequestParam(value="page", defaultValue="1") int page) {
        addCommonAttributes("201", model, session);
        
        // --- 페이지네이션 데이터 생성 ---
        List<Map<String, String>> noticeList = new ArrayList<>();
        noticeList.add(Map.of("id", "1", "type", "일반", "title", "정보교류시스템 오픈 안내", "date", "2025-08-20"));
        noticeList.add(Map.of("id", "2", "type", "중요", "title", "개인정보처리방침 개정 안내", "date", "2025-08-15"));
        // 추가 데이터 예시 (총 12개)
        for (int i = 3; i <= 12; i++) {
            noticeList.add(Map.of("id", String.valueOf(i), "type", "일반", "title", "일반 공지사항 " + i, "date", "2025-08-10"));
        }

        int currentPage = page;
        int pageSize = 10; // 한 페이지에 보여줄 게시글 수
        int totalItems = noticeList.size();
        int totalPages = (int) Math.ceil((double) totalItems / pageSize);
        int startPage = ((currentPage - 1) / 5) * 5 + 1;
        int endPage = Math.min(startPage + 4, totalPages);

        model.addAttribute("noticeList", noticeList.subList((currentPage - 1) * pageSize, Math.min(currentPage * pageSize, totalItems)));
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("totalItems", totalItems);
        model.addAttribute("pageSize", pageSize);

        return "notice/notice";
    }

    @GetMapping("/notice/detail")
    public String noticeDetail(Model model, HttpSession session, @RequestParam(value="id", required = false) String id) {
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
    public String suggestion(Model model, HttpSession session, @RequestParam(value="page", defaultValue="1") int page) {
        addCommonAttributes("202", model, session);
        
        // --- 페이지네이션 데이터 생성 ---
        List<Map<String, String>> suggestions = new ArrayList<>();
        suggestions.add(Map.of("no", "2", "id", "2", "title", "정보교류시스템 개선 건의", "date", "2024-08-20", "isPublic", "비공개", "status", "답변완료"));
        suggestions.add(Map.of("no", "1", "id", "1", "title", "이용 문의", "date", "2024-08-19", "isPublic", "공개", "status", "답변완료"));
        // 추가 데이터 예시 (총 25개)
        for (int i = 3; i <= 25; i++) {
            suggestions.add(Map.of("no", String.valueOf(i), "id", String.valueOf(i), "title", "건의사항 테스트 " + i, "date", "2024-08-18", "isPublic", "공개", "status", "답변대기"));
        }

        int currentPage = page;
        int pageSize = 10;
        int totalItems = suggestions.size();
        int totalPages = (int) Math.ceil((double) totalItems / pageSize);
        int startPage = ((currentPage - 1) / 5) * 5 + 1;
        int endPage = Math.min(startPage + 4, totalPages);
        
        model.addAttribute("suggestions", suggestions.subList((currentPage - 1) * pageSize, Math.min(currentPage * pageSize, totalItems)));
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
    public String suggestionDetail(Model model, HttpSession session, @RequestParam(value="id", required = false) String id) {
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

    // --- 신규 메뉴 페이지 (임시) ---
    // 실제 페이지가 만들어지기 전까지는 임시로 메인 페이지로 이동시킵니다.
    @GetMapping("/propvest") public String propvest() { return "redirect:/"; }
    @GetMapping("/prorate") public String prorate() { return "redirect:/"; }
    @GetMapping("/finops") public String finops() { return "redirect:/"; }
    @GetMapping("/investtalk") public String investtalk() { return "redirect:/"; }
    @GetMapping("/dms") public String dms() { return "redirect:/"; }
    

    // --- 로그인/회원가입 ---
    @GetMapping("/signup")
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