package com.tmp.entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "tintuc")
public class Tintuc {
    @Column(name = "id_tin")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "ten")
    private String tieuDe;

    @Column(name = "noidung")
    private String noiDung;

    @Column(name = "anh1")
    private String anhMot;

    @Column(name = "anh2")
    private String anhHai;

}
