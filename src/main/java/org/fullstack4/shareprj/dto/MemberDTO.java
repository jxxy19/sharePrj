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
public class MemberDTO {
    private int memberIdx;
    private String memberId;
    private String pwd;
    private String name;
    private String phone_num1;
    private String phone_num2;
    private String phone_num3;
    private String phoneNum;
    private String email1;
    private String email2;
    private String email;
    private LocalDateTime regDate;
    private LocalDateTime lastLoginDate;
    private int loginCnt;
    private LocalDateTime leaveDate;

    public void setPhoneNum (String f, String s, String t) {
        this.phoneNum = f+"-"+s+"-"+t;
    }
    public void setEmail (String fe, String se) {
        this.email = fe+"@"+se;
    }
}

