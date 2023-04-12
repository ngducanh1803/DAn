package com.tmp.controller;


import com.tmp.dto.UserDto;
import com.tmp.dto.PhieuDatDto;
import com.tmp.dto.authen.TokenRefreshRequest;
import com.tmp.dto.authen.TokenRefreshResponse;
import com.tmp.entity.User;
import com.tmp.service.IJWTTokenService;
import com.tmp.service.IUserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "api/v1/users")
@Validated
public class UserController {

    @Autowired
    private IUserService userService;

    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private IJWTTokenService jwtTokenService;

    /**
     * This method refresh token
     */
    @PostMapping("/token/refresh")
    public ResponseEntity<?> refreshToken(@RequestBody TokenRefreshRequest refreshToken) {
        if (!jwtTokenService.isValidRefreshToken(refreshToken.getRefreshToken())) {
            return new ResponseEntity<>("Refresh Token is invalid!", HttpStatus.SERVICE_UNAVAILABLE);
        }

        TokenRefreshResponse newTokenDto = jwtTokenService.refreshToken(refreshToken.getRefreshToken());
        return new ResponseEntity<>(newTokenDto, HttpStatus.OK);
    }


    /**
     * This method create User
     */
    @PostMapping()
    public ResponseEntity<?> createUser(@RequestBody UserDto dto) {
        User user = modelMapper.map(dto, User.class);
        // create User
        userService.createUsers(user);

        return new ResponseEntity<>("We have sent 1 email. Please check email to active account!", HttpStatus.OK);
    }

    /**
     * This method is active Account
     */
    @GetMapping("/activeAccount")
    public ResponseEntity<?> activeUserViaEmail(@RequestParam String token) {

        // active user  // để a vào mail bên này xem nó bị cái nhập kia k no
        userService.activeUser(token);

        return new ResponseEntity<>("Active success!", HttpStatus.OK);
    }


}
