package com.tmp.entity;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Data
@Entity
@Table(name = "tour")
public class Tour implements Serializable {
    @Column(name = "id_tour")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "phuongtien")
    private String phuongTien;

    @Column(name = "sltd")
    private int sltd;

    @Column(name = "tentour")
    private String tenTour;

    @Column(name = "noixuatphat")
    private String xuatPhat;

    @Column(name = "songay")
    private int soNgay;

    @Column(name = "sodem")
    private int soDem;

    @Column(name = "gianguoilon")
    private float giaNguoiLon;

    @Column(name = "giatreem")
    private float giaTreEm;

    @Column(name = "giatrenho")
    private float giaTreNho;

    @Column(name = "motatour")
    private String moTaTour;

    @Column(name = "lichtrinh")
    private String lichTrinh;

//    @Column(name = "bando")
//    private String banDo;

    @ManyToOne
    @JoinColumn(name = "id_lt")
    private LoaiTour loaiTour;

//    @ManyToOne
//    @JoinColumn(name = "id_tinh")
//    private Tinh tinh;
//
//    @ManyToOne
//    @JoinColumn(name = "id_dd")
//    private DiaDiem diaDiem;

    @JsonManagedReference
    @OneToMany(mappedBy = "tour")
    private List<ChuongTrinhTour> chuongTrinhTourList;

    @JsonManagedReference
    @OneToMany(mappedBy = "tour_chitiet")
    private List<ChiTietTour> chiTietTourList;

}
