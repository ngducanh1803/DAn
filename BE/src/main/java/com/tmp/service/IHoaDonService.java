package com.tmp.service;

import com.tmp.dto.ChiTietTourDto;
import com.tmp.entity.HoaDon;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IHoaDonService {
    List<HoaDon> getAllHoaDon();

    HoaDon addHoaDon(HoaDon hoaDon);

    HoaDon updateHoaDon(int id, HoaDon dto);

    HoaDon getById(int id);

    void deleteById(int id);
}
