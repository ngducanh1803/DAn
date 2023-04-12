package com.tmp.service;

import com.tmp.dto.PhieuDatDto;
import com.tmp.entity.User;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface IUserService extends UserDetailsService {
    User getUserByUsername(String username);

    User findUserByEmail(String email);

    void activeUser(String token);


    void createUsers(User users);
}
