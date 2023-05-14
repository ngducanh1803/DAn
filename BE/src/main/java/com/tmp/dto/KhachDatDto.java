package com.tmp.dto;

import com.tmp.entity.ChiTietTour;
import com.tmp.entity.KhachDat;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;


@Getter
@Setter
@NoArgsConstructor
public class KhachDatDto {
    private int id_khach;
    private String hoTen;
    private String sdt;
    private String email;
    private String diaChi;
    private String yeuCau;
    private Date createDate;
    private int idKS;
    private String ksName;

    public KhachDatDto(KhachDat entity){
        if (entity != null){
            this.id_khach = entity.getId_khach();
            this.hoTen = entity.getHoTen();
            this.sdt = entity.getSdt();
            this.email = entity.getEmail();
            this.diaChi = entity.getDiaChi();
            this.yeuCau = entity.getYeuCau();
            this.createDate = entity.getCreateDate();
            this.idKS = entity.getKsan().getIdKhachSan();
            this.ksName = entity.getKsan().getTenKS();

        }
    }
}
