package com.tmp.entity.authen;

import com.tmp.entity.User;
import lombok.NoArgsConstructor;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("RefreshToken")
@NoArgsConstructor
public class RefreshToken extends Token {
    public RefreshToken(String token, User users, long expiredTime) {
        super(token, users, expiredTime);
    }
}