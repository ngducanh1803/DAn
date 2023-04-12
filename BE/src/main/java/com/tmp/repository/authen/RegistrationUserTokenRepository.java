package com.tmp.repository.authen;

import com.tmp.entity.authen.RegistrationUserToken;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;


public interface RegistrationUserTokenRepository extends JpaRepository<RegistrationUserToken, Integer> {

    public RegistrationUserToken findByToken(String token);

    public boolean existsByToken(String token);

    @Query("	SELECT 	token	"
            + "	FROM 	RegistrationUserToken "
            + " WHERE 	users.id = :userID")
    public String findByUsersId(int userID);

    @Transactional
    @Modifying
    @Query("	DELETE 							"
            + "	FROM 	RegistrationUserToken 	"
            + " WHERE 	users.id = :userId")
    public void deleteByUsersId(int userId);

}
