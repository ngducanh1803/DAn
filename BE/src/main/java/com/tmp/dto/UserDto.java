package com.tmp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserDto {
    private String userName;

    private String email;

    private String password;

    private String ten;

    private String chucVu;

    private String cmnd;

    private String sdt;
}
