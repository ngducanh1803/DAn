package com.tmp.service;

import com.tmp.dto.KhachDatDto;
import com.tmp.entity.KhachDat;


import java.util.List;

public interface IKhachDatService {
    List<KhachDatDto> getKDAll();

    KhachDatDto getByIdKD(int id);

    KhachDatDto createKD(KhachDatDto ks);

    KhachDatDto updateKD(int id,KhachDatDto ks);

    void deteleKD(int id);
}
