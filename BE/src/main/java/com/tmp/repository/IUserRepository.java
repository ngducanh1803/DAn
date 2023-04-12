package com.tmp.repository;


import com.tmp.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface IUserRepository extends JpaRepository<User,Integer>, JpaSpecificationExecutor<User> {
    public User findUserByUserName (String username);

    public boolean existsByEmail(String email);

    User findByEmail(String email);
}
