package com.tmp.service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

import com.tmp.dto.authen.LoginInfoDto;
import com.tmp.dto.authen.TokenRefreshResponse;
import com.tmp.entity.User;
import com.tmp.entity.authen.RefreshToken;
import com.tmp.repository.authen.IRefreshTokenRepository;
import com.tmp.service.IJWTTokenService;
import com.tmp.service.IUserService;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;
import java.io.IOException;
import java.security.Key;
import java.util.Date;
import java.util.UUID;

@Transactional
@Service
public class JWTTokenService implements IJWTTokenService {
    @Value("${jwt.token.expired-time}")
    private long EXPIRATION_TIME;

    @Value("${jwt.token.secret}")
    private String SECRET;

    @Value("${jwt.token.prefix}")
    private String PREFIX_TOKEN;

    @Value("${jwt.token.authorization}")
    private String AUTHORIZATION;

    @Value("${jwt.refresh-token.expired-time}")
    private long REFRESH_EXPIRATION_TIME;

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private IUserService usersService;

    @Autowired
    private IRefreshTokenRepository refreshTokenRepository;


    /**
     * This method add jWt from Headers to Body
     */
    @Override
    public void addJWTTokenToHeader(HttpServletResponse response, String username) throws IOException {
        // get account info
        User user = usersService.getUserByUsername(username);
        // get jwt code
        String jwt = generateJWTFromUsername(username);
        String refreshToken = createNewRefreshToken(user);
        //convert account to dto
        LoginInfoDto loginInfoDto = modelMapper.map(user , LoginInfoDto.class);
        loginInfoDto.setToken(jwt);
        loginInfoDto.setRefreshToken(refreshToken);
        loginInfoDto.setChucVu(user.getChucVu().getTenCV());
        // convert to json
        ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
        String json = ow.writeValueAsString(loginInfoDto);
        // add to response body
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
        //response.addHeader(tokenAuthorization, tokenPrefix + " " + jwt);
    }

    @Override
    public Authentication parseTokenToUserInformation(HttpServletRequest request) {
        String token = request.getHeader(AUTHORIZATION);

        if (token == null) {
            return null;
        }

        token = token.replace(PREFIX_TOKEN, "");

        if (!isValidJwt(token)) {
            return null;
        }

        String username = parseJWTToUsername(token);

        User user = usersService.getUserByUsername(username);

        return user != null ?
                new UsernamePasswordAuthenticationToken(
                        username,
                        null,
                        AuthorityUtils.createAuthorityList(user.getChucVu().getTenCV())) :
                null;
    }

    @Override
    public boolean isValidRefreshToken(String refreshToken) {
        return refreshTokenRepository.existsByTokenAndExpiryDateGreaterThan(refreshToken, new Date());
    }

    @Override
    public String createNewRefreshToken(User user) {
        //Create new refresh token
        String newToken = UUID.randomUUID().toString();
        RefreshToken token = new RefreshToken(newToken, user, REFRESH_EXPIRATION_TIME);

        //Create new token
        refreshTokenRepository.save(token);

        return newToken;
    }

    @Override
    public TokenRefreshResponse refreshToken(String refreshToken) {
        RefreshToken refreshTokenEntity = refreshTokenRepository.findByToken(refreshToken);
        User user = refreshTokenEntity.getUsers();

        //create new token
        String newToken = generateJWTFromUsername(user.getUserName());
        String newRefreshToken = createNewRefreshToken(user);

        //Remove old refresh token if exists
        refreshTokenRepository.deleteByToken(refreshToken);
        return TokenRefreshResponse.builder().token(newToken).refreshToken(newRefreshToken).id(user.getId()).ten(user.getTen())
                .chucVu(user.getChucVu().getTenCV()).build();
    }

    /**
     * Check token valid
     */
    private boolean isValidJwt(String jwt) {
        try {
            Jwts.parser().setSigningKey(createKeyFromSecretToken()).parseClaimsJws(jwt);
            return true;
        } catch (Exception e) {
            return false;
        }
    }


    /**
     * Generate JWT from Username
     */
    private String generateJWTFromUsername(String username) {
        return Jwts.builder()
                .setSubject(username)
                .setExpiration(new Date(System.currentTimeMillis() + EXPIRATION_TIME))
                .signWith(SignatureAlgorithm.HS512, createKeyFromSecretToken())
                .compact();
    }

    @SuppressWarnings("unused")
    private String generateJWTFromUsername(LoginInfoDto dto) {
        return Jwts.builder()
                .setSubject(dto.getTen())
                .setExpiration(new Date(System.currentTimeMillis() + EXPIRATION_TIME))
                .signWith(SignatureAlgorithm.HS512, createKeyFromSecretToken())
                .claim("user-details", dto)
                .compact();
    }

    private String parseJWTToUsername(String token) {
        return Jwts.parser()
                .setSigningKey(createKeyFromSecretToken())
                .parseClaimsJws(token)
                .getBody()
                .getSubject();
    }

    private Key createKeyFromSecretToken() {
        byte[] apiKeySecretBytes = DatatypeConverter.parseBase64Binary(SECRET);
        return new SecretKeySpec(apiKeySecretBytes, SignatureAlgorithm.HS512.getJcaName());
    }
}