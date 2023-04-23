package com.tmp.service;

import com.tmp.dto.PhieuDatDto;
import com.tmp.entity.PhieuDat;
import com.tmp.entity.Tour;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IPhieuDatService {
    Page<PhieuDat> getPagePhieudat(Pageable pageable);

    List<PhieuDat> getAllPhieu();

    PhieuDatDto Update(int id, PhieuDatDto phieuDatDto);

    void deletePhieuDatById(int id);

    PhieuDatDto getById(int id);

    PhieuDatDto addKhach(PhieuDatDto phieuDatDto);

    List<Object[]> getPhieuDatWithGia();


}
