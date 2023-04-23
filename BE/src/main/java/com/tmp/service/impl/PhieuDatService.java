package com.tmp.service.impl;

import com.tmp.dto.PhieuDatDto;
import com.tmp.entity.ChiTietTour;
import com.tmp.entity.PhieuDat;
import com.tmp.entity.Tour;
import com.tmp.repository.IChiTietTourRepository;
import com.tmp.repository.IPhieuDatRepository;
import com.tmp.repository.ITourRepository;
import com.tmp.service.IPhieuDatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PhieuDatService implements IPhieuDatService {
    @Autowired
    private IPhieuDatRepository phieuDatRepository;

    @Autowired
    private IChiTietTourRepository chiTietTourRepository;

    @Autowired
    private ITourRepository tourRepository;



    @Override
    public PhieuDatDto Update(int id, PhieuDatDto phieuDatDto) {
        PhieuDat entity = phieuDatRepository.getById(id);
        entity.setTen(phieuDatDto.getTen());
        entity.setDiaChi(phieuDatDto.getDiaChi());
//        entity.setCmnd(phieuDatDto.getCmnd());
        entity.setEmail(phieuDatDto.getEmail());
        entity.setSdt(phieuDatDto.getSdt());
        entity.setGhiChu(phieuDatDto.getGhiChu());

        entity.setTreEm(phieuDatDto.getTreEm());
        entity.setTreNho(phieuDatDto.getTreNho());
        entity.setNguoiLon(phieuDatDto.getNguoiLon());
        entity.setSoLuongDat(phieuDatDto.getSoLuongDat());
        phieuDatRepository.save(entity);
        return new PhieuDatDto(entity);
    }

    @Override
    public void deletePhieuDatById(int id) {
        phieuDatRepository.deleteById(id);
    }

    @Override
    public PhieuDatDto getById(int id) {
        PhieuDat phieuDat = phieuDatRepository.getById(id);
        return new PhieuDatDto(phieuDat);
    }

    public Tour setSlTour(int id){
        Tour tour = tourRepository.getById(id);
        tour.setSltd(tour.getSltd() - 1);
        tourRepository.save(tour);
        return tour;
    }

    public float tinhTiem(int idTour, int idP){
        Tour tour = tourRepository.getById(idTour);
        PhieuDat dat = phieuDatRepository.getById(idP);
        float thanhTien = ((tour.getGiaNguoiLon()*dat.getNguoiLon()) + (tour.getGiaTreEm()*dat.getTreEm()) + (tour.getGiaTreNho()* dat.getTreNho()));
        dat.setThanhTien(thanhTien);
        phieuDatRepository.save(dat);
        return thanhTien;
    }

    @Override
    public PhieuDatDto addKhach(PhieuDatDto phieuDatDto) {
        PhieuDat entity = new PhieuDat();
        ChiTietTour chiTietTour = chiTietTourRepository.getById(phieuDatDto.getIdChitiettour());
        entity.setTen(phieuDatDto.getTen());
        entity.setDiaChi(phieuDatDto.getDiaChi());
        entity.setEmail(phieuDatDto.getEmail());
        entity.setSdt(phieuDatDto.getSdt());
        entity.setGhiChu(phieuDatDto.getGhiChu());
        entity.setTreEm(phieuDatDto.getTreEm());
        entity.setTreNho(phieuDatDto.getTreNho());
        entity.setNguoiLon(phieuDatDto.getNguoiLon());
        entity.setSoLuongDat(phieuDatDto.getSoLuongDat());
        entity.setChiTietTour(chiTietTour);
        entity.setThanhTien(phieuDatDto.getThanhTien());
//        getPhieuDatWithGia();
        setSlTour(phieuDatDto.getIdChitiettour());
        phieuDatRepository.save(entity);
        return new PhieuDatDto(entity);
    }

    @Override
    public Page<PhieuDat> getPagePhieudat(Pageable pageable) {
        Page<PhieuDat> phieuDats = phieuDatRepository.findAll(pageable);
        return phieuDats;
    }

    @Override
    public List<PhieuDat> getAllPhieu() {
        List<PhieuDat> lists = phieuDatRepository.findAll();
        return lists;
    }

    @Override
    public List<Object[]> getPhieuDatWithGia() {
        List<Object[]> gia = phieuDatRepository.getPhieuDatWithGia();
        for (Object[] row : gia) {
            int id = (int) row[0];
            float tien = (float) row[1];
            PhieuDat phieuDat = phieuDatRepository.findById(id).orElse(null);
            if (phieuDat != null) {
                phieuDat.setThanhTien(tien);
                phieuDatRepository.save(phieuDat);
            }
        }
        return gia;
    }
}
