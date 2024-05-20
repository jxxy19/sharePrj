package org.fullstack4.shareprj.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BbsDTO {
    private int bbsIdx;
    private String title;
    private String memberId;
    private String content;
    private String todayCk;
    private String todayCkStartDate;
    private String todayCkEndDate;
    private int likeCnt;
    private String category;
    private String hashtag;
    private LocalDateTime regDate;
    private LocalDateTime modifyDate;
    private String orgFileName;
    private String saveFileName;
    private String share1;
    private String share2;
    private String share3;
    private LocalDateTime shareDate;

}
