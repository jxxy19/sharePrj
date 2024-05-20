package org.fullstack4.shareprj.service;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.shareprj.domain.MemberVO;
import org.fullstack4.shareprj.dto.LoginDTO;
import org.fullstack4.shareprj.dto.MemberDTO;

import java.util.List;

public interface MemberServiceIf {
    int idCheck(String memberId);
    int join(MemberDTO memberDTO);
    MemberDTO login_info(LoginDTO loginDTO);
    List<MemberDTO> memberList();
    int loginDate(String memberId);
    int loginCnt (String memberId);
    String loginId (String memberId);
}
