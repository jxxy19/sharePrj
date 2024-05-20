package org.fullstack4.shareprj.service;

import org.fullstack4.shareprj.dto.*;

import java.util.List;

public interface BbsServiceIf {
    int regist(BbsDTO bbsDTO);
    int shareList(ShareListDTO shareListDTO);
//    int shareList2(ShareListDTO shareListDTO);
//    int shareList3(ShareListDTO shareListDTO);
    List<BbsDTO> studyList();
    int bbsTotalCount(PageRequestDTO requestDTO);
    int shareTotalCount(PageRequestDTO requestDTO);
    PageResponseDTO<BbsDTO> studyListByPage(PageRequestDTO pageRequestDTO);
    PageResponseDTO<BbsDTO> studyListByPageLike(PageRequestDTO pageRequestDTO);
    PageResponseDTO<ShareMineDTO> shareListMine(PageRequestDTO pageRequestDTO);
    PageResponseDTO<ShareMineDTO> shareListOther(PageRequestDTO pageRequestDTO);

    BbsDTO view(int idx);
    int modify(BbsDTO bbsDTO);
    int delete (int idx);

}
