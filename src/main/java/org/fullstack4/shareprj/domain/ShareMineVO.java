package org.fullstack4.shareprj.domain;

import lombok.*;

import java.time.LocalDateTime;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ShareMineVO {
    private int bbsIdx;
    private String title;
    private String memberId;
    private LocalDateTime regDate;
    private String name;
}
