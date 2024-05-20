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
public class LoginDTO {

    private String memberId;
    private String pwd;
    private String saveId;
    private LocalDateTime lastLoginDate;
    private int loginCnt;

}
