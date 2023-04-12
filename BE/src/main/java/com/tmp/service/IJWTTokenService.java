package com.tmp.service;


import com.tmp.dto.authen.TokenRefreshResponse;
import com.tmp.entity.User;
import org.springframework.security.core.Authentication;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface IJWTTokenService {
    void addJWTTokenToHeader(HttpServletResponse response, String username) throws IOException;

    Authentication parseTokenToUserInformation(HttpServletRequest request);

    boolean isValidRefreshToken(String refreshToken);

    String createNewRefreshToken(User user);

    TokenRefreshResponse refreshToken(String refreshToken);
}
