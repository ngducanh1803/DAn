package com.tmp.dto;

import com.tmp.entity.ChiTietTour;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
public class ChiTietTourDto {
    private int id;
    private Date ngayDi;
    private Date ngayVe;
    private int soLuongCon;
    private String ghiChu;
    private String hinhAnh;
    private Integer idTour;


    public ChiTietTourDto(ChiTietTour entity){
        if (entity != null){
            this.id = entity.getIdChiTiet();
            this.ngayDi = entity.getNgayDi();
            this.ngayVe = entity.getNgayVe();
            this.soLuongCon = entity.getSoLuongCon();
            this.ghiChu = entity.getGhiChu();
            this.hinhAnh = entity.getHinhAnh();
            this.idTour = entity.getTour_chitiet().getId();

        }
    }

}
