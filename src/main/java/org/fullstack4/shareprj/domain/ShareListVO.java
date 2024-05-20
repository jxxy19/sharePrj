package org.fullstack4.shareprj.domain;

import lombok.*;

import java.time.LocalDateTime;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ShareListVO {
    private int idx;
    private String memberId;
    private int bbsIdx;
    private String toMemberId;
    private LocalDateTime shareDate;
}
