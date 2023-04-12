package com.tmp.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "chucvu")
public class ChucVu {
    @Column(name = "id_cv")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "tencv")
    private String tenCV;
}
