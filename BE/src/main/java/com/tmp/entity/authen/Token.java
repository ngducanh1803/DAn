package com.tmp.entity.authen;

import com.tmp.entity.User;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "`Token`")
@Data
@NoArgsConstructor
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)//Kế thừa
@DiscriminatorColumn(name = "Type", discriminatorType = DiscriminatorType.STRING)
public class Token implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "`id`", unique = true, nullable = false)
    private int id;

    @Column(name = "`token`", nullable = false, unique = true)
    private String token;

    @OneToOne
    @JoinColumn(nullable = false, name = "UserID")
    private User users;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "`expiryDate`", nullable = false)
    private Date expiryDate;

    public Token(String token, User users, long expiryTime) {
        this.token = token;
        this.users = users;
        expiryDate = new Date(System.currentTimeMillis() + expiryTime);//expiryTime đã được cấu hình trong file properties
    }
}
