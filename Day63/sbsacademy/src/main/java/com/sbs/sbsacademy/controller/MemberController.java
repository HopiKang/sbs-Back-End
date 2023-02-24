package com.sbs.sbsacademy.controller;

import com.sbs.sbsacademy.lombok.Member;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

// redirect 사용법
@Slf4j
@Controller
public class MemberController {
    @GetMapping("/registerForm")
    public String registerForm(Model model) {
        log.info("registerForm");

        Member member = new Member();
        member.setUserId("innovation");
        member.setUserName("아이유");

        model.addAttribute("member", member);

        return "registerForm";
    }

    @PostMapping("/register")
    public String register(Member member){


        log.info("register");
        log.info("member.getUserid() = " + member.getUserId());
        log.info("member.getUserName() = " + member.getUserName());

//        메세지출력
        return "redirect:/result";
    }

//    @GetMapping("/result")
//    public String result(){
//        return "result";
//    }
}
