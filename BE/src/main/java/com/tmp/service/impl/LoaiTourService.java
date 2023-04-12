package com.tmp.service.impl;

import com.tmp.entity.LoaiTour;
import com.tmp.repository.ILoaiTourRepository;
import com.tmp.service.ILoaiTourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class LoaiTourService implements ILoaiTourService {
    @Autowired
    private ILoaiTourRepository loaiTourRepository;

    @Override
    public Page<LoaiTour> getLoaiTourPaging(Pageable pageable) {
        return loaiTourRepository.findAll(pageable);
    }
}
