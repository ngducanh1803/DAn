package com.tmp.entity.authen;

import com.tmp.entity.User;

import lombok.NoArgsConstructor;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("ResetPasswordToken")
@NoArgsConstructor
public class ResetPasswordToken extends Token {
    public ResetPasswordToken(String token, User user, long expiryTime) {
        super(token, user, expiryTime);
    }
}
