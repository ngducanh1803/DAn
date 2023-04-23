package com.tmp.entity;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;


@Data
@Entity
@Table(name = "loaitour")
public class LoaiTour implements Serializable {

    @Column(name = "id_lt")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "tenlt")
    private String ten;


//    @OneToMany(mappedBy = "loaiTour")
//    private List<Tour> listTour;
}
