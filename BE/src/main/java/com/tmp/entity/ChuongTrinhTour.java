package com.tmp.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

@Data
@Entity
@Table(name = "chuongtrinhtour")
public class ChuongTrinhTour implements Serializable {
    @Column(name = "id_chuongtrinh")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "tieude")
    private String tieuDe;

    @Column(name = "ngaythu")
    private int ngayThu;

    @Column(name = "mota")
    private String moTa;

    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "id_tour")
    private Tour tour;
}
