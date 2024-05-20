package org.fullstack4.shareprj.domain;

import lombok.*;

import java.time.LocalDateTime;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BbsVO {
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
