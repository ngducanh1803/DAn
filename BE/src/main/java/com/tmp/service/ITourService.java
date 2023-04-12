package com.tmp.service;

import com.tmp.dto.PhieuDatDto;
import com.tmp.dto.TourDto;
import com.tmp.entity.Tour;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface ITourService {
    Page<Tour> getTourPaging(Pageable pageable);

    Tour getTourById(int id);

    TourDto addTour(TourDto dto);

    TourDto updateTour(int id,TourDto dto);



}
