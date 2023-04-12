package com.tmp.entity;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Data
@Entity
@Table(name = "binhluan")
public class BinhLuan implements Serializable {
    @Column(name = "id_bl")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "ten")
    private String ten;

    @Column(name = "noidung")
    private String noiDung;

    @Column(name = "trangthai")
    private int trangThai;

    @Column(name = "ngaygio")
    @Temporal(TemporalType.TIMESTAMP)
    @CreationTimestamp
    private Date ngayGio;

    @ManyToOne
    @JoinColumn(name = "id_chitiet")
    private ChiTietTour chiTietTour;

}
