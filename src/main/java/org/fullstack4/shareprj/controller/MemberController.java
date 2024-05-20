package org.fullstack4.shareprj.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.shareprj.dto.LoginDTO;
import org.fullstack4.shareprj.dto.MemberDTO;
import org.fullstack4.shareprj.service.MemberServiceIf;
import org.fullstack4.shareprj.util.CookieUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.io.PrintWriter;

@Log4j2
@Controller
@RequestMapping(value = "/member")
@RequiredArgsConstructor
public class MemberController {
    private final MemberServiceIf memberServiceIf;

    @GetMapping("/login")
    public void loginGet(HttpServletRequest req,
                         @RequestParam(name = "error", defaultValue = "") String error,
                         Model model
    ) {
        log.info("로그인 겟");
        log.info("referer : " + req.getHeader("referer"));
        String rtn_url = req.getHeader("referer");
        String save_id = CookieUtil.getCookieInfo(req, "save_id");
        req.setAttribute("rtn_url", rtn_url);
        req.setAttribute("save_id", save_id);
        req.setAttribute("error", error);
    }
    @PostMapping("/login")
    public String loginPost(@Valid LoginDTO loginDTO,
                          BindingResult bindingResult,
                          @RequestParam(name = "rtn_url", defaultValue = "/", required = false) String return_url,
                          RedirectAttributes redirectAttributes,
                          HttpServletResponse resp,
                          HttpServletRequest req,
                          HttpSession session) throws IOException {

        String id = "";
        if (loginDTO.getSaveId() == null) {
            loginDTO.setSaveId("");
        }
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", "비밀번호 아이디를 다시 체크 해주세요.");
            return "redirect:/login/login";
        }
        MemberDTO loginMemberDTO = memberServiceIf.login_info(loginDTO);
        if(loginMemberDTO != null) {
            memberServiceIf.loginDate(loginMemberDTO.getMemberId());
            id = memberServiceIf.loginId(loginDTO.getMemberId());
        }
        log.info(id);
        System.out.println("loginMemberDTO" + loginMemberDTO);

        session = req.getSession();
        if (loginMemberDTO != null) {
            if (loginDTO.getSaveId().equals("Y")) {
                CookieUtil.setCookies(resp, "save_id", loginDTO.getMemberId(), 60 * 60 * 24, "", "/");
            }
            if (loginDTO.getSaveId().isEmpty() || !loginDTO.getSaveId().equals("Y")) {
                CookieUtil.setCookies(resp, "save_id", "", 0, "", "/");
            }

            session.setAttribute("memberId", loginDTO.getMemberId());

            return "redirect:"+return_url;
        } else {
//            resp.setCharacterEncoding("UTF-8");
//            resp.setContentType("text/html; charset=UTF-8");
//            PrintWriter out = resp.getWriter();
////            window.location.href='/login/ㅣㅐ햐ㅜ'</script>
//            out.println("<script>alert('조건에 맞는 회원정보가 없습니다.'); ");
//            out.close();
            redirectAttributes.addFlashAttribute("errors", "비밀번호 아이디를 다시 체크 해주세요.");
//            redirectAttributes.addFlashAttribute("dto", loginDTO);
            return "/member/login";
        }
    }
    @GetMapping("/logout")
    public String logout(HttpSession session,
                         HttpServletResponse resp
    ) {
        log.info("로그아웃");
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/join")
    public void joinGet() {
        log.info("dd");
    }
    @PostMapping("/join")
    public String joinPost(MemberDTO memberDTO,
                         BindingResult bindingResult,
                         Model model, RedirectAttributes redirectAttributes) {
        if(bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("dto", memberDTO);
            return "redirect:/member/join";
        }
        memberDTO.setPhoneNum(memberDTO.getPhone_num1(), memberDTO.getPhone_num2(), memberDTO.getPhone_num3());
        memberDTO.setEmail(memberDTO.getEmail1(),memberDTO.getEmail2());
        int result = memberServiceIf.join(memberDTO);
        if (result > 0) {
            return "redirect:/member/login";
        } else {
            return "/member/join";
        }}

    @PostMapping("/idCheck")
    @ResponseBody
    public int idCheck(
            @RequestParam(name = "memberId", defaultValue = "") String memberId
    ) {
        int result = memberServiceIf.idCheck(memberId);
        return result;
    }

}
