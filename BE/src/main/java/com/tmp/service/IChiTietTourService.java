package com.tmp.service;

import com.tmp.dto.ChiTietTourDto;
import com.tmp.entity.ChiTietTour;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface IChiTietTourService {

    Page<ChiTietTour> getAllChiTiet(Pageable pageable);

    ChiTietTourDto addChiTietTour(ChiTietTourDto dto);

    ChiTietTourDto updateChiTietTour(int id, ChiTietTourDto dto);

    ChiTietTourDto getById(int id);

    void deleteById(int id);

}
