package org.fullstack4.shareprj.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.shareprj.dto.*;
import org.fullstack4.shareprj.service.BbsServiceIf;
import org.fullstack4.shareprj.service.MemberServiceIf;
import org.fullstack4.shareprj.util.FileUploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;


@Log4j2
@Controller
@RequestMapping(value = "/bbs")
@RequiredArgsConstructor
public class BbsController {
    @Autowired(required = false)
    private final BbsServiceIf bbsServiceIf;
    private final MemberServiceIf memberServiceIf;

    @GetMapping("/listRegi")
    public void listRegiGet ( PageRequestDTO pageRequestDTO,
                          BindingResult bindingResult,
                          RedirectAttributes redirectAttributes,
                          HttpServletRequest req,
                          Model model) {
        log.info("pageRequestDTO >> " + pageRequestDTO.toString());
        HttpSession session = req.getSession() ;
        String memberId = session.getAttribute("memberId").toString();
        if (bindingResult.hasErrors()) {
            log.info("BbsController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult);
        }
        pageRequestDTO.setMemberId(memberId);
        PageResponseDTO<BbsDTO> responseDTO = bbsServiceIf.studyListByPage(pageRequestDTO);
        log.info("bbsController >> responseDTO {}", responseDTO);
        log.info("bbsController >> pageRequestDTO {}", pageRequestDTO);
        model.addAttribute("responseDTO", responseDTO);
    }
    @GetMapping("/listLike")
    public void listLikeGet ( PageRequestDTO pageRequestDTO,
                              BindingResult bindingResult,
                              RedirectAttributes redirectAttributes,
                              HttpServletRequest req,
                              Model model) {
        HttpSession session = req.getSession() ;
        String memberId = session.getAttribute("memberId").toString();
        if (bindingResult.hasErrors()) {
            log.info("BbsController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult);
        }
        pageRequestDTO.setMemberId(memberId);
        PageResponseDTO<BbsDTO> responseDTO = bbsServiceIf.studyListByPageLike(pageRequestDTO);
        log.info("bbsController >> responseDTO {}", responseDTO);
        model.addAttribute("responseDTO", responseDTO);
    }

    @GetMapping("/shareMine")
    public void shareMineGet (PageRequestDTO pageRequestDTO,
                              BindingResult bindingResult,
                              RedirectAttributes redirectAttributes,
                              HttpServletRequest req,
                              Model model) {
        log.info("pageRequestDTO >> " + pageRequestDTO.toString());
        HttpSession session = req.getSession() ;
        String memberId = session.getAttribute("memberId").toString();
        log.info("memberId : "+ memberId);
        if (bindingResult.hasErrors()) {
            log.info("BbsController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult);
        }
        pageRequestDTO.setMemberId(memberId);
        PageResponseDTO<ShareMineDTO> responseDTO = bbsServiceIf.shareListMine(pageRequestDTO);
        log.info("bbsController >> responseDTO {}", responseDTO);
        log.info("bbsController >> pageRequestDTO {}", pageRequestDTO);
        model.addAttribute("responseDTO", responseDTO);
    }
    @GetMapping("/shareOther")
    public void shareOtherGet (PageRequestDTO pageRequestDTO,
                               BindingResult bindingResult,
                               RedirectAttributes redirectAttributes,
                               HttpServletRequest req,
                               Model model) {
        log.info("pageRequestDTO >> " + pageRequestDTO.toString());
        HttpSession session = req.getSession() ;
        String memberId = session.getAttribute("memberId").toString();
        log.info("memberId : "+ memberId);
        if (bindingResult.hasErrors()) {
            log.info("BbsController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult);
        }
        pageRequestDTO.setMemberId(memberId);
        PageResponseDTO<ShareMineDTO> responseDTO = bbsServiceIf.shareListOther(pageRequestDTO);
        log.info("bbsController >> responseDTO {}", responseDTO);
        log.info("bbsController >> pageRequestDTO {}", pageRequestDTO);
        model.addAttribute("responseDTO", responseDTO);
    }


    @GetMapping("/regist")
    public void registGet (Model model) {
        List<MemberDTO> memberList = memberServiceIf.memberList();
        model.addAttribute("memberList", memberList);
        log.info(memberList);
        log.info("등록");
    }
    @PostMapping("/regist")
    public String registPost (BbsDTO bbsDTO,
                            ShareListDTO shareListDTO,
                            RedirectAttributes redirectAttributes,
                            @RequestParam("file") MultipartFile file
    ) {
        String saveFileName = "";

        if (!file.isEmpty()) {
            saveFileName = FileUploadUtil.saveFile(file, "shareImg");
        }
        bbsDTO.setOrgFileName(file.getOriginalFilename());
        bbsDTO.setSaveFileName(saveFileName);
        int result = bbsServiceIf.regist(bbsDTO);
        log.info(bbsDTO.getBbsIdx());
        String[] shareList = bbsDTO.getShare1().split(",");
        log.info(Arrays.toString(shareList));
        for (String s : shareList) {
            shareListDTO.setMemberId(bbsDTO.getMemberId());
            shareListDTO.setBbsIdx(result);
            shareListDTO.setToMemberId(s);
            bbsServiceIf.shareList(shareListDTO);
        }
        if(result > 0 ){
            return "redirect:/bbs/listRegi";
        } else {
            return "/bbs/regist";
        }
    }
    @GetMapping("/view")
    public void viewGet(@RequestParam(name="bbsIdx", defaultValue = "0") int idx,
                        Model model) {
        BbsDTO bbsDTO = bbsServiceIf.view(idx);
        log.info(bbsDTO);
        model.addAttribute("bbs", bbsDTO);
    }

    @GetMapping("/modify")
    public void modify(@RequestParam(name="bbsIdx", defaultValue = "0") int idx,
                       Model model) {
        BbsDTO bbsDTO = bbsServiceIf.view(idx);
        model.addAttribute("bbs", bbsDTO);
    }

    @PostMapping("/modify")
    public String modifyPost(@Valid BbsDTO bbsDTO,
                             BindingResult bindingResult,
                             RedirectAttributes redirectAttributes,
                             @RequestParam("file") MultipartFile file,
                             @RequestParam(name = "oldFile") String oldFile,
                             @RequestParam(name = "oldSaveFile") String oldSaveFile,
                             Model model) {
        log.info("=========================");
        log.info("BbsController >> modifyPost()");
        if(bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors()); //휘발성속성
            redirectAttributes.addFlashAttribute("dto", bbsDTO);
            return "redirect:/bbs/modify?bbsIdx="+bbsDTO.getBbsIdx();
        }
        String saveFileName = "";
        int result = 0;
        if (!file.isEmpty()) {
            saveFileName = FileUploadUtil.saveFile(file, "shareImg");
        }
        if ( saveFileName != null && !saveFileName.isEmpty()) {
            bbsDTO.setOrgFileName(file.getOriginalFilename());
            bbsDTO.setSaveFileName(saveFileName);
            result = bbsServiceIf.modify(bbsDTO);
            FileUploadUtil.deleteFile(oldSaveFile,"shareImg");
        } else { //기존거 동일하게 업로드
            bbsDTO.setOrgFileName(oldFile);
            bbsDTO.setSaveFileName(oldSaveFile);
            result = bbsServiceIf.modify(bbsDTO);
        }
        if(result > 0 ){
            return "redirect:/bbs/view?bbsIdx="+ bbsDTO.getBbsIdx();
        } else {
            return "/bbs/modify?bbsIdx="+ bbsDTO.getBbsIdx();
        }
    }
    @PostMapping("/delete")
    public String deletePost(@RequestParam(name="bbsIdx", defaultValue = "0") int idx,
                             Model model) {
        int result=bbsServiceIf.delete(idx);
        log.info("=========================");
        if(result > 0 ){
            return "redirect:/bbs/list";
        } else {
            return "/bbs/view?bbsIdx="+idx;
        }
    }
}
