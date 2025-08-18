package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model; // Model import 추가
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class WebController {

    @GetMapping("/")
    public String home() {
        return "index";
    }

    @GetMapping("/organization")
    public String organization(Model model) { // Model 파라미터 추가

        // 1. 페이지 제목과 설명 데이터 추가
        model.addAttribute("pageTitle", "자산운용조직 소개");
        model.addAttribute("pageDescription", "경찰공제회 자산운용부문은 회원의 소중한 자산을 더욱 투명하고 효율적으로 운용하기 위해 전문화된 조직체계를 갖추고 있습니다.");

        // 2. 이동 경로 (Breadcrumb) 데이터 생성
        List<Map<String, String>> breadcrumbs = new ArrayList<>();
        breadcrumbs.add(Map.of("label", "홈", "url", "/"));
        breadcrumbs.add(Map.of("label", "자산운용조직 소개", "url", "")); // 현재 페이지는 url 없음
        model.addAttribute("breadcrumbs", breadcrumbs);

        // 3. 왼쪽 사이드바 (LNB) 메뉴 데이터 생성
        List<Map<String, Object>> lnb = new ArrayList<>();
        lnb.add(Map.of("label", "자산운용조직 소개", "url", "#section-intro", "isActive", true)); // 현재 활성화된 메뉴
        lnb.add(Map.of("label", "조직도", "url", "#section-history", "isActive", false));
        lnb.add(Map.of("label", "찾아오시는 길", "url", "#", "isActive", false));
        model.addAttribute("lnbItems", lnb);


        // 4. 오른쪽 목차 (TOC) 데이터 생성
        List<Map<String, String>> toc = new ArrayList<>();
        toc.add(Map.of("label", "소개", "url", "#section-intro"));
        toc.add(Map.of("label", "연혁", "url", "#section-history"));
        model.addAttribute("tocItems", toc);

        return "organization";
    }
}