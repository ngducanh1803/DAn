package com.tmp.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "chitiettour")
public class ChiTietTour implements Serializable {
    @Column(name = "id_chitiet")
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idChiTiet;

    @Column(name = "ngaydi")
    @Temporal(TemporalType.TIMESTAMP)
    @CreationTimestamp
    private Date ngayDi;

    @Column(name = "ngayve")
    @Temporal(TemporalType.TIMESTAMP)
    @CreationTimestamp
    private Date ngayVe;

    @Column(name = "soluong")
    private int soLuongCon;

    @Column(name = "ghichu")
    private String ghiChu;

    @Column(name = "hinhanh")
    private String hinhAnh;

    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "id_tour")
    private Tour tour_chitiet;


    @JsonManagedReference
    @OneToMany(mappedBy = "chiTietTour", cascade = CascadeType.ALL)
    private List<PhieuDat> phieuDats;

//    @ManyToOne
//    @JoinColumn(name = "id")
//    private User user;
}
