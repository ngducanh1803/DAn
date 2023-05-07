package com.tmp.service.impl;

import com.tmp.dto.KhachDatDto;
import com.tmp.entity.KhachDat;
import com.tmp.entity.KhachSan;
import com.tmp.repository.IKhachDatRepository;
import com.tmp.repository.IKhachSanRepository;
import com.tmp.service.IKhachDatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class KhachDatService implements IKhachDatService {

    @Autowired
    private IKhachDatRepository repository;
    @Autowired
    private IKhachSanRepository khachSanRepository;

    @Override
    public List<KhachDatDto> getKDAll() {
        List<KhachDatDto> list = new ArrayList<>();
        for(KhachDat kd: repository.findAll()){
            list.add(new KhachDatDto(kd));
        }
        return list;
    }

    @Override
    public KhachDatDto getByIdKD(int id) {
        KhachDat ks = repository.findById(id).get();
        return new KhachDatDto(ks);
    }

    @Override
    public KhachDatDto createKD(KhachDatDto ks) {
        KhachDat khachDat = new KhachDat();
        KhachSan ksan = khachSanRepository.getById(ks.getIdKS());
        khachDat.setHoTen(ks.getHoTen());
        khachDat.setSdt(ks.getSdt());
        khachDat.setEmail(ks.getEmail());
        khachDat.setDiaChi(ks.getDiaChi());
        khachDat.setYeuCau(ks.getYeuCau());
        khachDat.setKsan(ksan);
        repository.save(khachDat);
        return new KhachDatDto(khachDat);
    }

    @Override
    public KhachDatDto updateKD(int id, KhachDatDto ks) {
        KhachDat kd = repository.findById(id).get();
        kd.setHoTen(ks.getHoTen());
        kd.setSdt(ks.getSdt());
        kd.setEmail(ks.getEmail());
        kd.setDiaChi(ks.getDiaChi());
        kd.setYeuCau(ks.getYeuCau());
        repository.save(kd);
        return new KhachDatDto(kd);
    }

    @Override
    public void deteleKD(int id) {
        repository.deleteById(id);
    }
}
