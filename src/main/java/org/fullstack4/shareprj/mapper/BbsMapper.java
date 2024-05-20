package org.fullstack4.shareprj.mapper;

import org.fullstack4.shareprj.domain.BbsVO;
import org.fullstack4.shareprj.domain.ShareListVO;
import org.fullstack4.shareprj.domain.ShareMineVO;
import org.fullstack4.shareprj.dto.BbsDTO;
import org.fullstack4.shareprj.dto.PageRequestDTO;
import org.fullstack4.shareprj.dto.PageResponseDTO;

import java.util.List;

public interface BbsMapper {
    int regist(BbsVO bbsVO);
    int shareList(ShareListVO shareListVO);
//    int shareList2(ShareListVO shareListVO);
//    int shareList3(ShareListVO shareListVO);
    List<BbsVO> studyList();
    int bbsTotalCount(PageRequestDTO requestDTO);
    int shareTotalCount(PageRequestDTO requestDTO);
    List<BbsVO> studyListByPage(PageRequestDTO requestDTO);
    List<BbsVO> studyListByPageLike(PageRequestDTO requestDTO);
    List<ShareMineVO> shareListMine(PageRequestDTO requestDTO);
    List<ShareMineVO> shareListOther(PageRequestDTO requestDTO);

    BbsVO view(int idx);
    int modify(BbsVO bbsVO);
    int delete (int idx);
}
