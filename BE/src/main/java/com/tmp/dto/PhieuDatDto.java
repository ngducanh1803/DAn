package com.tmp.dto;

import com.tmp.entity.ChiTietTour;
import com.tmp.entity.PhieuDat;
import com.tmp.entity.User;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

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
    private int treEm;
    private int treNho;
    private int nguoiLon;
    private int soLuongDat;
    private int idChitiettour;


    public PhieuDatDto(PhieuDat user){
        if(user!= null){
            this.ten = user.getTen();
//            this.cmnd = user.getCmnd();
            this.diaChi = user.getDiaChi();
            this.email  = user.getEmail();
            this.sdt = user.getSdt();
            this.ghiChu = user.getGhiChu();
            this.treEm = user.getTreEm();
            this.treNho = user.getTreNho();
            this.nguoiLon = user.getNguoiLon();
            this.soLuongDat = user.getSoLuongDat();
            this.idChitiettour = user.getChiTietTour().getIdChiTiet();
        }
    }
}
