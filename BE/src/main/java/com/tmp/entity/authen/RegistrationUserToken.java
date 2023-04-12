package com.tmp.entity.authen;

import com.tmp.entity.User;
import lombok.NoArgsConstructor;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;


@Entity
@DiscriminatorValue("RegistrationUserToken")
@NoArgsConstructor
public class RegistrationUserToken extends Token {

    public RegistrationUserToken(String token, User user, long expiryTime) {
        super(token, user, expiryTime);
    }
}
