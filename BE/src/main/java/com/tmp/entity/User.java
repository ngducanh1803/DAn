package com.tmp.entity;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Setter
@Getter
@NoArgsConstructor
@Table(name = "user")
public class User implements Serializable {
    @Column(name = "id")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "ten")
    private String ten;

    @Column(name = "cmnd")
    private String cmnd;

    @Column(name = "diaChi")
    private String diaChi;

    @Column(name = "sdt")
    private String sdt;

    @Column(name = "email")
    private String email;

    @Column(name = "ghichu")
    private String ghiChu;

    @Column(name = "username" , length = 30)
    private String userName;

    @Column(name = "password")
    private String password;

    @ManyToOne
    @JoinColumn(name = "id_cv")
    private ChucVu chucVu;

    @Column(name = "`avatarUrl`")
    private String avatarUrl;

    @Enumerated(EnumType.ORDINAL)
    @Column(name = "`Status`")
    private UserStatus status = UserStatus.NOT_ACTIVE;
}
