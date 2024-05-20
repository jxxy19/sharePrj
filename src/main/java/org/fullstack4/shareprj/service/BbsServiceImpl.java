package org.fullstack4.shareprj.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack4.shareprj.domain.BbsVO;
import org.fullstack4.shareprj.domain.ShareListVO;
import org.fullstack4.shareprj.domain.ShareMineVO;
import org.fullstack4.shareprj.dto.*;
import org.fullstack4.shareprj.mapper.BbsMapper;
import org.fullstack4.shareprj.mapper.MemberMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class BbsServiceImpl implements BbsServiceIf{
    private final ModelMapper modelMapper;
    private final BbsMapper bbsMapper;
    private final MemberMapper memberMapper;
    @Override
    public int regist(BbsDTO bbsDTO) {
        BbsVO bbsVO = modelMapper.map(bbsDTO, BbsVO.class);
        int result = bbsMapper.regist(bbsVO);
        log.info(bbsVO.getBbsIdx());
        return bbsVO.getBbsIdx();
    }

    @Override
    public int shareList(ShareListDTO shareListDTO) {
        ShareListVO shareListVO = modelMapper.map(shareListDTO, ShareListVO.class);
        int result = bbsMapper.shareList(shareListVO);
//        log.info(shareListVO.getBbsIdx());
        return result;
    }
    @Override
    public List<BbsDTO> studyList() {
        List<BbsDTO> bbsDTOList = bbsMapper.studyList().stream()
                .map(vo->modelMapper.map(vo, BbsDTO.class))
                .collect(Collectors.toList());

        return bbsDTOList;
    }

    @Override
    public int bbsTotalCount(PageRequestDTO requestDTO) {
        return bbsMapper.bbsTotalCount(requestDTO);
    }

    @Override
    public int shareTotalCount(PageRequestDTO requestDTO) {
        return bbsMapper.shareTotalCount(requestDTO);
    }

    @Override
    public PageResponseDTO<BbsDTO> studyListByPage(PageRequestDTO pageRequestDTO) {
        List<BbsVO> voList = bbsMapper.studyListByPage(pageRequestDTO);
        List<BbsDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo,BbsDTO.class))
                .collect(Collectors.toList());
        int total_count = bbsMapper.bbsTotalCount(pageRequestDTO);
        PageResponseDTO<BbsDTO> responseDTO = PageResponseDTO.<BbsDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();
        return responseDTO;
    }
    @Override
    public PageResponseDTO<BbsDTO> studyListByPageLike(PageRequestDTO pageRequestDTO) {
        List<BbsVO> voList2 = bbsMapper.studyListByPageLike(pageRequestDTO);
        List<BbsDTO> dtoList2 = voList2.stream()
                .map(vo->modelMapper.map(vo,BbsDTO.class))
                .collect(Collectors.toList());
        int total_count = bbsMapper.bbsTotalCount(pageRequestDTO);
        PageResponseDTO<BbsDTO> responseDTO2 = PageResponseDTO.<BbsDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList2)
                .total_count(total_count)
                .build();
        return responseDTO2;

    }

    @Override
    public PageResponseDTO<ShareMineDTO> shareListMine(PageRequestDTO pageRequestDTO) {
        log.info("bbsserviceImpl >> shareListmine >>pageRequestDTO : " + pageRequestDTO);
        List<ShareMineVO> voList = bbsMapper.shareListMine(pageRequestDTO);
        List<ShareMineDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo,ShareMineDTO.class))
                .collect(Collectors.toList());
        int total_count = bbsMapper.shareTotalCount(pageRequestDTO);
        PageResponseDTO<ShareMineDTO> responseDTO = PageResponseDTO.<ShareMineDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();
        return responseDTO;
    }

    @Override
    public PageResponseDTO<ShareMineDTO> shareListOther(PageRequestDTO pageRequestDTO) {
        List<ShareMineVO> voList = bbsMapper.shareListOther(pageRequestDTO);
        List<ShareMineDTO> dtoList = voList.stream()
                .map(vo->modelMapper.map(vo,ShareMineDTO.class))
                .collect(Collectors.toList());
        int total_count = bbsMapper.shareTotalCount(pageRequestDTO);
        PageResponseDTO<ShareMineDTO> responseDTO = PageResponseDTO.<ShareMineDTO>withAll()
                .requestDTO(pageRequestDTO)
                .dtoList(dtoList)
                .total_count(total_count)
                .build();
        return responseDTO;
    }

    @Override
    public BbsDTO view(int idx) {
        BbsVO bbsVO = bbsMapper.view(idx);
        BbsDTO bbsDTO = modelMapper.map(bbsVO, BbsDTO.class);
        return bbsDTO;
    }

    @Override
    public int modify(BbsDTO bbsDTO) {
        BbsVO bbsVO = modelMapper.map(bbsDTO, BbsVO.class);
        int result = bbsMapper.modify(bbsVO);

        return result;
    }

    @Override
    public int delete(int idx) {
        int result = bbsMapper.delete(idx);
        return result;
    }

}
