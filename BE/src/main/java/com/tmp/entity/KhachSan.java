package com.tmp.entity;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Cleanup;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@Table(name = "KhachSan")
public class KhachSan {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_ks")
    private int idKhachSan;

    @Column(name = "ten_ks")
    private String tenKS;

    @Column(name = "noidung")
    private String noiDung;

    @Column(name = "dia_chi")
    private String diaChi;

    @Column(name = "email")
    private String email;

    @Column(name = "sdt1")
    private String sdt1;

    @Column(name = "sdt2")
    private String sdt2;

    @Column(name = "gia")
    private float gia;

    @Column(name = "hinhanh")
    private String hinhAnh;

    @JsonManagedReference
    @OneToMany(mappedBy = "ksan",cascade = CascadeType.ALL)
    private List<KhachDat> khachDats;
}
