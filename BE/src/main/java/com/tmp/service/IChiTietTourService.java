package com.tmp.service;

import com.tmp.dto.ChiTietTourDto;
import com.tmp.entity.ChiTietTour;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IChiTietTourService {

    Page<ChiTietTour> getAllChiTiet(Pageable pageable);

    List<ChiTietTour> getAll();

    ChiTietTourDto addChiTietTour(ChiTietTourDto dto);

    ChiTietTourDto updateChiTietTour(int id, ChiTietTourDto dto);

    ChiTietTourDto getById(int id);

    void deleteById(int id);

}
