package com.tmp.service;

import com.tmp.entity.LoaiTour;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface ILoaiTourService {
    Page<LoaiTour> getLoaiTourPaging(Pageable pageable);
}
