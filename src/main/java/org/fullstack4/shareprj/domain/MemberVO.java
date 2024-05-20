package org.fullstack4.shareprj.domain;

import lombok.*;

import java.time.LocalDateTime;

@ToString
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberVO {
    private int memberIdx;
    private String memberId;
    private String pwd;
    private String name;
    private String phoneNum;
    private String email;
    private LocalDateTime regDate;
    private LocalDateTime lastLoginDate;
    private int loginCnt;
    private LocalDateTime leaveDate;
}
