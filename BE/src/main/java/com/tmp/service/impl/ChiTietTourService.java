package com.tmp.service.impl;

import com.tmp.dto.ChiTietTourDto;
import com.tmp.entity.ChiTietTour;
import com.tmp.entity.Tour;
import com.tmp.repository.IChiTietTourRepository;
import com.tmp.repository.ITourRepository;
import com.tmp.service.IChiTietTourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ChiTietTourService implements IChiTietTourService {

    @Autowired
    private IChiTietTourRepository repository;
    @Autowired
    private ITourRepository tourRepository;

    @Override
    public Page<ChiTietTour> getAllChiTiet(Pageable pageable) {
        Page<ChiTietTour> chiTietTours = repository.findAll(pageable);

        return chiTietTours;
    }

    @Override
    public List<ChiTietTourDto> getAll(){
        List<ChiTietTourDto> lists = new ArrayList<>();
        for (ChiTietTour dto: repository.findAll()){
            lists.add(new ChiTietTourDto(dto));
        }
        return lists;
    }

    @Override
    public ChiTietTourDto addChiTietTour(ChiTietTourDto dto) {
        ChiTietTour chiTietTour = new ChiTietTour();
        Tour tour = tourRepository.getById(dto.getIdTour());
        chiTietTour.setNgayDi(dto.getNgayDi());
        chiTietTour.setNgayVe(dto.getNgayVe());
        chiTietTour.setSoLuongCon(dto.getSoLuongCon());
        chiTietTour.setGhiChu(dto.getGhiChu());
        chiTietTour.setHinhAnh(dto.getHinhAnh());
        chiTietTour.setTour_chitiet(tour);
        repository.save(chiTietTour);
        return new ChiTietTourDto(chiTietTour);
    }

    @Override
    public ChiTietTourDto updateChiTietTour(int id, ChiTietTourDto dto) {
        ChiTietTour chiTietTour = repository.getById(id);
        chiTietTour.setNgayDi(dto.getNgayDi());
        chiTietTour.setNgayVe(dto.getNgayVe());
        chiTietTour.setSoLuongCon(dto.getSoLuongCon());
        chiTietTour.setGhiChu(dto.getGhiChu());
        chiTietTour.setHinhAnh(dto.getHinhAnh());
        repository.save(chiTietTour);
        return new ChiTietTourDto(chiTietTour);
    }

    @Override
    public ChiTietTourDto getById(int id) {
        ChiTietTour chiTietTour = repository.getById(id);
        return new ChiTietTourDto(chiTietTour);
    }

    @Override
    public void deleteById(int id) {
        repository.deleteById(id);
    }
}
