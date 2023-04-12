package com.tmp.entity;


import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@Entity
@Table(name = "phieudat")
public class PhieuDat implements Serializable {
    @Column(name = "id")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "ngaydat")
    @Temporal(TemporalType.TIMESTAMP)
    @CreationTimestamp
    private Date createDate;

    @Column(name = "ten")
    private String ten;

//    @Column(name = "cmnd")
//    private String cmnd;

    @Column(name = "diaChi")
    private String diaChi;

    @Column(name = "sdt")
    private String sdt;

    @Column(name = "email")
    private String email;

    @Column(name = "treem")
    private int treEm;

    @Column(name = "trenho")
    private int treNho;

    @Column(name = "nguoilon")
    private int nguoiLon;

    @Column(name = "soluongdat")
    private int soLuongDat;

    @Column(name = "trangthai")
    private int trangThai;

    @Column(name = "ghichu")
    private String ghiChu;

    @Column(name = "huy")
    private int huy;

    @Column(name = "thanhtien")
    private float thanhTien;

    @ManyToOne
    @JoinColumn(name = "id_chitiet")
    private ChiTietTour chiTietTour;

    @JsonBackReference
    @OneToMany(mappedBy = "phieuDat")
    private List<HoaDon> hoaDons;



}
