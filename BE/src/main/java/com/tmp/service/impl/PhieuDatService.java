package com.tmp.service.impl;

import com.tmp.dto.PhieuDatDto;
import com.tmp.entity.ChiTietTour;
import com.tmp.entity.PhieuDat;
import com.tmp.repository.IChiTietTourRepository;
import com.tmp.repository.IPhieuDatRepository;
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


    public ChiTietTour setSlTour(int id){
        ChiTietTour chiTietTour = chiTietTourRepository.getById(id);
        chiTietTour.setSoLuongCon(chiTietTour.getSoLuongCon() - 1);
        chiTietTourRepository.save(chiTietTour);
        return chiTietTour;
    }

    @Override
    public PhieuDatDto addKhach(PhieuDatDto phieuDatDto) {
        PhieuDat entity = new PhieuDat();
        ChiTietTour chiTietTour = chiTietTourRepository.getById(phieuDatDto.getIdChitiettour());
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
        entity.setChiTietTour(chiTietTour);
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
    public List<PhieuDat> getAll() {
        List<PhieuDat> list = phieuDatRepository.findAll();
        return list;
    }
}
