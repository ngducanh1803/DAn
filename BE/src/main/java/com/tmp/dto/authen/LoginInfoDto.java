package com.tmp.dto.authen;

import com.tmp.entity.ChucVu;
import com.tmp.entity.UserStatus;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@Setter
@Getter
@NoArgsConstructor
public class LoginInfoDto {
    private int id;
    private String ten;
    private String chucVu;
    private String email;
    private String token; // save token
    private String refreshToken;
    private UserStatus status;
}
