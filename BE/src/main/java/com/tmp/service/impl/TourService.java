package com.tmp.service.impl;

import com.tmp.dto.PhieuDatDto;
import com.tmp.dto.TourDto;
import com.tmp.entity.ChiTietTour;
import com.tmp.entity.PhieuDat;
import com.tmp.entity.Tinh;
import com.tmp.entity.Tour;
import com.tmp.repository.IChiTietTourRepository;
import com.tmp.repository.IPhieuDatRepository;
import com.tmp.repository.ITinhRepository;
import com.tmp.repository.ITourRepository;
import com.tmp.service.ITourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class TourService implements ITourService {
    @Autowired
    private ITourRepository tourRepository;
    @Autowired
    private ITinhRepository tinhRepository;


    @Override
    public Page<Tour> getTourPaging(Pageable pageable) {
        return tourRepository.findAll(pageable);
    }

    @Override
    public Tour getTourById(int id) {
        return tourRepository.findById(id).get();
    }

    @Override
    public TourDto addTour(TourDto dto) {
        Tour tour = new Tour();
        Tinh tinh = tinhRepository.getById(dto.getIdTinh());
        tour.setPhuongTien(dto.getPhuongTien());
        tour.setSltd(dto.getSltd());
        tour.setTenTour(dto.getTenTour());
        tour.setSoNgay(dto.getSoNgay());
        tour.setSoDem(dto.getSoDem());
        tour.setGiaNguoiLon(dto.getGiaNguoiLon());
        tour.setGiaTreEm(dto.getGiaTreEm());
        tour.setGiaTreNho(dto.getGiaTreNho());
        tour.setMoTaTour(dto.getMoTaTour());
        tour.setLichTrinh(dto.getLichTrinh());
        tour.setLoaiTour(dto.getLoaiTour());
        tour.setTinh(tinh);
        tourRepository.save(tour);
        return new TourDto(tour);
    }

    @Override
    public TourDto updateTour(int id,TourDto dto) {
        Tour tour = tourRepository.getById(id);
        tour.setPhuongTien(dto.getPhuongTien());
        tour.setSltd(dto.getSltd());
        tour.setTenTour(dto.getTenTour());
        tour.setSoNgay(dto.getSoNgay());
        tour.setSoDem(dto.getSoDem());
        tour.setGiaNguoiLon(dto.getGiaNguoiLon());
        tour.setGiaTreEm(dto.getGiaTreEm());
        tour.setGiaTreNho(dto.getGiaTreNho());
        tour.setMoTaTour(dto.getMoTaTour());
        tour.setLichTrinh(dto.getLichTrinh());
        tour.setLoaiTour(dto.getLoaiTour());
        tourRepository.save(tour);
        return new TourDto(tour);
    }


}