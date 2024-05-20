package org.fullstack4.shareprj.mapper;

import org.apache.ibatis.annotations.Param;
import org.fullstack4.shareprj.domain.MemberVO;

import java.util.List;

public interface MemberMapper {
    int idCheck(String memberId);
    int join(MemberVO membervo);
    MemberVO login_info(@Param("memberId") String memberId, @Param("pwd") String pwd);
    List<MemberVO> memberList();
    int loginDate(String memberId);
    int loginCnt (String memberId);
    String loginId (String memberId);

}
