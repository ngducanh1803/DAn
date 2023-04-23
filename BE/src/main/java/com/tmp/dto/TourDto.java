package com.tmp.dto;

import com.tmp.entity.LoaiTour;
import com.tmp.entity.Tour;
import lombok.*;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class TourDto {
    private int id;
    private String phuongTien;
    private int sltd;
    private String tenTour;
    private String xuatPhat;
    private int soNgay;
    private int soDem;
    private float giaNguoiLon;
    private float giaTreEm;
    private float giaTreNho;
    private String moTaTour;
    private String lichTrinh;
    private String banDo;
    private LoaiTour loaiTour;
//    private Integer idTinh;
//    private String diaDiem;

    public TourDto(Tour entity){
        if (entity!= null){
            this.phuongTien = entity.getPhuongTien();
            this.sltd = entity.getSltd();
            this.tenTour = entity.getTenTour();
            this.xuatPhat = entity.getXuatPhat();
            this.soNgay = entity.getSoNgay();
            this.soDem = entity.getSoDem();
            this.giaNguoiLon = entity.getGiaNguoiLon();
            this.giaTreEm = entity.getGiaTreEm();
            this.giaTreNho = entity.getGiaTreNho();
            this.moTaTour = entity.getMoTaTour();
            this.lichTrinh = entity.getLichTrinh();
            this.loaiTour = entity.getLoaiTour();
//            this.idTinh = entity.getTinh().getId();
        }
    }

}
