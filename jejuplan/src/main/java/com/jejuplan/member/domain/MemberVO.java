package com.jejuplan.member.domain;

import java.sql.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {
    private String member_id;
    private String member_pw;
    private String member_auth;
    private String use_yn;
    private Date reg_date;
}
