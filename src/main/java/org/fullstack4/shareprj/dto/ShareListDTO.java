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
public class ShareListDTO {
    private int idx;
    private String memberId;
    private int bbsIdx;
    private String toMemberId;
    private LocalDateTime shareDate;
}
