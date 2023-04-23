package com.tmp.service;

import com.tmp.dto.TourDto;
import com.tmp.entity.Tour;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ITourService {
    Page<Tour> getTourPaging(Pageable pageable);

    List<Tour> getAllTour();

    Tour getTourById(int id);

    TourDto addTour(TourDto dto);

    TourDto updateTour(int id,TourDto dto);

    void deleteById(int id);





}
