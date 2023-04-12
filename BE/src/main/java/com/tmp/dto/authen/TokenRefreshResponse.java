package com.tmp.dto.authen;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@NoArgsConstructor
@SuperBuilder
public class TokenRefreshResponse {
    private int id;
    private String ten;
    private String chucVu;
    private String token; // save token
    private String refreshToken;
}
