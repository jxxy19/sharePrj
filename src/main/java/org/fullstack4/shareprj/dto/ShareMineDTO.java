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
public class ShareMineDTO {
    private int bbsIdx;
    private String title;
    private String memberId;
    private LocalDateTime regDate;
    private String name;
}
