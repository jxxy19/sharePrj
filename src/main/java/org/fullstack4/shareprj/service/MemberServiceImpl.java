package org.fullstack4.shareprj.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.shareprj.domain.MemberVO;
import org.fullstack4.shareprj.dto.BbsDTO;
import org.fullstack4.shareprj.dto.LoginDTO;
import org.fullstack4.shareprj.dto.MemberDTO;
import org.fullstack4.shareprj.mapper.MemberMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;


@Log4j2
@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberServiceIf{
    private final MemberMapper memberMapper;
    private final ModelMapper modelMapper;

    @Override
    public int idCheck(String memberId) {
        int result = memberMapper.idCheck(memberId);
        return result;
    }

    @Override
    public int join(MemberDTO memberDTO) {
        MemberVO memberVO = modelMapper.map(memberDTO, MemberVO.class);
        int result = memberMapper.join(memberVO);

        log.info("MemberServiceImpl >> memberVO : " + memberVO.toString());
        log.info("MemberServiceImpl >> result : " + result);
        return result;
    }

    @Override
    public MemberDTO login_info(LoginDTO loginDTO) {
            log.info("===============================");
            log.info("memberId, pwd : " + loginDTO.getMemberId() + loginDTO.getPwd());
            log.info("===============================");

            MemberVO memberVO = memberMapper.login_info(loginDTO.getMemberId(), loginDTO.getPwd());
            log.info("memberVO : " +memberVO);

            MemberDTO memberDTO = null;
            if( memberVO != null && memberVO.getPwd().equals(loginDTO.getPwd())){
                memberDTO = modelMapper.map(memberVO, MemberDTO.class);
            }
            return memberDTO;
    }
    @Override
    public List<MemberDTO> memberList() {
        List<MemberDTO> memberList = memberMapper.memberList().stream()
                .map(vo->modelMapper.map(vo, MemberDTO.class))
                .collect(Collectors.toList());
        return memberList;
    }

    @Override
    public int loginDate(String memberId) {
        int result = memberMapper.loginDate(memberId);
        return result;
    }

    @Override
    public int loginCnt(String memberId) {
        int result = memberMapper.loginCnt(memberId);
        return result;
    }

    @Override
    public String loginId(String memberId) {
        String id = memberMapper.loginId(memberId);
        return id;
    }
}
