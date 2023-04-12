package com.tmp.service;

import com.tmp.dto.PhieuDatDto;
import com.tmp.entity.PhieuDat;
import com.tmp.entity.Tinh;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface ITinhService {
    Tinh updateTinh(int id, Tinh tinh);

    void deleteTinhById(int id);

    Tinh addTinh(Tinh tinh);

    Page<Tinh> getPageTinh(Pageable pageable);
}
