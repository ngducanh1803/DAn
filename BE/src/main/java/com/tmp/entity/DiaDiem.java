package com.tmp.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Table(name = "diadiem")
public class DiaDiem implements Serializable {
    @Column(name = "id_dd")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "diemden")
    private String diemDen;

    @Column(name = "mota")
    private String moTa;

    // thieu fk
}
