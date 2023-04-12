package com.tmp.entity;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Setter
@Getter
@NoArgsConstructor
@Entity
@Table(name = "tinh")
public class Tinh {
    @Column(name = "id_tinh")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;


    @Column(name = "tentinh")
    private String tenTinh;

//    @OneToMany(mappedBy = "tinh")
//    private List<Tour> listTour;
}
