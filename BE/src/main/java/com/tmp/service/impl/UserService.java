package com.tmp.service.impl;

import com.tmp.config.event.OnSendRegistrationUserConfirmViaEmailEvent;
import com.tmp.dto.PhieuDatDto;
import com.tmp.entity.User;
import com.tmp.entity.UserStatus;
import com.tmp.entity.authen.RegistrationUserToken;
import com.tmp.repository.IUserRepository;
import com.tmp.repository.authen.RegistrationUserTokenRepository;
import com.tmp.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

@Transactional
@Service
public class UserService implements IUserService {
    @Autowired
    private IUserRepository repository;

    @Autowired
    private RegistrationUserTokenRepository registrationUserTokenRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private ApplicationEventPublisher eventPublisher;

    @Value("${registration.token.expired-time}")
    private long registrationPasswordTokenExpiredTime;

    @Override
    public User getUserByUsername(String username) {
        return repository.findUserByUserName(username);
    }

    @Override
    public User findUserByEmail(String email) {
        return repository.findByEmail(email);
    }

    @Override
    public void activeUser(String token) {
        RegistrationUserToken registrationUserToken = registrationUserTokenRepository.findByToken(token);

        User user = registrationUserToken.getUsers();
        user.setStatus(UserStatus.ACTIVE);

        repository.save(user);

        registrationUserTokenRepository.deleteById(registrationUserToken.getId());
    }




    @Override
    public void createUsers(User user) {
        // create user
        user.setPassword(passwordEncoder.encode(user.getPassword())); // cái password nãy
        repository.save(user);

        // create new user registration token
        createNewRegistrationUserToken(user);

        // send email to confirm
        sendConfirmUserRegistrationViaEmail(user.getEmail());
    }

    private void createNewRegistrationUserToken(User user) {

        // create new token for confirm Registration
        final String newToken = UUID.randomUUID().toString();
        RegistrationUserToken token = new RegistrationUserToken(newToken, user, registrationPasswordTokenExpiredTime);

        registrationUserTokenRepository.save(token);
    }

    private void sendConfirmUserRegistrationViaEmail(String email) {
        eventPublisher.publishEvent(new OnSendRegistrationUserConfirmViaEmailEvent(email));
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = repository.findUserByUserName(username);

        if (user == null) {
            throw new UsernameNotFoundException(username);
        }

        return new org.springframework.security.core.userdetails.User(user.getUserName(),
                user.getPassword(),
                AuthorityUtils.createAuthorityList(user.getChucVu().toString()));
    }
}
