package com.tmp.service;

import com.tmp.entity.User;

public interface IEmailService {
    void sendRegistrationUserConfirm(String email);

    void sendResetPassword(User user, String token);
}
