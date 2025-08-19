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

    // 조직소개 페이지를 위한 GET 메소드
    @GetMapping("/organization")
    public String organization(Model model, @RequestParam(value = "tab", defaultValue = "intro") String tab) {

        model.addAttribute("pageTitle", "자산운용조직 소개");
        model.addAttribute("sidebarTitle", "자산운용조직"); // [추가] 사이드바 제목
        model.addAttribute("activeMenu", "organization"); // [추가] organization 메뉴 활성화
        model.addAttribute("pageDescription", "경찰공제회 자산운용부문은 회원의 소중한 자산을 더욱 투명하고 효율적으로 운용하기 위해 전문화된 조직체계를 갖추고 있습니다.");
        model.addAttribute("currentTab", tab);

        // 이동 경로 (Breadcrumb) 데이터 생성
        List<Map<String, String>> breadcrumbs = new ArrayList<>();
        breadcrumbs.add(Map.of("label", "홈", "url", "/"));
        breadcrumbs.add(Map.of("label", "자산운용조직 소개", "url", "/organization"));
        
        // 왼쪽 사이드바 (LNB) 메뉴 데이터 동적 생성
        List<Map<String, Object>> lnb = new ArrayList<>();
        lnb.add(Map.of("label", "자산운용조직 소개", "url", "/organization?tab=intro", "isActive", "intro".equals(tab)));
        lnb.add(Map.of("label", "조직도", "url", "/organization?tab=chart", "isActive", "chart".equals(tab)));
        lnb.add(Map.of("label", "찾아오시는 길", "url", "/organization?tab=location", "isActive", "location".equals(tab)));
        model.addAttribute("lnbItems", lnb);

        // 오른쪽 목차 (TOC) 데이터 동적 생성
        List<Map<String, String>> toc = new ArrayList<>();
        if ("intro".equals(tab)) {
            toc.add(Map.of("label", "소개", "url", "#section-intro"));
            toc.add(Map.of("label", "연혁", "url", "#section-history"));
        } else if ("chart".equals(tab)) {
            toc.add(Map.of("label", "조직도", "url", "#section-chart"));
            toc.add(Map.of("label", "조직업무 소개", "url", "#section-members"));
        } else if ("location".equals(tab)) {
            toc.add(Map.of("label", "오시는 길", "url", "#section-location"));
        }

        model.addAttribute("breadcrumbs", breadcrumbs);
        model.addAttribute("tocItems", toc);
        return "organization";
    }

    @GetMapping("/signup")
    public String signup(Model model) {
        model.addAttribute("pageTitle", "아이디요청");
        model.addAttribute("isSignupPage", true); 
        return "signup";
    }
    
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
    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // 세션 무효화
        }
        return "redirect:/"; // 홈으로 리다이렉트
    }
}