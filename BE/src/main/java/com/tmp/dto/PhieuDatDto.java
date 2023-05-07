package com.tmp.dto;

import com.tmp.entity.ChiTietTour;
import com.tmp.entity.PhieuDat;
import com.tmp.entity.User;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
@NoArgsConstructor
public class PhieuDatDto {
    private int id;
    private String ten;
//    private String cmnd;
    private String diaChi;
    private String sdt;
    private String email;
    private String ghiChu;
    private Date ngayDat;
    private int treEm;
    private int treNho;
    private int nguoiLon;
    private int soLuongDat;
    private double thanhTien;
    private int huy;
    private int trangThai;;
    private int idChitiettour;


    public PhieuDatDto(PhieuDat user){
        if(user!= null){
            this.id = user.getId();
            this.ten = user.getTen();
            this.ngayDat = user.getCreateDate();
            this.diaChi = user.getDiaChi();
            this.email  = user.getEmail();
            this.sdt = user.getSdt();
            this.ghiChu = user.getGhiChu();
            this.treEm = user.getTreEm();
            this.treNho = user.getTreNho();
            this.nguoiLon = user.getNguoiLon();
            this.soLuongDat = user.getSoLuongDat();
            this.thanhTien = user.getThanhTien();
            this.trangThai = user.getTrangThai();
            this.huy = user.getHuy();
            this.idChitiettour = user.getChiTietTour().getIdChiTiet();
        }
    }
}
