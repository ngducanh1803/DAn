package com.tmp.service.impl;

import com.tmp.entity.HoaDon;
import com.tmp.repository.IHoaDonRepository;
import com.tmp.service.IHoaDonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HoaDonService implements IHoaDonService {
    @Autowired
    private IHoaDonRepository repository;

    @Override
    public List<HoaDon> getAllHoaDon() {
        List<HoaDon> hoaDons = repository.findAll();
        return hoaDons;
    }

    @Override
    public HoaDon addHoaDon(HoaDon hoaDon) {
        HoaDon hoaDon1 = new HoaDon();
        hoaDon1.setNgayThanhToan(hoaDon.getNgayThanhToan());
        hoaDon1.setTongTien(hoaDon.getTongTien());
        hoaDon1.setTinhTrang(hoaDon.getTinhTrang());
        hoaDon1.setPhieuDat(hoaDon.getPhieuDat());
        repository.save(hoaDon1);
        return hoaDon1;
    }

    @Override
    public HoaDon updateHoaDon(int id, HoaDon dto) {
        HoaDon hoaDon1 = repository.getById(id);
        hoaDon1.setNgayThanhToan(dto.getNgayThanhToan());
        hoaDon1.setTongTien(dto.getTongTien());
        hoaDon1.setTinhTrang(dto.getTinhTrang());
        hoaDon1.setPhieuDat(dto.getPhieuDat());
        repository.save(hoaDon1);
        return hoaDon1;
    }

    @Override
    public HoaDon getById(int id) {
        return repository.getById(id);
    }

    @Override
    public void deleteById(int id) {
        repository.deleteById(id);
    }
}
