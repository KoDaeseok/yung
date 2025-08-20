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

@Controller
public class WebController {

    // ... (home, signup, login, logout 메소드는 그대로 유지)
    @GetMapping("/")
    public String home(Model model) { // Model 추가
        model.addAttribute("activeMenu", "home"); // 홈 메뉴 활성화
        return "index";
    }
    
    // 공통 LNB 데이터 생성 메소드
    private List<Map<String, Object>> getOrganizationLnb(String activeTab) {
        List<Map<String, Object>> lnb = new ArrayList<>();
        lnb.add(Map.of("label", "자산운용조직 소개", "url", "/organization/intro", "isActive", "intro".equals(activeTab)));
        lnb.add(Map.of("label", "조직도", "url", "/organization/chart", "isActive", "chart".equals(activeTab)));
        lnb.add(Map.of("label", "찾아오시는 길", "url", "/organization/location", "isActive", "location".equals(activeTab)));
        return lnb;
    }
    // 공지/건의 LNB 데이터 생성 메소드
    private List<Map<String, Object>> getNoticeLnb(String activeTab) {
        List<Map<String, Object>> lnb = new ArrayList<>();
        lnb.add(Map.of("label", "공지사항", "url", "/notice", "isActive", "notice".equals(activeTab)));
        lnb.add(Map.of("label", "건의사항", "url", "/suggestion", "isActive", "suggestion".equals(activeTab)));
        return lnb;
    }

    // 자산운용조직 소개
    // 1. 자산운용조직 소개 페이지
    @GetMapping("/organization/intro")
    public String organizationIntro(Model model) {
        model.addAttribute("pageTitle", "자산운용조직 소개");
        model.addAttribute("sidebarTitle", "자산운용조직");
        model.addAttribute("activeMenu", "organization");
        model.addAttribute("pageDescription", "경찰공제회 자산운용부문은 회원의 소중한 자산을 더욱 투명하고 효율적으로 운용하기 위해 전문화된 조직체계를 갖추고 있습니다.");

        List<Map<String, String>> breadcrumbs = new ArrayList<>();
        breadcrumbs.add(Map.of("label", "홈", "url", "/"));
        breadcrumbs.add(Map.of("label", "자산운용조직 소개", "url", "/organization/intro"));
        
        model.addAttribute("breadcrumbs", breadcrumbs);
        model.addAttribute("lnbItems", getOrganizationLnb("intro"));
        model.addAttribute("tocItems", new ArrayList<>()); // 소개 페이지에는 TOC 없음
        return "organization_intro";
    }

    // 2. 조직도 페이지
    @GetMapping("/organization/chart")
    public String organizationChart(Model model) {
        model.addAttribute("pageTitle", "조직도");
        model.addAttribute("sidebarTitle", "자산운용조직");
        model.addAttribute("activeMenu", "organization");

        List<Map<String, String>> breadcrumbs = new ArrayList<>();
        breadcrumbs.add(Map.of("label", "홈", "url", "/"));
        breadcrumbs.add(Map.of("label", "자산운용조직 소개", "url", "/organization/intro"));
        breadcrumbs.add(Map.of("label", "조직도", "url", "")); // [수정] null -> ""

        List<Map<String, String>> toc = new ArrayList<>();
        toc.add(Map.of("label", "조직도", "url", "#section-chart"));
        toc.add(Map.of("label", "조직업무 소개", "url", "#section-members"));
        
        model.addAttribute("breadcrumbs", breadcrumbs);
        model.addAttribute("lnbItems", getOrganizationLnb("chart"));
        model.addAttribute("tocItems", toc);
        return "organization_chart";
    }
    
    // 3. 찾아오시는 길 페이지
    @GetMapping("/organization/location")
    public String organizationLocation(Model model) {
        model.addAttribute("pageTitle", "찾아오시는 길");
        model.addAttribute("sidebarTitle", "자산운용조직");
        model.addAttribute("activeMenu", "organization");
        model.addAttribute("pageDescription", "경찰공제회에 방문하시는 길을 안내해 드립니다.");

        List<Map<String, String>> breadcrumbs = new ArrayList<>();
        breadcrumbs.add(Map.of("label", "홈", "url", "/"));
        breadcrumbs.add(Map.of("label", "자산운용조직 소개", "url", "/organization/intro"));
        breadcrumbs.add(Map.of("label", "찾아오시는 길", "url", "")); // [수정] null -> ""

        List<Map<String, String>> toc = new ArrayList<>();
        toc.add(Map.of("label", "오시는 길", "url", "#section-location"));
        toc.add(Map.of("label", "교통편 안내", "url", "#section-transport"));

        model.addAttribute("breadcrumbs", breadcrumbs);
        model.addAttribute("lnbItems", getOrganizationLnb("location"));
        model.addAttribute("tocItems", toc);
        return "organization_location";
    }

    // 공지/건의
    // 공지사항 페이지
    @GetMapping("/notice")
    public String notice(Model model) {
        model.addAttribute("pageTitle", "공지사항");
        model.addAttribute("sidebarTitle", "공지/건의");
        model.addAttribute("activeMenu", "notice");

        List<Map<String, String>> breadcrumbs = new ArrayList<>();
        breadcrumbs.add(Map.of("label", "홈", "url", "/"));
        breadcrumbs.add(Map.of("label", "공지/건의", "url", "/notice"));
        breadcrumbs.add(Map.of("label", "공지사항", "url", ""));
        
        model.addAttribute("breadcrumbs", breadcrumbs);
        model.addAttribute("lnbItems", getNoticeLnb("notice"));
        return "notice";
    }

    // 건의사항 페이지
    @GetMapping("/suggestion")
    public String suggestion(Model model) {
        model.addAttribute("pageTitle", "건의사항");
        model.addAttribute("sidebarTitle", "공지/건의");
        model.addAttribute("activeMenu", "notice"); // '공지/건의' 메뉴 활성화를 위해 동일하게 설정

        List<Map<String, String>> breadcrumbs = new ArrayList<>();
        breadcrumbs.add(Map.of("label", "홈", "url", "/"));
        breadcrumbs.add(Map.of("label", "공지/건의", "url", "/notice"));
        breadcrumbs.add(Map.of("label", "건의사항", "url", ""));

        model.addAttribute("breadcrumbs", breadcrumbs);
        model.addAttribute("lnbItems", getNoticeLnb("suggestion"));
        return "suggestion";
    }

    // 회원가입
    @GetMapping("/signup")
    public String signup(Model model) {
        model.addAttribute("pageTitle", "회원가입");
        model.addAttribute("isSignupPage", true); 
        return "signup";
    }
    
    // 로그인
    @PostMapping("/login")
    @ResponseBody
    public Map<String, Object> loginProcess(@RequestParam("username") String username,
                                            @RequestParam("password") String password,
                                            HttpServletRequest request) {
        Map<String, Object> response = new HashMap<>();

        // 테스트용 계정 정보
        String testUsername = "test";
        String testPassword = "1111";
        String testName = "테스트";

        if (testUsername.equals(username) && testPassword.equals(password)) {
            // 로그인 성공
            HttpSession session = request.getSession();
            session.setAttribute("userName", testName); // 세션에 사용자 이름 저장
            response.put("success", true);
        } else {
            // 로그인 실패
            response.put("success", false);
            response.put("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
        }
        return response;
    }
    
    // 로그아웃
    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // 세션 무효화
        }
        return "redirect:/"; // 홈으로 리다이렉트
    }
}