package com.tmp.service.impl;

import com.tmp.config.resourceproperties.ServerProperty;
import com.tmp.entity.User;
import com.tmp.repository.authen.RegistrationUserTokenRepository;
import com.tmp.service.IEmailService;

import com.tmp.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService implements IEmailService {

    @Autowired
    private IUserService userService;

    @Autowired
    private RegistrationUserTokenRepository registrationUserTokenRepository;

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private ServerProperty serverProperty;

    @Override
    public void sendRegistrationUserConfirm(String email) {
        User user = userService.findUserByEmail(email);
        String token = registrationUserTokenRepository.findByUsersId(user.getId());

        String confirmationUrl = serverProperty.getUrl() +  "/api/v1/accounts/activeUser?token=" + token;

        String subject = "Xác Nhận Đăng Ký Account";
        String content = "Bạn đã đăng ký thành công. Click vào link dưới đây để kích hoạt tài khoản \n"
                + confirmationUrl;

        sendEmail(email, subject, content);
    }

    private void sendEmail(final String recipientEmail, final String subject, final String content) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(recipientEmail);
        message.setSubject(subject);
        message.setText(content);

        mailSender.send(message);
    }

    @Override
    public void sendResetPassword(User user, String token) {
        String confirmationUrl = "http://localhost:3000/auth/new-password/" + token;

        String subject = "Reset Password";
        String content = "Click on the link below to reset your password (if not you, please ignore).\n"
                + confirmationUrl;

        sendEmail(user.getEmail(), subject, content);
    }
}
